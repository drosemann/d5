// Goose-Port-Spiegel von: muse-code/local-share-muse/sessions/2026/10/29/01a18954-4565-7c03-b59d-96f6f90305fd/tool-outputs/01a18957-3997-7990-a1e7-fa0eed7c0675/call_01a189572c7972949468f4c04a0d5748-tool_patch.json
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: muse-code/local-share-muse/sessions/2026/10/29/01a18954-4565-7c03-b59d-96f6f90305fd/tool-outputs/01a18957-3997-7990-a1e7-fa0eed7c0675/call_01a189572c7972949468f4c04a0d5748-tool_patch.json");
}

// ---- Original-Code (muse-code/local-share-muse/sessions/2026/10/29/01a18954-4565-7c03-b59d-96f6f90305fd/tool-outputs/01a18957-3997-7990-a1e7-fa0eed7c0675/call_01a189572c7972949468f4c04a0d5748-tool_patch.json), unveraendert, als Inline-Doku ----
// {"files":[{"path":"\\\\?\\C:\\Users\\danie\\OneDrive\\github-repos\\TraumaLang\\src\\ast.h","hunks":[{"oldStart":39,"oldLines":6,"newStart":39,"newLines":9,"lines":["     TlNode *right;   /* expr right / else-branch */","     TlNodeList *body;/* statement list for program/func/if/while */","     TlNodeList *else_body;","+    TlNodeList *args;/* call arguments (N_FUNCCALL) */","+    char params[8][64];/* function parameters (N_FUNCDEF) */","+    int param_count;"," };"," "," TlNode *tl_node_new(TlNodeKind kind, int line);"]}]}]}
