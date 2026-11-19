// Goose-Port-Spiegel von: muse-code/local-share-muse/sessions/2026/10/27/01a17a97-12e6-72a2-99cc-fcfdc6482e24/tool-outputs/01a17a9f-93e1-7ce1-ab22-066e74747686/call_01a17a9f8dda77bcbc9319c89d37723c-tool_patch.json
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: muse-code/local-share-muse/sessions/2026/10/27/01a17a97-12e6-72a2-99cc-fcfdc6482e24/tool-outputs/01a17a9f-93e1-7ce1-ab22-066e74747686/call_01a17a9f8dda77bcbc9319c89d37723c-tool_patch.json");
}

// ---- Original-Code (muse-code/local-share-muse/sessions/2026/10/27/01a17a97-12e6-72a2-99cc-fcfdc6482e24/tool-outputs/01a17a9f-93e1-7ce1-ab22-066e74747686/call_01a17a9f8dda77bcbc9319c89d37723c-tool_patch.json), unveraendert, als Inline-Doku ----
// {"files":[{"path":"\\\\?\\C:\\Users\\danie\\OneDrive\\github-repos\\TraumaLang\\src\\codegen.c","hunks":[{"oldStart":100,"oldLines":7,"newStart":100,"newLines":7,"lines":["     for (; l; l = l->next)","         if (l->node->kind == N_VARDECL) set_add(&decl, l->node->name);","     NameSet imp; imp.n = 0;","-    collect_uses_list(body, &decl, &imp);","+    collect_uses_list(body, &decl, &imp, 1);","     for (int i = 0; i < imp.n; i++) {","         for (int k = 0; k < ind; k++) fputs(\"    \", out);","         fprintf(out, \"TlVal %s; tl_val_init(&%s); /* implizit: Verwendung ohne Deklaration */\\n\", imp.names[i], imp.names[i]);"]}]}]}
