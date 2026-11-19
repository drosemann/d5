// Goose-Port-Spiegel von: muse-code/local-share-muse/sessions/2026/10/27/01a17a97-12e6-72a2-99cc-fcfdc6482e24/tool-outputs/01a17aa0-5ec7-7363-93e9-920d30d72d1a/call_01a17aa0571f72ffb9459c9eedba3bc4-tool_patch.json
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: muse-code/local-share-muse/sessions/2026/10/27/01a17a97-12e6-72a2-99cc-fcfdc6482e24/tool-outputs/01a17aa0-5ec7-7363-93e9-920d30d72d1a/call_01a17aa0571f72ffb9459c9eedba3bc4-tool_patch.json");
}

// ---- Original-Code (muse-code/local-share-muse/sessions/2026/10/27/01a17a97-12e6-72a2-99cc-fcfdc6482e24/tool-outputs/01a17aa0-5ec7-7363-93e9-920d30d72d1a/call_01a17aa0571f72ffb9459c9eedba3bc4-tool_patch.json), unveraendert, als Inline-Doku ----
// {"files":[{"path":"\\\\?\\C:\\Users\\danie\\OneDrive\\github-repos\\TraumaLang\\src\\codegen.c","hunks":[{"oldStart":103,"oldLines":7,"newStart":103,"newLines":9,"lines":["     collect_uses_list(body, &decl, &imp, 1);","     for (int i = 0; i < imp.n; i++) {","         for (int k = 0; k < ind; k++) fputs(\"    \", out);","-        fprintf(out, \"TlVal %s; tl_val_init(&%s); /* implizit: Verwendung ohne Deklaration */\\n\", imp.names[i], imp.names[i]);","+        fputs(\"TlVal \", out); emit_ident(out, imp.names[i]);","+        fputs(\"; tl_val_init(&\", out); emit_ident(out, imp.names[i]);","+        fputs(\"); /* implizit: Verwendung ohne Deklaration */\\n\", out);","     }"," }"," "]}]}]}
