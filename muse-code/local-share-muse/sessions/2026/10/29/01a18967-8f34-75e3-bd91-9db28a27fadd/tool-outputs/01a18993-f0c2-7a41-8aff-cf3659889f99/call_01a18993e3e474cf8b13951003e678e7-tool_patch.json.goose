// Goose-Port-Spiegel von: muse-code/local-share-muse/sessions/2026/10/29/01a18967-8f34-75e3-bd91-9db28a27fadd/tool-outputs/01a18993-f0c2-7a41-8aff-cf3659889f99/call_01a18993e3e474cf8b13951003e678e7-tool_patch.json
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: muse-code/local-share-muse/sessions/2026/10/29/01a18967-8f34-75e3-bd91-9db28a27fadd/tool-outputs/01a18993-f0c2-7a41-8aff-cf3659889f99/call_01a18993e3e474cf8b13951003e678e7-tool_patch.json");
}

// ---- Original-Code (muse-code/local-share-muse/sessions/2026/10/29/01a18967-8f34-75e3-bd91-9db28a27fadd/tool-outputs/01a18993-f0c2-7a41-8aff-cf3659889f99/call_01a18993e3e474cf8b13951003e678e7-tool_patch.json), unveraendert, als Inline-Doku ----
// {"files":[{"path":"\\\\?\\C:\\Users\\danie\\OneDrive\\github-repos\\Agentenplattform\\infra\\monitoring\\prometheus.yml","hunks":[{"oldStart":1,"oldLines":0,"newStart":1,"newLines":6,"lines":["+# Prometheus: scrapt Backend-Metriken (Platzhalter-Ziel; Backend legt /metrics nach).","+scrape_configs:","+  - job_name: backend","+    static_configs: [{targets: [\"backend:8000\"]}]","+    metrics_path: /api/v1/system/status","+    scrape_interval: 60s"]}]}]}
