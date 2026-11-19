// Goose-Port-Spiegel von: muse-code/local-share-muse/sessions/2026/10/27/01a17a97-12e6-72a2-99cc-fcfdc6482e24/tool-outputs/01a17a9f-28c3-7421-80d4-075c560de390/call_01a17a9f210973b1878eaa5c4e2cfb7c-tool_patch.json
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: muse-code/local-share-muse/sessions/2026/10/27/01a17a97-12e6-72a2-99cc-fcfdc6482e24/tool-outputs/01a17a9f-28c3-7421-80d4-075c560de390/call_01a17a9f210973b1878eaa5c4e2cfb7c-tool_patch.json");
}

// ---- Original-Code (muse-code/local-share-muse/sessions/2026/10/27/01a17a97-12e6-72a2-99cc-fcfdc6482e24/tool-outputs/01a17a9f-28c3-7421-80d4-075c560de390/call_01a17a9f210973b1878eaa5c4e2cfb7c-tool_patch.json), unveraendert, als Inline-Doku ----
// {"files":[{"path":"\\\\?\\C:\\Users\\danie\\OneDrive\\github-repos\\TraumaLang\\src\\codegen.c","hunks":[{"oldStart":205,"oldLines":7,"newStart":205,"newLines":7,"lines":["     case N_SLEEP_OP: indent(out, ind); fputs(\"tl_sync_wait(); /* WE NEED TO SYNC: 8s */\\n\", out); return 0;","     case N_DOUBLE_RUN:","         indent(out, ind);","-        if (s->name) { emit_ident(out, s->name); fputs(\"(); \", out); emit_ident(out, s->name); fputs(\"(); /* double-booked: 2x sequenziell */\\n\", out); }","+        if (s->name) { fputs(\"tlf_\", out); emit_ident(out, s->name); fputs(\"(); tlf_\", out); emit_ident(out, s->name); fputs(\"(); /* double-booked: 2x sequenziell */\\n\", out); }","         else fputs(\"/* I WAS DOUBLE-BOOKED: kein Ziel, nur Marker */\\n\", out);","         return 0;","     case N_DIRECTIVE:"]}]}]}
