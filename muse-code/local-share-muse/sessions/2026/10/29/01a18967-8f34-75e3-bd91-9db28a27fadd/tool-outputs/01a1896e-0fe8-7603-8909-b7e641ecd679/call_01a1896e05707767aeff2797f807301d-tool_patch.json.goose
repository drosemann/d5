// Goose-Port-Spiegel von: muse-code/local-share-muse/sessions/2026/10/29/01a18967-8f34-75e3-bd91-9db28a27fadd/tool-outputs/01a1896e-0fe8-7603-8909-b7e641ecd679/call_01a1896e05707767aeff2797f807301d-tool_patch.json
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: muse-code/local-share-muse/sessions/2026/10/29/01a18967-8f34-75e3-bd91-9db28a27fadd/tool-outputs/01a1896e-0fe8-7603-8909-b7e641ecd679/call_01a1896e05707767aeff2797f807301d-tool_patch.json");
}

// ---- Original-Code (muse-code/local-share-muse/sessions/2026/10/29/01a18967-8f34-75e3-bd91-9db28a27fadd/tool-outputs/01a1896e-0fe8-7603-8909-b7e641ecd679/call_01a1896e05707767aeff2797f807301d-tool_patch.json), unveraendert, als Inline-Doku ----
// {"files":[{"path":"\\\\?\\C:\\Users\\danie\\OneDrive\\github-repos\\Agentenplattform\\infra\\caddy\\Caddyfile","hunks":[{"oldStart":1,"oldLines":0,"newStart":1,"newLines":5,"lines":["+{$default}:80 {","+  reverse_proxy /api/* backend:8000","+  reverse_proxy /health/* backend:8000","+  reverse_proxy /* frontend:80","+}"]}]}]}
