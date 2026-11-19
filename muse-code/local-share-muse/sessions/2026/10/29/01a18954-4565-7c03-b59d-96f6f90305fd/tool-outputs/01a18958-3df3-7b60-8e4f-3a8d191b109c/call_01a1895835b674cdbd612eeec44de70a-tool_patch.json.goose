// Goose-Port-Spiegel von: muse-code/local-share-muse/sessions/2026/10/29/01a18954-4565-7c03-b59d-96f6f90305fd/tool-outputs/01a18958-3df3-7b60-8e4f-3a8d191b109c/call_01a1895835b674cdbd612eeec44de70a-tool_patch.json
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: muse-code/local-share-muse/sessions/2026/10/29/01a18954-4565-7c03-b59d-96f6f90305fd/tool-outputs/01a18958-3df3-7b60-8e4f-3a8d191b109c/call_01a1895835b674cdbd612eeec44de70a-tool_patch.json");
}

// ---- Original-Code (muse-code/local-share-muse/sessions/2026/10/29/01a18954-4565-7c03-b59d-96f6f90305fd/tool-outputs/01a18958-3df3-7b60-8e4f-3a8d191b109c/call_01a1895835b674cdbd612eeec44de70a-tool_patch.json), unveraendert, als Inline-Doku ----
// {"files":[{"path":"\\\\?\\C:\\Users\\danie\\OneDrive\\github-repos\\TraumaLang\\src\\codegen.c","hunks":[{"oldStart":429,"oldLines":8,"newStart":429,"newLines":13,"lines":["     /* Pass 1: Funktionen gehoistet vor main() (tlf_-Praefix, kein Clash mit echtem main). */","     TlNodeList *l;","     for (l = prog->body; l; l = l->next)","-        if (l->node->kind == N_FUNCDEF)","+        if (l->node->kind == N_FUNCDEF) {","+            if (l->node->name && !strcmp(l->node->name, \"main\") && l->node->param_count > 0) {","+                if (err_out) *err_out = \"main darf keine Parameter haben\";","+                return -1;","+            }","             if (gen_stmt(l->node, out, 0, &err)) { if (err_out) *err_out = err; return -1; }","+        }","     fprintf(out, \"\\nint main(void) {\\n\");","     fprintf(out, \"    srand(1337);\\n\");","     fprintf(out, \"    tl_startup_banner();\\n\");"]}]}]}
