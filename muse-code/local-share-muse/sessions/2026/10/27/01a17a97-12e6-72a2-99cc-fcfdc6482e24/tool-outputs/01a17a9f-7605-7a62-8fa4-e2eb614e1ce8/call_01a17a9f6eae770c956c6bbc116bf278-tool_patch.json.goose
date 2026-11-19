// Goose-Port-Spiegel von: muse-code/local-share-muse/sessions/2026/10/27/01a17a97-12e6-72a2-99cc-fcfdc6482e24/tool-outputs/01a17a9f-7605-7a62-8fa4-e2eb614e1ce8/call_01a17a9f6eae770c956c6bbc116bf278-tool_patch.json
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: muse-code/local-share-muse/sessions/2026/10/27/01a17a97-12e6-72a2-99cc-fcfdc6482e24/tool-outputs/01a17a9f-7605-7a62-8fa4-e2eb614e1ce8/call_01a17a9f6eae770c956c6bbc116bf278-tool_patch.json");
}

// ---- Original-Code (muse-code/local-share-muse/sessions/2026/10/27/01a17a97-12e6-72a2-99cc-fcfdc6482e24/tool-outputs/01a17a9f-7605-7a62-8fa4-e2eb614e1ce8/call_01a17a9f6eae770c956c6bbc116bf278-tool_patch.json), unveraendert, als Inline-Doku ----
// {"files":[{"path":"\\\\?\\C:\\Users\\danie\\OneDrive\\github-repos\\TraumaLang\\src\\codegen.c","hunks":[{"oldStart":60,"oldLines":9,"newStart":60,"newLines":9,"lines":["     for (int i = 0; i < s->n; i++) if (!strcmp(s->names[i], name)) return;","     if (s->n < 256) { strncpy(s->names[s->n], name, 127); s->names[s->n][127] = '\\0'; s->n++; }"," }","-static void collect_uses_node(TlNode *s, NameSet *decl, NameSet *imp);","-static void collect_uses_list(TlNodeList *l, NameSet *decl, NameSet *imp) {","-    for (; l; l = l->next) collect_uses_node(l->node, decl, imp);","+static void collect_uses_node(TlNode *s, NameSet *decl, NameSet *imp, int toplevel);","+static void collect_uses_list(TlNodeList *l, NameSet *decl, NameSet *imp, int toplevel) {","+    for (; l; l = l->next) collect_uses_node(l->node, decl, imp, toplevel);"," }"," static void collect_use_name(const char *name, NameSet *decl, NameSet *imp) {","     if (!name || !name[0]) return;"]}]}]}
