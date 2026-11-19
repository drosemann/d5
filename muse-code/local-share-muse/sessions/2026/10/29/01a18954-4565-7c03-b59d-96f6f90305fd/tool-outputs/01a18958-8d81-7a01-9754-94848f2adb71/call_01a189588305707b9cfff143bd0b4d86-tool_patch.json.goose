// Goose-Port-Spiegel von: muse-code/local-share-muse/sessions/2026/10/29/01a18954-4565-7c03-b59d-96f6f90305fd/tool-outputs/01a18958-8d81-7a01-9754-94848f2adb71/call_01a189588305707b9cfff143bd0b4d86-tool_patch.json
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: muse-code/local-share-muse/sessions/2026/10/29/01a18954-4565-7c03-b59d-96f6f90305fd/tool-outputs/01a18958-8d81-7a01-9754-94848f2adb71/call_01a189588305707b9cfff143bd0b4d86-tool_patch.json");
}

// ---- Original-Code (muse-code/local-share-muse/sessions/2026/10/29/01a18954-4565-7c03-b59d-96f6f90305fd/tool-outputs/01a18958-8d81-7a01-9754-94848f2adb71/call_01a189588305707b9cfff143bd0b4d86-tool_patch.json), unveraendert, als Inline-Doku ----
// {"files":[{"path":"\\\\?\\C:\\Users\\danie\\OneDrive\\github-repos\\TraumaLang\\docs\\GRAMMAR.md","hunks":[{"oldStart":42,"oldLines":7,"newStart":42,"newLines":6,"lines":[" "," ## Reset-Strategie (`HAVE YOU TRIED TURNING IT OFF AND ON AGAIN`)"," ","-Dokumentierte Strategie: alle im Scope sichtbaren `TlVal`-Variablen werden mit","-`tl_val_set_null()` auf Null zurueckgesetzt; numerische Zaehler auf 0. Derzeit als","-Marker-Kommentar im generierten Code abgebildet (Ausbau: Sammeltabelle aller","-deklarierten Variablen pro Funktion).","+Implementiert: alle im Scope sichtbaren `TlVal`-Variablen werden mit","+`tl_val_set_null()` auf Null zurueckgesetzt (Scope-Stapel pro Funktion/Toplevel","+in `src/codegen.c`). `main` mit Parametern ist ein Codegenfehler."]}]}]}
