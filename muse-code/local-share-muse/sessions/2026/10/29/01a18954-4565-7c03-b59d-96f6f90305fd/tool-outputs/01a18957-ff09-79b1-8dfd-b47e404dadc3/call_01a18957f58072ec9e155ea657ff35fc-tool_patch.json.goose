// Goose-Port-Spiegel von: muse-code/local-share-muse/sessions/2026/10/29/01a18954-4565-7c03-b59d-96f6f90305fd/tool-outputs/01a18957-ff09-79b1-8dfd-b47e404dadc3/call_01a18957f58072ec9e155ea657ff35fc-tool_patch.json
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: muse-code/local-share-muse/sessions/2026/10/29/01a18954-4565-7c03-b59d-96f6f90305fd/tool-outputs/01a18957-ff09-79b1-8dfd-b47e404dadc3/call_01a18957f58072ec9e155ea657ff35fc-tool_patch.json");
}

// ---- Original-Code (muse-code/local-share-muse/sessions/2026/10/29/01a18954-4565-7c03-b59d-96f6f90305fd/tool-outputs/01a18957-ff09-79b1-8dfd-b47e404dadc3/call_01a18957f58072ec9e155ea657ff35fc-tool_patch.json), unveraendert, als Inline-Doku ----
// {"files":[{"path":"\\\\?\\C:\\Users\\danie\\OneDrive\\github-repos\\TraumaLang\\src\\codegen.c","hunks":[{"oldStart":164,"oldLines":9,"newStart":164,"newLines":6,"lines":[" }"," static void scope_pop(void) { if (scope_depth > 0) scope_depth--; }"," ","-/* TlVal-Rueckgabeausdruck bauen: Zielvariable per set/copy fuellen. */","-static int gen_tlval_set(const char *target, TlNode *e, FILE *out, char **err);","-"," /* Call-Argumente als TlVal-Ausdrucksliste: Zahl->Zahl, String->String,","    Var->Var, Null->Null, Binop->num. Gibt Komma-Separierung aus. */"," static int gen_call_args(TlNodeList *args, FILE *out, char **err) {"]}]}]}
