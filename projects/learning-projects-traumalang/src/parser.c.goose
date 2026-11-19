// Goose-Port-Spiegel von: projects/learning-projects-traumalang/src/parser.c
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/learning-projects-traumalang/src/parser.c");
}

// ---- Original-Code (projects/learning-projects-traumalang/src/parser.c), unveraendert, als Inline-Doku ----
// #include <stdlib.h>
// #include <string.h>
// #include <stdio.h>
// #include "parser.h"
//
// static TlToken *peek(TlParser *p) { return &p->toks[p->pos]; }
// static void skip_nl(TlParser *p) { while (peek(p)->kind == T_NEWLINE) p->pos++; }
// static int fail(TlParser *p, int line, const char *msg) {
//     char b[512]; snprintf(b, sizeof b, "Zeile %d: %s", line, msg);
//     p->error = (char*)malloc(strlen(b)+1); strcpy(p->error, b);
//     p->error_line = line; return 0;
// }
//
// static TlNode *parse_expr(TlParser *p);
// static TlNode *parse_stmt(TlParser *p, int depth);
//
// /* Ausdruck: Zahl | String | TEMP/Ident | NULL-Satire | Vergleich/Arithmetik (links-assoziativ, einfach) */
// static int is_binop(const char *t) {
//     return !strcmp(t,"+")||!strcmp(t,"-")||!strcmp(t,"*")||!strcmp(t,"/")||
//            !strcmp(t,"%")||!strcmp(t,"==")||!strcmp(t,"!=")||!strcmp(t,"<")||
//            !strcmp(t,">")||!strcmp(t,"<=")||!strcmp(t,">=")||!strcmp(t,"&&")||!strcmp(t,"||");
// }
//
// static TlNode *parse_primary(TlParser *p) {
//     TlToken *t = peek(p);
//     if (t->kind == T_NUMBER) { p->pos++; return tl_expr_num(t->line, atol(t->text)); }
//     if (t->kind == T_STRING) { p->pos++; return tl_expr_str(t->line, t->text); }
//     if (t->kind == T_FOCUS_NULL) { p->pos++; return tl_expr_null(t->line); }
//     if (t->kind == T_VAGUE_GOALS) { p->pos++; return tl_expr_null(t->line); }
//     if (t->kind == T_IDENT || t->kind == T_TEMP_VAR) { p->pos++; return tl_expr_var(t->line, t->text); }
//     if (t->kind == T_PROB5) { p->pos++; TlNode *n = tl_node_new(N_COND_PROB, t->line); n->ival = 5; return n; }
//     if (t->kind == T_PHISH33) { p->pos++; TlNode *n = tl_node_new(N_COND_PROB, t->line); n->ival = 33; return n; }
//     if (t->kind == T_PHISH85) { p->pos++; TlNode *n = tl_node_new(N_COND_PROB, t->line); n->ival = 85; return n; }
//     fail(p, t->line, "Ausdruck erwartet (Zahl, String, Variable oder Bedingung)");
//     return NULL;
// }
//
// static TlNode *parse_expr(TlParser *p) {
//     TlNode *l = parse_primary(p);
//     if (!l || p->error) return l;
//     TlToken *t = peek(p);
//     if (t->kind == T_IDENT && is_binop(t->text)) {
//         char op[4]; strcpy(op, t->text); p->pos++;
//         TlNode *r = parse_primary(p);
//         if (!r || p->error) { tl_node_free(l); return NULL; }
//         return tl_expr_binop(l->line, op, l, r);
//     }
//     return l;
// }
//
// static TlNode *mk_print(TlParser *p, TlTokKind k, TlPrintKind pk) {
//     TlToken *t = peek(p); p->pos++;
//     skip_nl(p);
//     TlNode *n = tl_node_new(N_PRINT, t->line);
//     n->print_kind = pk;
//     TlToken *a = peek(p);
//     if (a->kind == T_STRING || a->kind == T_NUMBER || a->kind == T_IDENT ||
//         a->kind == T_TEMP_VAR || a->kind == T_FOCUS_NULL) {
//         n->left = parse_expr(p);
//     } else { n->left = NULL; }
//     (void)k; return n;
// }
//
// static TlNode *parse_stmt(TlParser *p, int depth) {
//     (void)depth;
//     skip_nl(p);
//     TlToken *t = peek(p);
//     TlNode *n;
//     switch (t->kind) {
//     case T_EOF: case T_TERMINATED: case T_ELSE: case T_FUNC_END:
//         return NULL;
//     case T_VAR_STATIC: {
//         p->pos++; TlToken *a = peek(p);
//         n = tl_node_new(N_VARDECL, t->line);
//         if (a->kind == T_IDENT || a->kind == T_TEMP_VAR) { n->name = (char*)malloc(strlen(a->text)+1); strcpy(n->name, a->text); p->pos++; }
//         else n->name = NULL; /* bezieht sich auf naechste Deklaration: als static-Marker ohne Namen */
//         n->ival = 1; return n;
//     }
//     case T_VAR_ENTERPRISE:
//         p->pos++; {
//             TlToken *a = peek(p);
//             if (a->kind != T_IDENT && a->kind != T_TEMP_VAR) { fail(p, t->line, "Variablenname nach WE HAVE 240 ... erwartet"); return NULL; }
//             n = tl_node_new(N_VARDECL, t->line); n->ival = 0;
//             n->name = (char*)malloc(strlen(a->text)+1); strcpy(n->name, a->text); p->pos++; return n;
//         }
//     case T_ASSIGN: {
//         p->pos++; skip_nl(p);
//         TlToken *a = peek(p);
//         if (a->kind != T_IDENT && a->kind != T_TEMP_VAR) { fail(p, t->line, "Variablenname nach I NEED YOUR CLOTHES ... erwartet"); return NULL; }
//         char vb[256]; strcpy(vb, a->text); int vline = a->line; p->pos++;
//         /* Aufruf-Form: I NEED YOUR CLOTHES <var> <func> <args...> (gleiche Zeile).
//            Erkennbar daran, dass nach dem Funktionsnamen noch Argumente auf
//            derselben Zeile folgen. Sonst normaler Ausdruck (inkl. einzelner Var). */
//         if (peek(p)->kind == T_IDENT && peek(p)->line == vline) {
//             TlToken *f = peek(p);
//             int fi = p->pos + 1;
//             int has_more = 0;
//             if (fi < p->count) {
//                 TlToken *nx = &p->toks[fi];
//                 if (nx->line == vline && (nx->kind == T_IDENT || nx->kind == T_TEMP_VAR ||
//                     nx->kind == T_NUMBER || nx->kind == T_STRING ||
//                     nx->kind == T_FOCUS_NULL || nx->kind == T_VAGUE_GOALS ||
//                     nx->kind == T_PROB5 || nx->kind == T_PHISH33 || nx->kind == T_PHISH85)) has_more = 1;
//             }
//             if (has_more) {
//                 TlNode *call = tl_node_new(N_FUNCCALL, f->line);
//                 call->name = (char*)malloc(strlen(f->text)+1); strcpy(call->name, f->text);
//                 p->pos++;
//                 while (p->pos < p->count) {
//                     TlToken *ax = peek(p);
//                     if (ax->line != vline) break;
//                     if (ax->kind == T_STRING || ax->kind == T_NUMBER || ax->kind == T_IDENT ||
//                         ax->kind == T_TEMP_VAR || ax->kind == T_FOCUS_NULL || ax->kind == T_VAGUE_GOALS ||
//                         ax->kind == T_PROB5 || ax->kind == T_PHISH33 || ax->kind == T_PHISH85) {
//                         TlNode *e = parse_expr(p);
//                         if (!e || p->error) { tl_node_free(call); return NULL; }
//                         tl_body_append(&call->args, e);
//                     } else break;
//                 }
//                 n = tl_node_new(N_ASSIGN, t->line);
//                 n->name = (char*)malloc(strlen(vb)+1); strcpy(n->name, vb); n->left = call; return n;
//             }
//         }
//         TlNode *e = parse_expr(p);
//         if (!e || p->error) return NULL;
//         n = tl_node_new(N_ASSIGN, t->line);
//         n->name = (char*)malloc(strlen(vb)+1); strcpy(n->name, vb); n->left = e; return n;
//     }
//     case T_COPY: {
//         p->pos++;
//         TlToken *a = peek(p); TlToken *b;
//         if (a->kind != T_IDENT && a->kind != T_TEMP_VAR) { fail(p, t->line, "Zielvariable nach YOU ARE NOT YOU ... erwartet"); return NULL; }
//         p->pos++; b = peek(p);
//         if (b->kind != T_IDENT && b->kind != T_TEMP_VAR) { fail(p, t->line, "Quellvariable nach YOU ARE NOT YOU ... erwartet"); return NULL; }
//         n = tl_node_new(N_COPY, t->line);
//         n->name = (char*)malloc(strlen(a->text)+1); strcpy(n->name, a->text);
//         n->name2 = (char*)malloc(strlen(b->text)+1); strcpy(n->name2, b->text);
//         p->pos++; return n;
//     }
//     case T_SCALE_UP: case T_SCALE_DOWN: {
//         int up = (t->kind == T_SCALE_UP); p->pos++;
//         TlToken *a = peek(p);
//         if (a->kind != T_IDENT && a->kind != T_TEMP_VAR) { fail(p, t->line, "Variablenname nach SCALE/DOWNSIZE erwartet"); return NULL; }
//         n = tl_node_new(up ? N_INC : N_DEC, t->line);
//         n->name = (char*)malloc(strlen(a->text)+1); strcpy(n->name, a->text); p->pos++; return n;
//     }
//     case T_OWNERS: {
//         p->pos++; TlToken *a = peek(p);
//         if (a->kind != T_IDENT && a->kind != T_TEMP_VAR) { fail(p, t->line, "Variablenname nach I NEED OWNERS ... erwartet"); return NULL; }
//         n = tl_node_new(N_DIRECTIVE, t->line);
//         n->sval = (char*)malloc(7); strcpy(n->sval, "owners");
//         n->name = (char*)malloc(strlen(a->text)+1); strcpy(n->name, a->text); p->pos++; return n;
//     }
//     case T_ROTATE: {
//         p->pos++; TlToken *a = peek(p);
//         if (a->kind != T_IDENT && a->kind != T_TEMP_VAR) { fail(p, t->line, "Variablenname nach ROTATE THE SECRET erwartet"); return NULL; }
//         n = tl_node_new(N_ASSIGN, t->line);
//         n->name = (char*)malloc(strlen(a->text)+1); strcpy(n->name, a->text);
//         n->left = tl_expr_var(t->line, a->text); p->pos++; return n;
//     }
//     case T_IF: {
//         p->pos++;
//         TlNode *c = parse_expr(p);
//         if (!c || p->error) return NULL;
//         n = tl_node_new(N_IF, t->line); n->cond = c;
//         TlNodeList *eb = NULL;
//         TlNodeList *th = NULL;
//         /* then-Block bis ELSE / TERMINATED */
//         while (1) {
//             skip_nl(p);
//             TlTokKind k = peek(p)->kind;
//             if (k == T_ELSE || k == T_TERMINATED || k == T_EOF) break;
//             TlNode *s = parse_stmt(p, depth+1);
//             if (p->error) return NULL;
//             if (!s) break;
//             tl_body_append(&th, s);
//         }
//         n->body = th;
//         if (peek(p)->kind == T_ELSE) {
//             p->pos++;
//             while (1) {
//                 skip_nl(p);
//                 TlTokKind k = peek(p)->kind;
//                 if (k == T_TERMINATED || k == T_EOF) break;
//                 TlNode *s = parse_stmt(p, depth+1);
//                 if (p->error) return NULL;
//                 if (!s) break;
//                 tl_body_append(&eb, s);
//             }
//         }
//         n->else_body = eb;
//         if (peek(p)->kind != T_TERMINATED) { fail(p, peek(p)->line, "YOU HAVE BEEN TERMINATED zum Schliessen des IF-Blocks erwartet"); tl_node_free(n); return NULL; }
//         p->pos++; return n;
//     }
//     case T_WHILE: {
//         p->pos++;
//         TlNode *c = parse_expr(p);
//         if (!c || p->error) return NULL;
//         n = tl_node_new(N_WHILE, t->line); n->cond = c;
//         while (1) {
//             skip_nl(p);
//             TlTokKind k = peek(p)->kind;
//             if (k == T_TERMINATED || k == T_EOF) break;
//             TlNode *s = parse_stmt(p, depth+1);
//             if (p->error) return NULL;
//             if (!s) break;
//             tl_body_append(&n->body, s);
//         }
//         if (peek(p)->kind != T_TERMINATED) { fail(p, peek(p)->line, "YOU HAVE BEEN TERMINATED zum Schliessen der WHILE-Schleife erwartet"); tl_node_free(n); return NULL; }
//         p->pos++; return n;
//     }
//     case T_BREAK: p->pos++; return tl_node_new(N_BREAK, t->line);
//     case T_CONTINUE: p->pos++; return tl_node_new(N_CONTINUE, t->line);
//     case T_FUNC_BEGIN: {
//         p->pos++;
//         TlToken *a = peek(p);
//         if (a->kind != T_IDENT && a->kind != T_TEMP_VAR) { fail(p, t->line, "Funktionsname nach WE NEED TO TAKE THIS OFFLINE erwartet"); return NULL; }
//         n = tl_node_new(N_FUNCDEF, t->line);
//         n->name = (char*)malloc(strlen(a->text)+1); strcpy(n->name, a->text); p->pos++;
//         /* Optional: WITH <p1> [AND <p2> ...] (gleiche Zeile, max. 8). */
//         if (peek(p)->kind == T_IDENT && !strcmp(peek(p)->text, "WITH") && peek(p)->line == a->line) {
//             p->pos++;
//             while (1) {
//                 TlToken *pa = peek(p);
//                 if (pa->kind != T_IDENT && pa->kind != T_TEMP_VAR) { fail(p, t->line, "Parametername nach WITH erwartet"); tl_node_free(n); return NULL; }
//                 if (n->param_count < 8) { strncpy(n->params[n->param_count], pa->text, 63); n->params[n->param_count][63] = '\0'; n->param_count++; }
//                 else { fail(p, t->line, "maximal 8 Parameter"); tl_node_free(n); return NULL; }
//                 p->pos++;
//                 TlToken *sep = peek(p);
//                 if (sep->kind == T_IDENT && !strcmp(sep->text, "AND") && sep->line == a->line) { p->pos++; continue; }
//                 break;
//             }
//         }
//         while (1) {
//             skip_nl(p);
//             TlTokKind k = peek(p)->kind;
//             if (k == T_FUNC_END || k == T_EOF) break;
//             TlNode *s = parse_stmt(p, depth+1);
//             if (p->error) { tl_node_free(n); return NULL; }
//             if (!s) break;
//             tl_body_append(&n->body, s);
//         }
//         if (peek(p)->kind != T_FUNC_END) { fail(p, peek(p)->line, "THIS COULD HAVE BEEN AN EMAIL zum Schliessen der Funktion erwartet"); tl_node_free(n); return NULL; }
//         p->pos++; return n;
//     }
//     case T_PRINT: return mk_print(p, t->kind, P_PLAIN);
//     case T_SLACK: return mk_print(p, t->kind, P_SLACK);
//     case T_DATADOG: return mk_print(p, t->kind, P_DATADOG);
//     case T_CLOUD: return mk_print(p, t->kind, P_CLOUD);
//     case T_GRAFANA: return mk_print(p, t->kind, P_GRAFANA);
//     case T_ESCALATE: return mk_print(p, t->kind, P_ESCALATE);
//     case T_LEGACY_TEAM: return mk_print(p, t->kind, P_LEGACY);
//     case T_CAB_SEND: return mk_print(p, t->kind, P_CAB);
//     case T_VACATION: return mk_print(p, t->kind, P_VACATION);
//     case T_RESEARCH: return mk_print(p, t->kind, P_RESEARCH);
//     case T_PROD_FRIDAY: return mk_print(p, t->kind, P_PROD_DEPLOY);
//     case T_SBOM_ADD: return mk_print(p, t->kind, P_SBOM);
//     case T_AD_STORE: return mk_print(p, t->kind, P_AD);
//     case T_PHONE_SECURE: return mk_print(p, t->kind, P_PHONE);
//     case T_AMIGA: return mk_print(p, t->kind, P_AMIGA);
//     case T_TOS_HIDE: return mk_print(p, t->kind, P_TOS);
//     case T_JIRA: {
//         p->pos++; skip_nl(p);
//         n = tl_node_new(N_TODO_JIRA, t->line);
//         TlToken *a = peek(p);
//         if (a->kind == T_IDENT || a->kind == T_TEMP_VAR || a->kind == T_STRING) {
//             n->name = (char*)malloc(strlen(a->text)+1); strcpy(n->name, a->text); p->pos++;
//         }
//         return n;
//     }
//     case T_CONFLUENCE: case T_KNOWLEDGE_SINK: {
//         p->pos++;
//         n = tl_node_new(N_NULL_SINK, t->line);
//         TlToken *a = peek(p);
//         if (a->kind == T_IDENT || a->kind == T_TEMP_VAR || a->kind == T_STRING) {
//             n->left = parse_expr(p);
//         }
//         return n;
//     }
//     case T_DNS: case T_ON_MY_MACHINE: case T_DISABLE_OPA: case T_BLOCKED_TEAM:
//     case T_NO_REDUNDANCY: case T_SBOM_OBFUSCATE: case T_GOVERNANCE: {
//         p->pos++;
//         n = tl_node_new(N_COMMENT, t->line);
//         n->sval = (char*)malloc(strlen(t->text)+1); strcpy(n->sval, t->text);
//         TlToken *a = peek(p);
//         if (a->kind == T_IDENT || a->kind == T_STRING) { /* optionales Argument konsumieren */ }
//         return n;
//     }
//     case T_ALLOC_LEAK: p->pos++; n = tl_node_new(N_DIRECTIVE, t->line); n->sval = (char*)malloc(5); strcpy(n->sval, "leak"); return n;
//     case T_JUSTIFICATION: p->pos++; n = tl_node_new(N_DIRECTIVE, t->line); n->sval = (char*)malloc(6); strcpy(n->sval, "cabus"); return n;
//     case T_REBOOT_RESET: p->pos++; n = tl_node_new(N_RESET, t->line); return n;
//     case T_SYNC: p->pos++; n = tl_node_new(N_SLEEP_OP, t->line); n->ival = 8; return n;
//     case T_DOUBLE_BOOKED: {
//         p->pos++; skip_nl(p);
//         n = tl_node_new(N_DOUBLE_RUN, t->line);
//         TlToken *a = peek(p);
//         if (a->kind == T_IDENT || a->kind == T_TEMP_VAR) { n->name = (char*)malloc(strlen(a->text)+1); strcpy(n->name, a->text); p->pos++; }
//         return n;
//     }
//     case T_METRICS_UP: p->pos++; n = tl_node_new(N_METRICS_INC, t->line); return n;
//     case T_METRICS_LOOP: case T_METRICS_FOREVER: case T_TEMP_SCRIPT:
//         p->pos++; n = tl_node_new(N_METRICS_LOOP, t->line); return n;
//     case T_TERRAFORM_CHAOS: p->pos++; n = tl_node_new(N_CHAOS, t->line); return n;
//     case T_CAB_TUESDAY: p->pos++; n = tl_node_new(N_CHAOS, t->line); n->ival = 1; return n;
//     case T_RETURN: {
//         p->pos++; skip_nl(p);
//         TlNode *e = parse_expr(p);
//         if (!e || p->error) return NULL;
//         n = tl_node_new(N_RETURN, t->line); n->left = e; return n;
//     }
//     case T_FOR: {
//         p->pos++;
//         TlToken *a = peek(p);
//         if (a->kind != T_IDENT && a->kind != T_TEMP_VAR) { fail(p, t->line, "Variablenname nach DO SPRINT PLANNING erwartet"); return NULL; }
//         char vb[256]; strcpy(vb, a->text); p->pos++;
//         TlToken *fw = peek(p);
//         if (fw->kind != T_IDENT || strcmp(fw->text, "FROM")) { fail(p, t->line, "FROM nach DO SPRINT PLANNING <var> erwartet"); return NULL; }
//         p->pos++;
//         TlNode *from = parse_expr(p);
//         if (!from || p->error) return NULL;
//         TlToken *to = peek(p);
//         if (to->kind != T_IDENT || strcmp(to->text, "TO")) { fail(p, t->line, "TO nach FROM <expr> erwartet"); tl_node_free(from); return NULL; }
//         p->pos++;
//         TlNode *toex = parse_expr(p);
//         if (!toex || p->error) { tl_node_free(from); return NULL; }
//         n = tl_node_new(N_FOR, t->line);
//         n->name = (char*)malloc(strlen(vb)+1); strcpy(n->name, vb);
//         n->left = from; n->right = toex;
//         while (1) {
//             skip_nl(p);
//             TlTokKind k = peek(p)->kind;
//             if (k == T_TERMINATED || k == T_EOF) break;
//             TlNode *s = parse_stmt(p, depth+1);
//             if (p->error) { tl_node_free(n); return NULL; }
//             if (!s) break;
//             tl_body_append(&n->body, s);
//         }
//         if (peek(p)->kind != T_TERMINATED) { fail(p, peek(p)->line, "YOU HAVE BEEN TERMINATED zum Schliessen der FOR-Schleife erwartet"); tl_node_free(n); return NULL; }
//         p->pos++; return n;
//     }
//     case T_NEWLINE: p->pos++; return parse_stmt(p, depth);
//     default:
//         /* Funktionsaufruf: Ident gefolgt von optionalen Argumenten auf derselben Zeile */
//         if (t->kind == T_IDENT) {
//             int cline = t->line;
//             p->pos++;
//             n = tl_node_new(N_FUNCCALL, t->line);
//             n->name = (char*)malloc(strlen(t->text)+1); strcpy(n->name, t->text);
//             while (p->pos < p->count) {
//                 TlToken *ax = peek(p);
//                 if (ax->line != cline) break;
//                 if (ax->kind == T_STRING || ax->kind == T_NUMBER || ax->kind == T_IDENT ||
//                     ax->kind == T_TEMP_VAR || ax->kind == T_FOCUS_NULL || ax->kind == T_VAGUE_GOALS ||
//                     ax->kind == T_PROB5 || ax->kind == T_PHISH33 || ax->kind == T_PHISH85) {
//                     TlNode *e = parse_expr(p);
//                     if (!e || p->error) { tl_node_free(n); return NULL; }
//                     tl_body_append(&n->args, e);
//                 } else break;
//             }
//             return n;
//         }
//         fail(p, t->line, "Unbekannte Anweisung");
//         return NULL;
//     }
// }
//
// TlNode *tl_parse(TlTokVec *vec, char **err_out, int *err_line) {
//     TlParser p; p.toks = vec->items; p.count = vec->count; p.pos = 0; p.error = NULL; p.error_line = 0;
//     TlNode *prog = tl_node_new(N_PROGRAM, 1);
//     skip_nl(&p);
//     if (peek(&p)->kind != T_SHOWTIME) { fail(&p, peek(&p)->line, "Programm muss mit IT'S SHOWTIME beginnen"); tl_node_free(prog); *err_out = p.error; if (err_line) *err_line = p.error_line; return NULL; }
//     p.pos++;
//     while (1) {
//         skip_nl(&p);
//         TlTokKind k = peek(&p)->kind;
//         if (k == T_EOF) { fail(&p, peek(&p)->line, "YOU HAVE BEEN TERMINATED zum Schliessen des Hauptprogramms erwartet"); tl_node_free(prog); *err_out = p.error; if (err_line) *err_line = p.error_line; return NULL; }
//         if (k == T_TERMINATED) { p.pos++; break; }
//         TlNode *s = parse_stmt(&p, 0);
//         if (p.error) { tl_node_free(prog); *err_out = p.error; if (err_line) *err_line = p.error_line; return NULL; }
//         if (!s) break;
//         tl_body_append(&prog->body, s);
//     }
//     skip_nl(&p);
//     if (peek(&p)->kind != T_EOF) { fail(&p, peek(&p)->line, "Unerwarteter Inhalt nach YOU HAVE BEEN TERMINATED"); tl_node_free(prog); *err_out = p.error; if (err_line) *err_line = p.error_line; return NULL; }
//     return prog;
// }
//
// void tl_parse_error_free(char *e) { free(e); }
//
