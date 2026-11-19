// Goose-Port-Spiegel von: muse-code/local-share-muse/sessions/2026/10/29/01a18954-4565-7c03-b59d-96f6f90305fd/tool-outputs/01a18958-1792-7a63-a339-86ed97d32928/call_01a1895808da743ba08fd121011dab35-tool_patch.json
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: muse-code/local-share-muse/sessions/2026/10/29/01a18954-4565-7c03-b59d-96f6f90305fd/tool-outputs/01a18958-1792-7a63-a339-86ed97d32928/call_01a1895808da743ba08fd121011dab35-tool_patch.json");
}

// ---- Original-Code (muse-code/local-share-muse/sessions/2026/10/29/01a18954-4565-7c03-b59d-96f6f90305fd/tool-outputs/01a18958-1792-7a63-a339-86ed97d32928/call_01a1895808da743ba08fd121011dab35-tool_patch.json), unveraendert, als Inline-Doku ----
// {"files":[{"path":"\\\\?\\C:\\Users\\danie\\OneDrive\\github-repos\\TraumaLang\\src\\codegen.c","hunks":[{"oldStart":398,"oldLines":7,"newStart":398,"newLines":7,"lines":["     case N_SLEEP_OP: indent(out, ind); fputs(\"tl_sync_wait(); /* WE NEED TO SYNC: 8s */\\n\", out); return 0;","     case N_DOUBLE_RUN:","         indent(out, ind);","-        if (s->name) { fputs(\"tlf_\", out); emit_ident(out, s->name); fputs(\"(); tlf_\", out); emit_ident(out, s->name); fputs(\"(); /* double-booked: 2x sequenziell */\\n\", out); }","+        if (s->name) { fputs(\"(void)tlf_\", out); emit_ident(out, s->name); fputs(\"(); (void)tlf_\", out); emit_ident(out, s->name); fputs(\"(); /* double-booked: 2x sequenziell */\\n\", out); }","         else fputs(\"/* I WAS DOUBLE-BOOKED: kein Ziel, nur Marker */\\n\", out);","         return 0;","     case N_DIRECTIVE:"]}]}]}
