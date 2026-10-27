#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include "codegen.h"

static int is_valid_c_ident(const char *s) {
    if (!s || !s[0]) return 0;
    if (!(isalpha((unsigned char)s[0]) || s[0] == '_')) return 0;
    for (const char *p = s + 1; *p; p++)
        if (!(isalnum((unsigned char)*p) || *p == '_')) return 0;
    return 1;
}

/* Mappt TraumaLang-Bezeichner auf gueltige C-Bezeichner (TEMP-Namen enthalten Punkte). */
static void emit_ident(FILE *out, const char *s) {
    if (!s) { fputs("/*null*/", out); return; }
    for (const char *p = s; *p; p++) {
        if (isalnum((unsigned char)*p) || *p == '_') fputc(*p, out);
        else fputc('_', out);
    }
}

static void emit_cstr(FILE *out, const char *s) {
    fputc('"', out);
    for (const char *p = s ? s : ""; *p; p++) {
        if (*p == '"' || *p == '\\') { fputc('\\', out); fputc(*p, out); }
        else if (*p == '\n') fputs("\\n", out);
        else if (*p == '\t') fputs("\\t", out);
        else fputc(*p, out);
    }
    fputc('"', out);
}

static int gen_expr(TlNode *e, FILE *out, char **err) {
    if (!e) { *err = "fehlender Ausdruck"; return -1; }
    switch (e->kind) {
    case N_EXPR_NUM: fprintf(out, "%ldL", e->ival); return 0;
    case N_EXPR_STR: emit_cstr(out, e->sval); return 0;
    case N_EXPR_VAR:
        if (!is_valid_c_ident(e->name) && strcmp(e->name, "TEMP_Access_Do_Not_Use") != 0) { *err = "ungueltiger Variablenname"; return -1; }
        fputc('(', out); emit_ident(out, e->name); fputs(").num", out); return 0;
    case N_EXPR_NULL: fputs("NULL", out); return 0;
    case N_EXPR_BINOP:
        fputc('(', out);
        if (gen_expr(e->left, out, err)) return -1;
        fprintf(out, " %s ", e->sval);
        if (gen_expr(e->right, out, err)) return -1;
        fputc(')', out); return 0;
    case N_COND_PROB: fprintf(out, "tl_prob(%ld)", e->ival); return 0;
    default: *err = "Ausdruckstyp nicht generierbar"; return -1;
    }
}

/* Implizite Deklarationen: verwendete, aber nie deklarierte Variablen (z. B. die
   Bedingung `prodIsDown` im Pflichtbeispiel) erhalten eine TlVal-Nullanlage,
   damit der generierte Code kompiliert. Wird dokumentiert, nicht verschwiegen. */
