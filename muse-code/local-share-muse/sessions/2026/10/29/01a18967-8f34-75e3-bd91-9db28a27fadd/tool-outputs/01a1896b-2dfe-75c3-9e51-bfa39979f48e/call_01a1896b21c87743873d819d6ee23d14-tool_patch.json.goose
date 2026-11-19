// Goose-Port-Spiegel von: muse-code/local-share-muse/sessions/2026/10/29/01a18967-8f34-75e3-bd91-9db28a27fadd/tool-outputs/01a1896b-2dfe-75c3-9e51-bfa39979f48e/call_01a1896b21c87743873d819d6ee23d14-tool_patch.json
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: muse-code/local-share-muse/sessions/2026/10/29/01a18967-8f34-75e3-bd91-9db28a27fadd/tool-outputs/01a1896b-2dfe-75c3-9e51-bfa39979f48e/call_01a1896b21c87743873d819d6ee23d14-tool_patch.json");
}

// ---- Original-Code (muse-code/local-share-muse/sessions/2026/10/29/01a18967-8f34-75e3-bd91-9db28a27fadd/tool-outputs/01a1896b-2dfe-75c3-9e51-bfa39979f48e/call_01a1896b21c87743873d819d6ee23d14-tool_patch.json), unveraendert, als Inline-Doku ----
// {"files":[{"path":"\\\\?\\C:\\Users\\danie\\OneDrive\\github-repos\\Agentenplattform\\apps\\backend\\app\\services\\safety.py","hunks":[{"oldStart":1,"oldLines":0,"newStart":1,"newLines":5,"lines":["+\"\"\"SOS: deterministisch, idempotent, Standard = Testmodus ohne Versand.\"\"\"","+def sos_validieren(lat: float, lon: float) -> tuple[bool, str]:","+    if not (-90 <= lat <= 90 and -180 <= lon <= 180): return False, \"Koordinaten ungültig\"","+    return True, \"ok\"","+SOS_STATUS = [\"test\",\"ausgeloest\",\"bestaetigt\"]"]}]}]}
