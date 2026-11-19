// Goose-Port-Spiegel von: muse-code/local-share-muse/sessions/2026/10/29/01a18967-8f34-75e3-bd91-9db28a27fadd/tool-outputs/01a1896f-d4df-7b11-b5ca-778c8d27049e/call_01a1896fc97f774abe7a8bc879d8e384-tool_patch.json
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: muse-code/local-share-muse/sessions/2026/10/29/01a18967-8f34-75e3-bd91-9db28a27fadd/tool-outputs/01a1896f-d4df-7b11-b5ca-778c8d27049e/call_01a1896fc97f774abe7a8bc879d8e384-tool_patch.json");
}

// ---- Original-Code (muse-code/local-share-muse/sessions/2026/10/29/01a18967-8f34-75e3-bd91-9db28a27fadd/tool-outputs/01a1896f-d4df-7b11-b5ca-778c8d27049e/call_01a1896fc97f774abe7a8bc879d8e384-tool_patch.json), unveraendert, als Inline-Doku ----
// {"files":[{"path":"\\\\?\\C:\\Users\\danie\\OneDrive\\github-repos\\Agentenplattform\\workers\\browser\\worker.py","hunks":[{"oldStart":1,"oldLines":0,"newStart":1,"newLines":5,"lines":["+\"\"\"Isolierter Browser-Worker: nur SSRF-geprüfte URLs, ohne Secrets.\"\"\"","+from app.tools.registry import ssrf_geprueft","+def abrufen(url: str) -> str:","+    if not ssrf_geprueft(url): raise ValueError(\"URL blockiert (SSRF-Schutz)\")","+    return f\"[Platzhalter] Abruf von {url} erfolgt isoliert und protokolliert.\""]}]}]}