typedef struct { char names[256][128]; int n; } NameSet;
static void set_add(NameSet *s, const char *name) {
    if (!name || !name[0]) return;
    for (int i = 0; i < s->n; i++) if (!strcmp(s->names[i], name)) return;
    if (s->n < 256) { strncpy(s->names[s->n], name, 127); s->names[s->n][127] = '\0'; s->n++; }
}
static void collect_uses_node(TlNode *s, NameSet *decl, NameSet *imp, int toplevel);
static void collect_uses_list(TlNodeList *l, NameSet *decl, NameSet *imp, int toplevel) {
    for (; l; l = l->next) collect_uses_node(l->node, decl, imp, toplevel);
}
static void collect_use_name(const char *name, NameSet *decl, NameSet *imp) {
    if (!name || !name[0]) return;
    for (int i = 0; i < decl->n; i++) if (!strcmp(decl->names[i], name)) return;
    set_add(imp, name);
}
static void collect_uses_expr(TlNode *e, NameSet *decl, NameSet *imp) {
    if (!e) return;
    if (e->kind == N_EXPR_VAR) collect_use_name(e->name, decl, imp);
    else if (e->kind == N_EXPR_BINOP) { collect_uses_expr(e->left, decl, imp); collect_uses_expr(e->right, decl, imp); }
    else if (e->kind == N_COND_PROB) { }
}
static void collect_uses_node(TlNode *s, NameSet *decl, NameSet *imp, int toplevel) {
    if (!s) return;
    switch (s->kind) {
    /* Nur Deklarationen der obersten Scope-Ebene zaehlen; Block-Deklarationen
       bleiben lokal (ggf. als legale Abschattung einer impliziten Anlage). */
    case N_VARDECL: if (toplevel) set_add(decl, s->name); break;
    case N_ASSIGN: collect_use_name(s->name, decl, imp); collect_uses_expr(s->left, decl, imp); break;
    case N_COPY: collect_use_name(s->name, decl, imp); collect_use_name(s->name2, decl, imp); break;
    case N_INC: case N_DEC: collect_use_name(s->name, decl, imp); break;
    case N_PRINT: collect_uses_expr(s->left, decl, imp); break;
    case N_NULL_SINK: collect_uses_expr(s->left, decl, imp); break;
    case N_IF: collect_uses_expr(s->cond, decl, imp); collect_uses_list(s->body, decl, imp, 0); collect_uses_list(s->else_body, decl, imp, 0); break;
    case N_WHILE: collect_uses_expr(s->cond, decl, imp); collect_uses_list(s->body, decl, imp, 0); break;
    case N_DIRECTIVE: collect_use_name(s->name, decl, imp); break;
    default: break;
    }
}
static void emit_implicits(TlNodeList *body, FILE *out, int ind) {
    NameSet decl; decl.n = 0;
    /* Deklarationen sammeln (ohne Funktionsruempfe zu betreten). */
    TlNodeList *l = body;
    /* Erster Durchlauf: alle VARDECL der obersten Ebene einsammeln. */
    for (; l; l = l->next)
        if (l->node->kind == N_VARDECL) set_add(&decl, l->node->name);
    NameSet imp; imp.n = 0;
    collect_uses_list(body, &decl, &imp, 1);
    for (int i = 0; i < imp.n; i++) {
        for (int k = 0; k < ind; k++) fputs("    ", out);
        fputs("TlVal ", out); emit_ident(out, imp.names[i]);
        fputs("; tl_val_init(&", out); emit_ident(out, imp.names[i]);
        fputs("); /* implizit: Verwendung ohne Deklaration */\n", out);
    }
}

static void indent(FILE *out, int n) { for (int i = 0; i < n; i++) fputs("    ", out); }

static int gen_stmt(TlNode *s, FILE *out, int ind, char **err);

static int gen_body(TlNodeList *l, FILE *out, int ind, char **err) {
    for (; l; l = l->next) if (gen_stmt(l->node, out, ind, err)) return -1;
    return 0;
}

