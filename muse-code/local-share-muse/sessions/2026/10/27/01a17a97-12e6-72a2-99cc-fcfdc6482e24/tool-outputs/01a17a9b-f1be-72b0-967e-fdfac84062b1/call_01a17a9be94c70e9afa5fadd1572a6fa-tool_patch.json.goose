// Goose-Port-Spiegel von: muse-code/local-share-muse/sessions/2026/10/27/01a17a97-12e6-72a2-99cc-fcfdc6482e24/tool-outputs/01a17a9b-f1be-72b0-967e-fdfac84062b1/call_01a17a9be94c70e9afa5fadd1572a6fa-tool_patch.json
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: muse-code/local-share-muse/sessions/2026/10/27/01a17a97-12e6-72a2-99cc-fcfdc6482e24/tool-outputs/01a17a9b-f1be-72b0-967e-fdfac84062b1/call_01a17a9be94c70e9afa5fadd1572a6fa-tool_patch.json");
}

// ---- Original-Code (muse-code/local-share-muse/sessions/2026/10/27/01a17a97-12e6-72a2-99cc-fcfdc6482e24/tool-outputs/01a17a9b-f1be-72b0-967e-fdfac84062b1/call_01a17a9be94c70e9afa5fadd1572a6fa-tool_patch.json), unveraendert, als Inline-Doku ----
// {"files":[{"path":"\\\\?\\C:\\Users\\danie\\OneDrive\\github-repos\\TraumaLang\\src\\codegen.c","hunks":[{"oldStart":145,"oldLines":6,"newStart":145,"newLines":13,"lines":["             return 0;","         }","         if (!s->left) { fprintf(out, \"%s(\\\"\\\");\\n\", fn); return 0; }","+        if (s->left->kind == N_EXPR_VAR && (s->print_kind == P_PLAIN || s->print_kind == P_SLACK)) {","+            if (s->print_kind == P_SLACK) fputs(\"printf(\\\"[SLACK] \\\");\\n\", out), indent(out, ind);","+            fputs(\"tl_val_print(&\", out); emit_ident(out, s->left->name); fputs(\");\\n\", out); return 0;","+        }","+        if (s->left->kind == N_EXPR_VAR) {","+            fputs(\"tl_val_print(&\", out); emit_ident(out, s->left->name); fputs(\");\\n\", out); return 0;","+        }","         if (s->left->kind == N_EXPR_NUM) {","             char numfn[64]; snprintf(numfn, sizeof numfn, \"%s\", fn);","             /* numerische Ueberladung: tl_print_long etc. gibt es nur fuer plain/slack */"]}]}]}
