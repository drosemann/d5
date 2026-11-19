// Goose-Port-Spiegel von: muse-code/local-share-muse/sessions/2026/10/29/01a18954-4565-7c03-b59d-96f6f90305fd/tool-outputs/01a18958-29dd-79e0-8a6d-150be661dd15/call_01a189581e497392bd408146f8073a2f-tool_patch.json
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: muse-code/local-share-muse/sessions/2026/10/29/01a18954-4565-7c03-b59d-96f6f90305fd/tool-outputs/01a18958-29dd-79e0-8a6d-150be661dd15/call_01a189581e497392bd408146f8073a2f-tool_patch.json");
}

// ---- Original-Code (muse-code/local-share-muse/sessions/2026/10/29/01a18954-4565-7c03-b59d-96f6f90305fd/tool-outputs/01a18958-29dd-79e0-8a6d-150be661dd15/call_01a189581e497392bd408146f8073a2f-tool_patch.json), unveraendert, als Inline-Doku ----
// {"files":[{"path":"\\\\?\\C:\\Users\\danie\\OneDrive\\github-repos\\TraumaLang\\src\\codegen.c","hunks":[{"oldStart":376,"oldLines":7,"newStart":376,"newLines":7,"lines":["         }","         fputs(\") {\\n\", out);","         scope_push(s->body, s);","-        emit_implicits(s->body, out, 1);","+        emit_implicits_fn(s->body, s, out, 1);","         if (gen_body(s->body, out, 1, err)) { scope_pop(); return -1; }","         indent(out, 1); fputs(\"{ TlVal _d; tl_val_init(&_d); return _d; }\\n\", out);","         scope_pop();"]}]}]}
