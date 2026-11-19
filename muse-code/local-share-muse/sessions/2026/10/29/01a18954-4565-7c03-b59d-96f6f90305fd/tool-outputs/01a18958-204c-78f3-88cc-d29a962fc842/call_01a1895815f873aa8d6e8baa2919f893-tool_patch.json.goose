// Goose-Port-Spiegel von: muse-code/local-share-muse/sessions/2026/10/29/01a18954-4565-7c03-b59d-96f6f90305fd/tool-outputs/01a18958-204c-78f3-88cc-d29a962fc842/call_01a1895815f873aa8d6e8baa2919f893-tool_patch.json
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: muse-code/local-share-muse/sessions/2026/10/29/01a18954-4565-7c03-b59d-96f6f90305fd/tool-outputs/01a18958-204c-78f3-88cc-d29a962fc842/call_01a1895815f873aa8d6e8baa2919f893-tool_patch.json");
}

// ---- Original-Code (muse-code/local-share-muse/sessions/2026/10/29/01a18954-4565-7c03-b59d-96f6f90305fd/tool-outputs/01a18958-204c-78f3-88cc-d29a962fc842/call_01a1895815f873aa8d6e8baa2919f893-tool_patch.json), unveraendert, als Inline-Doku ----
// {"files":[{"path":"\\\\?\\C:\\Users\\danie\\OneDrive\\github-repos\\TraumaLang\\src\\codegen.c","hunks":[{"oldStart":156,"oldLines":8,"newStart":156,"newLines":10,"lines":["     /* Params gehoeren zum Scope. */","     if (fn && fn->kind == N_FUNCDEF)","         for (int i = 0; i < fn->param_count; i++) set_add(&decl, fn->params[i]);","-    for (TlNodeList *l = body; l; l = l->next)","+    for (TlNodeList *l = body; l; l = l->next) {","         if (l->node->kind == N_VARDECL) set_add(&decl, l->node->name);","+        if (l->node->kind == N_FOR) set_add(&decl, l->node->name);","+    }","     collect_uses_list(body, &decl, &imp, 1);","     for (int i = 0; i < decl.n; i++) set_add(s, decl.names[i]);","     for (int i = 0; i < imp.n; i++) set_add(s, imp.names[i]);"]}]}]}
