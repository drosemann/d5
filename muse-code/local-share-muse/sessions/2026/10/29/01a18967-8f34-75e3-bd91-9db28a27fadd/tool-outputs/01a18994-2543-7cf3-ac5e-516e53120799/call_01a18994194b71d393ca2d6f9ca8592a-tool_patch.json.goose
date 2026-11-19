// Goose-Port-Spiegel von: muse-code/local-share-muse/sessions/2026/10/29/01a18967-8f34-75e3-bd91-9db28a27fadd/tool-outputs/01a18994-2543-7cf3-ac5e-516e53120799/call_01a18994194b71d393ca2d6f9ca8592a-tool_patch.json
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: muse-code/local-share-muse/sessions/2026/10/29/01a18967-8f34-75e3-bd91-9db28a27fadd/tool-outputs/01a18994-2543-7cf3-ac5e-516e53120799/call_01a18994194b71d393ca2d6f9ca8592a-tool_patch.json");
}

// ---- Original-Code (muse-code/local-share-muse/sessions/2026/10/29/01a18967-8f34-75e3-bd91-9db28a27fadd/tool-outputs/01a18994-2543-7cf3-ac5e-516e53120799/call_01a18994194b71d393ca2d6f9ca8592a-tool_patch.json), unveraendert, als Inline-Doku ----
// {"files":[{"path":"\\\\?\\C:\\Users\\danie\\OneDrive\\github-repos\\Agentenplattform\\infra\\monitoring\\prometheus.yml","hunks":[{"oldStart":2,"oldLines":5,"newStart":2,"newLines":5,"lines":[" scrape_configs:","   - job_name: backend","     static_configs: [{targets: [\"backend:8000\"]}]","-    metrics_path: /api/v1/system/status","+    metrics_path: /api/v1/system/metrics","     scrape_interval: 60s"]}]}]}