static int gen_stmt(TlNode *s, FILE *out, int ind, char **err) {
    switch (s->kind) {
    case N_VARDECL:
        indent(out, ind);
        if (!s->name) { fprintf(out, "/* THERE IS NO LEVEL I OR II (Marker ohne Namen) */\n"); return 0; }
        fputs("TlVal ", out); emit_ident(out, s->name);
        fputs("; tl_val_init(&", out); emit_ident(out, s->name); fputs(");\n", out);
        return 0;
    case N_ASSIGN: {
        indent(out, ind);
        TlNode *e = s->left;
        if (e && e->kind == N_EXPR_STR) { fputs("tl_val_set_str(&", out); emit_ident(out, s->name); fputs(", ", out); emit_cstr(out, e->sval); fputs(");\n", out); }
        else if (e && e->kind == N_EXPR_NUM) { fputs("tl_val_set_num(&", out); emit_ident(out, s->name); fprintf(out, ", %ldL);\n", e->ival); }
        else if (e && e->kind == N_EXPR_NULL) { fputs("tl_val_set_null(&", out); emit_ident(out, s->name); fputs(");\n", out); }
        else if (e && e->kind == N_EXPR_VAR) { fputs("tl_val_copy(&", out); emit_ident(out, s->name); fputs(", &", out); emit_ident(out, e->name); fputs(");\n", out); }
        else { fputs("tl_val_set_num(&", out); emit_ident(out, s->name); fputs(", ", out); if (gen_expr(e, out, err)) return -1; fputs(");\n", out); }
        return 0;
    }
    case N_COPY:
        indent(out, ind); fputs("tl_val_copy(&", out);
        emit_ident(out, s->name); fputs(", &", out);
        emit_ident(out, s->name2); fputs(");\n", out); return 0;
    case N_INC: indent(out, ind); emit_ident(out, s->name); fputs(".num++;\n", out); return 0;
    case N_DEC: indent(out, ind); emit_ident(out, s->name); fputs(".num--;\n", out); return 0;
    case N_PRINT: {
        indent(out, ind);
        const char *fn = "tl_print_str";
        if (s->print_kind == P_SLACK) fn = "tl_slack_str";
        else if (s->print_kind == P_DATADOG) fn = "tl_datadog_str";
        else if (s->print_kind == P_CLOUD) fn = "tl_cloud_str";
        else if (s->print_kind == P_GRAFANA) fn = "tl_grafana_str";
        else if (s->print_kind == P_ESCALATE) fn = "tl_escalate_str";
        else if (s->print_kind == P_LEGACY) fn = "tl_legacy_str";
        if (s->print_kind == P_PROD_DEPLOY) {
            fputs("/* DEPLOY IT TO PROD ON FRIDAY AT 459PM */\n", out);
            indent(out, ind);
            if (s->left && s->left->kind == N_EXPR_NUM) { fputs("tl_print_long(", out); gen_expr(s->left, out, err); fputs(");\n", out); }
            else if (s->left) { fputs("tl_print_str(", out); gen_expr(s->left, out, err); fputs(");\n", out); }
            else fputs("tl_print_str(\"(deployed)\");\n", out);
            indent(out, ind); fputs("return 1; /* simulierter fehlgeschlagener Prod-Deploy */\n", out);
            return 0;
        }
        if (s->print_kind == P_CAB) {
            fputs("if (tl_cab_open()) {\n", out);
            indent(out, ind+1);
            if (s->left) { fputs("tl_print_str(", out); if (gen_expr(s->left, out, err)) return -1; fputs(");\n", out); }
            else fputs("tl_print_str(\"(cab)\");\n", out);
            indent(out, ind); fputs("}\n", out); return 0;
        }
        if (s->print_kind == P_VACATION) {
            fputs("printf(\"[VACATION] \");\n", out);
            indent(out, ind);
            if (s->left) { fputs("tl_print_str(", out); if (gen_expr(s->left, out, err)) return -1; fputs(");\n", out); }
            else fputs("tl_print_str(\"(voucher)\");\n", out);
            return 0;
        }
        if (s->print_kind == P_AD) {
            indent(out, ind);
            if (s->left) { fputs("tl_print_str(", out); if (gen_expr(s->left, out, err)) return -1; fputs(");\n", out); }
            indent(out, ind); fputs("printf(\"BitLocker key stored\\n\");\n", out); return 0;
        }
        if (s->print_kind == P_PHONE) {
            indent(out, ind);
            if (s->left) { fputs("tl_print_str(", out); if (gen_expr(s->left, out, err)) return -1; fputs(");\n", out); }
            indent(out, ind); fputs("/* secured with phone (Satire, keine echte Aenderung) */\n", out); return 0;
        }
        if (s->print_kind == P_AMIGA) {
            indent(out, ind);
            if (s->left) { fputs("tl_print_str(", out); if (gen_expr(s->left, out, err)) return -1; fputs(");\n", out); }
            indent(out, ind); fputs("/* kein Lesegeraet vorhanden (Amiga-Disk-Satire) */\n", out); return 0;
        }
        if (s->print_kind == P_TOS) {
            indent(out, ind);
            if (s->left) { fputs("tl_print_str(", out); if (gen_expr(s->left, out, err)) return -1; fputs(");\n", out); }
            indent(out, ind); fputs("/* versteckt in 4pt-Schrift (Satire) */\n", out); return 0;
        }
        if (s->print_kind == P_RESEARCH || s->print_kind == P_SBOM) {
            indent(out, ind);
            if (s->left) { fputs("tl_print_str(", out); if (gen_expr(s->left, out, err)) return -1; fputs(");\n", out); }
            indent(out, ind);
            if (s->print_kind == P_RESEARCH) fputs("/* research / orphan-resource */\n", out);
            else fputs("/* sbom-entry */\n", out);
            return 0;
        }
        if (!s->left) { fprintf(out, "%s(\"\");\n", fn); return 0; }
        if (s->left->kind == N_EXPR_VAR && (s->print_kind == P_PLAIN || s->print_kind == P_SLACK)) {
            if (s->print_kind == P_SLACK) fputs("printf(\"[SLACK] \");\n", out), indent(out, ind);
            fputs("tl_val_print(&", out); emit_ident(out, s->left->name); fputs(");\n", out); return 0;
        }
        if (s->left->kind == N_EXPR_VAR) {
            fputs("tl_val_print(&", out); emit_ident(out, s->left->name); fputs(");\n", out); return 0;
        }
        if (s->left->kind == N_EXPR_NUM) {
            /* Numerische Literale brauchen long-Varianten; andere Kanaele fallen auf plain zurueck. */
            const char *nfn = (s->print_kind == P_SLACK) ? "tl_slack_long" : "tl_print_long";
            fputs(nfn, out); fputc('(', out);
            if (gen_expr(s->left, out, err)) return -1;
            fputs(");\n", out);
            return 0;
        }
        fprintf(out, "%s(", fn); if (gen_expr(s->left, out, err)) return -1; fputs(");\n", out);
        return 0;
    }
    case N_TODO_JIRA:
        indent(out, ind); fprintf(out, "/* TODO(JIRA): %s */\n", s->name ? s->name : "todo"); return 0;
    case N_NULL_SINK:
        indent(out, ind); fputs("/* KNOWLEDGE GOES IN DOESNT COME OUT -> /dev/null */\n", out); return 0;
    case N_IF:
        indent(out, ind); fputs("if (", out);
        if (gen_expr(s->cond, out, err)) return -1;
        fputs(") {\n", out);
        if (gen_body(s->body, out, ind+1, err)) return -1;
        indent(out, ind); fputs("}", out);
        if (s->else_body) {
            fputs(" else {\n", out);
            if (gen_body(s->else_body, out, ind+1, err)) return -1;
            indent(out, ind); fputs("}\n", out);
        } else fputs("\n", out);
        return 0;
    case N_WHILE:
        indent(out, ind); fputs("while (", out);
        if (gen_expr(s->cond, out, err)) return -1;
        fputs(") {\n", out);
        if (gen_body(s->body, out, ind+1, err)) return -1;
        indent(out, ind); fputs("}\n", out); return 0;
    case N_BREAK: indent(out, ind); fputs("break;\n", out); return 0;
    case N_CONTINUE: indent(out, ind); fputs("continue;\n", out); return 0;
    case N_FUNCDEF:
        /* Funktionsdefinitionen werden in tl_codegen vor main() gehoistet (tlf_-Praefix).
           Verschachtelte Funktionsdefinitionen sind nicht unterstuetzt. */
        if (ind > 0) { *err = "verschachtelte Funktionsdefinition nicht unterstuetzt"; return -1; }
        indent(out, 0); fputs("static void tlf_", out); emit_ident(out, s->name); fputs("(void) {\n", out);
        emit_implicits(s->body, out, 1);
        if (gen_body(s->body, out, 1, err)) return -1;
        fputs("}\n", out); return 0;
    case N_FUNCCALL: indent(out, ind); fputs("tlf_", out); emit_ident(out, s->name); fputs("();\n", out); return 0;
    case N_COMMENT: indent(out, ind); fprintf(out, "/* %s */\n", s->sval ? s->sval : "satire"); return 0;
    case N_METRICS_INC: indent(out, ind); fputs("tl_metrics_inc();\n", out); return 0;
    case N_METRICS_LOOP:
        indent(out, ind); fputs("for (;;) { tl_metrics_inc(); } /* absichtlich endlos, dokumentiert */\n", out); return 0;
    case N_CHAOS: indent(out, ind); fputs("tl_chaos(); /* kontrollierte Chaos-Operation */\n", out); return 0;
    case N_RESET: indent(out, ind); fputs("/* HAVE YOU TRIED TURNING IT OFF AND ON AGAIN: Reset-Strategie siehe LANGUAGE.md */\n", out); return 0;
    case N_SLEEP_OP: indent(out, ind); fputs("tl_sync_wait(); /* WE NEED TO SYNC: 8s */\n", out); return 0;
    case N_DOUBLE_RUN:
        indent(out, ind);
        if (s->name) { fputs("tlf_", out); emit_ident(out, s->name); fputs("(); tlf_", out); emit_ident(out, s->name); fputs("(); /* double-booked: 2x sequenziell */\n", out); }
        else fputs("/* I WAS DOUBLE-BOOKED: kein Ziel, nur Marker */\n", out);
        return 0;
    case N_DIRECTIVE:
        indent(out, ind);
        if (s->sval && !strcmp(s->sval, "leak")) fputs("tl_leak_once(); /* begrenzt 4KiB, absichtlich nicht freigegeben */\n", out);
        else if (s->sval && !strcmp(s->sval, "cabus")) fputs("for (;;) { /* ASK FOR A JUSTIFICATION DOCUMENT: absichtlich endlos */ }\n", out);
        else if (s->sval && !strcmp(s->sval, "owners")) { fputs("/* I NEED OWNERS NOT RENTERS: &", out); emit_ident(out, s->name); fputs(" (Referenz-Satire) */\n", out); }
        else fputs("/* Direktive */\n", out);
        return 0;
    default: *err = "Anweisungstyp nicht generierbar"; return -1;
    }
}

