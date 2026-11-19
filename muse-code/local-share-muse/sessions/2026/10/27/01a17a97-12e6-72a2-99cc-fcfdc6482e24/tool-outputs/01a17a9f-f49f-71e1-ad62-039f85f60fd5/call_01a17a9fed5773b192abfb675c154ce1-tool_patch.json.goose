// Goose-Port-Spiegel von: muse-code/local-share-muse/sessions/2026/10/27/01a17a97-12e6-72a2-99cc-fcfdc6482e24/tool-outputs/01a17a9f-f49f-71e1-ad62-039f85f60fd5/call_01a17a9fed5773b192abfb675c154ce1-tool_patch.json
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: muse-code/local-share-muse/sessions/2026/10/27/01a17a97-12e6-72a2-99cc-fcfdc6482e24/tool-outputs/01a17a9f-f49f-71e1-ad62-039f85f60fd5/call_01a17a9fed5773b192abfb675c154ce1-tool_patch.json");
}

// ---- Original-Code (muse-code/local-share-muse/sessions/2026/10/27/01a17a97-12e6-72a2-99cc-fcfdc6482e24/tool-outputs/01a17a9f-f49f-71e1-ad62-039f85f60fd5/call_01a17a9fed5773b192abfb675c154ce1-tool_patch.json), unveraendert, als Inline-Doku ----
// {"files":[{"path":"\\\\?\\C:\\Users\\danie\\OneDrive\\github-repos\\TraumaLang\\src\\parser.c","hunks":[{"oldStart":269,"oldLines":10,"newStart":269,"newLines":6,"lines":["     }"," }"," ","-static TlNode *parse_block(TlParser *p, int depth, TlTokKind end1, TlTokKind end2, TlNodeList **else_out) {","-    (void)depth; (void)end1; (void)end2; (void)else_out; return NULL;","-}","-"," TlNode *tl_parse(TlTokVec *vec, char **err_out, int *err_line) {","     TlParser p; p.toks = vec->items; p.count = vec->count; p.pos = 0; p.error = NULL; p.error_line = 0;","     TlNode *prog = tl_node_new(N_PROGRAM, 1);"]}]}]}
