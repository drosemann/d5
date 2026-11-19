// Goose-Port-Spiegel von: muse-code/local-share-muse/sessions/2026/10/29/01a18954-4565-7c03-b59d-96f6f90305fd/tool-outputs/01a18958-5df3-7e32-a277-b01c002ea979/call_01a18958539b77ec9ae225c6d2e339df-tool_patch.json
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: muse-code/local-share-muse/sessions/2026/10/29/01a18954-4565-7c03-b59d-96f6f90305fd/tool-outputs/01a18958-5df3-7e32-a277-b01c002ea979/call_01a18958539b77ec9ae225c6d2e339df-tool_patch.json");
}

// ---- Original-Code (muse-code/local-share-muse/sessions/2026/10/29/01a18954-4565-7c03-b59d-96f6f90305fd/tool-outputs/01a18958-5df3-7e32-a277-b01c002ea979/call_01a18958539b77ec9ae225c6d2e339df-tool_patch.json), unveraendert, als Inline-Doku ----
// {"files":[{"path":"\\\\?\\C:\\Users\\danie\\OneDrive\\github-repos\\TraumaLang\\src\\explain.c","hunks":[{"oldStart":46,"oldLines":7,"newStart":46,"newLines":7,"lines":[" static void ex_list(TlNodeList *l, FILE *o, int ind) {","     for (; l; l = l->next) {","         ex_node(l->node, o, ind);","-        if (l->node->kind == N_FUNCDEF || l->node->kind == N_IF || l->node->kind == N_WHILE) {","+        if (l->node->kind == N_FUNCDEF || l->node->kind == N_IF || l->node->kind == N_WHILE || l->node->kind == N_FOR) {","             ex_list(l->node->body, o, ind + 1);","             ex_list(l->node->else_body, o, ind + 1);","         }"]}]}]}
