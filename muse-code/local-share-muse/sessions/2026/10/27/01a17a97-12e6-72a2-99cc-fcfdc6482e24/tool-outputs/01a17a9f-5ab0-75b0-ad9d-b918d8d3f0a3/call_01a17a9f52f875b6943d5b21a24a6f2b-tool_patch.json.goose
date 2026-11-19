// Goose-Port-Spiegel von: muse-code/local-share-muse/sessions/2026/10/27/01a17a97-12e6-72a2-99cc-fcfdc6482e24/tool-outputs/01a17a9f-5ab0-75b0-ad9d-b918d8d3f0a3/call_01a17a9f52f875b6943d5b21a24a6f2b-tool_patch.json
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: muse-code/local-share-muse/sessions/2026/10/27/01a17a97-12e6-72a2-99cc-fcfdc6482e24/tool-outputs/01a17a9f-5ab0-75b0-ad9d-b918d8d3f0a3/call_01a17a9f52f875b6943d5b21a24a6f2b-tool_patch.json");
}

// ---- Original-Code (muse-code/local-share-muse/sessions/2026/10/27/01a17a97-12e6-72a2-99cc-fcfdc6482e24/tool-outputs/01a17a9f-5ab0-75b0-ad9d-b918d8d3f0a3/call_01a17a9f52f875b6943d5b21a24a6f2b-tool_patch.json), unveraendert, als Inline-Doku ----
// {"files":[{"path":"\\\\?\\C:\\Users\\danie\\OneDrive\\github-repos\\TraumaLang\\src\\codegen.c","hunks":[{"oldStart":94,"oldLines":12,"newStart":94,"newLines":9,"lines":["     NameSet decl; decl.n = 0;","     /* Deklarationen sammeln (ohne Funktionsruempfe zu betreten). */","     TlNodeList *l = body;","-    /* einfacher Durchlauf: erst alle VARDECL einsammeln */","-    for (; l; l = l->next) {","-        TlNode *s = l->node;","-        if (s->kind == N_VARDECL) set_add(&decl, s->name);","-        else if (s->kind == N_IF) { collect_uses_list(s->body, &decl, &(NameSet){0}); }","-    }","+    /* Erster Durchlauf: alle VARDECL der obersten Ebene einsammeln. */","+    for (; l; l = l->next)","+        if (l->node->kind == N_VARDECL) set_add(&decl, l->node->name);","     NameSet imp; imp.n = 0;","     collect_uses_list(body, &decl, &imp);","     for (int i = 0; i < imp.n; i++) {"]}]}]}
