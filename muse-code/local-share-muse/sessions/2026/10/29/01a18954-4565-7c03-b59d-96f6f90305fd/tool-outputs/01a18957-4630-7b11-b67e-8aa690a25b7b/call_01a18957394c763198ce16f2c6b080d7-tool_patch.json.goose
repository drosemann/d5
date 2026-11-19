// Goose-Port-Spiegel von: muse-code/local-share-muse/sessions/2026/10/29/01a18954-4565-7c03-b59d-96f6f90305fd/tool-outputs/01a18957-4630-7b11-b67e-8aa690a25b7b/call_01a18957394c763198ce16f2c6b080d7-tool_patch.json
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: muse-code/local-share-muse/sessions/2026/10/29/01a18954-4565-7c03-b59d-96f6f90305fd/tool-outputs/01a18957-4630-7b11-b67e-8aa690a25b7b/call_01a18957394c763198ce16f2c6b080d7-tool_patch.json");
}

// ---- Original-Code (muse-code/local-share-muse/sessions/2026/10/29/01a18954-4565-7c03-b59d-96f6f90305fd/tool-outputs/01a18957-4630-7b11-b67e-8aa690a25b7b/call_01a18957394c763198ce16f2c6b080d7-tool_patch.json), unveraendert, als Inline-Doku ----
// {"files":[{"path":"\\\\?\\C:\\Users\\danie\\OneDrive\\github-repos\\TraumaLang\\src\\ast.c","hunks":[{"oldStart":24,"oldLines":7,"newStart":24,"newLines":7,"lines":["     if (!n) return;","     free(n->name); free(n->name2); free(n->sval);","     tl_node_free(n->cond); tl_node_free(n->left); tl_node_free(n->right);","-    tl_body_free(n->body); tl_body_free(n->else_body);","+    tl_body_free(n->body); tl_body_free(n->else_body); tl_body_free(n->args);","     free(n);"," }"," "]}]}]}