/* Ein Funktionsaufruf auf oberster Ebene (kein Block): fuer den Auto-Call von main. */
static int body_has_func(TlNodeList *l, const char *name) {
    for (; l; l = l->next)
        if (l->node->kind == N_FUNCDEF && l->node->name && !strcmp(l->node->name, name)) return 1;
    return 0;
}

int tl_codegen(TlNode *prog, FILE *out, char **err_out) {
    char *err = NULL;
    fprintf(out, "/* Generiert aus TraumaLang. Startup-Banner + 8s Delay sind verpflichtend. */\n");
    fprintf(out, "#include <stdio.h>\n#include <stdlib.h>\n#include <string.h>\n");
    fprintf(out, "#include \"runtime.h\"\n\n");
    /* Pass 1: Funktionen gehoistet vor main() (tlf_-Praefix, kein Clash mit echtem main). */
    TlNodeList *l;
    for (l = prog->body; l; l = l->next)
        if (l->node->kind == N_FUNCDEF)
            if (gen_stmt(l->node, out, 0, &err)) { if (err_out) *err_out = err; return -1; }
    fprintf(out, "\nint main(void) {\n");
    fprintf(out, "    srand(1337);\n");
    fprintf(out, "    tl_startup_banner();\n");
    emit_implicits(prog->body, out, 1);
    /* Pass 2: Anweisungen der obersten Ebene (Funktionsdefinitionen ueberspringen). */
    for (l = prog->body; l; l = l->next) {
        if (l->node->kind == N_FUNCDEF) continue;
        if (gen_stmt(l->node, out, 1, &err)) { if (err_out) *err_out = err; return -1; }
    }
    if (body_has_func(prog->body, "main")) fprintf(out, "    tlf_main();\n");
    fprintf(out, "    return 0;\n}\n");
    return 0;
}
