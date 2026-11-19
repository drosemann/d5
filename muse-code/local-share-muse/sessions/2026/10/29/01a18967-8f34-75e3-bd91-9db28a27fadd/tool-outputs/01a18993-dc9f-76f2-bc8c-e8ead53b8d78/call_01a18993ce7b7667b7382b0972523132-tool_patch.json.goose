// Goose-Port-Spiegel von: muse-code/local-share-muse/sessions/2026/10/29/01a18967-8f34-75e3-bd91-9db28a27fadd/tool-outputs/01a18993-dc9f-76f2-bc8c-e8ead53b8d78/call_01a18993ce7b7667b7382b0972523132-tool_patch.json
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: muse-code/local-share-muse/sessions/2026/10/29/01a18967-8f34-75e3-bd91-9db28a27fadd/tool-outputs/01a18993-dc9f-76f2-bc8c-e8ead53b8d78/call_01a18993ce7b7667b7382b0972523132-tool_patch.json");
}

// ---- Original-Code (muse-code/local-share-muse/sessions/2026/10/29/01a18967-8f34-75e3-bd91-9db28a27fadd/tool-outputs/01a18993-dc9f-76f2-bc8c-e8ead53b8d78/call_01a18993ce7b7667b7382b0972523132-tool_patch.json), unveraendert, als Inline-Doku ----
// {"files":[{"path":"\\\\?\\C:\\Users\\danie\\OneDrive\\github-repos\\Agentenplattform\\compose.monitoring.yaml","hunks":[{"oldStart":1,"oldLines":0,"newStart":1,"newLines":16,"lines":["+# Optionales Monitoring-Profil: Prometheus + Grafana (separat aktivierbar).","+# Start: docker compose -f compose.yaml -f compose.monitoring.yaml --profile monitoring up -d","+services:","+  prometheus:","+    image: prom/prometheus:v2.53.0","+    volumes: [./infra/monitoring/prometheus.yml:/etc/prometheus/prometheus.yml:ro]","+    networks: [intern]","+    profiles: [monitoring]","+    restart: unless-stopped","+  grafana:","+    image: grafana/grafana:11.1.0","+    volumes: [grafana-data:/var/lib/grafana]","+    networks: [intern]","+    profiles: [monitoring]","+    restart: unless-stopped","+volumes: {grafana-data: {}}"]}]}]}
