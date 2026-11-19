// Goose-Port-Spiegel von: muse-code/local-share-muse/sessions/2026/10/22/01a16582-e2b1-7be0-accd-e5e34d399cfe/tool-outputs/01a165a6-539f-7283-8c44-335850cabd33/call_01a165a647137662acb3a7cbb612bd77-tool_patch.json
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: muse-code/local-share-muse/sessions/2026/10/22/01a16582-e2b1-7be0-accd-e5e34d399cfe/tool-outputs/01a165a6-539f-7283-8c44-335850cabd33/call_01a165a647137662acb3a7cbb612bd77-tool_patch.json");
}

// ---- Original-Code (muse-code/local-share-muse/sessions/2026/10/22/01a16582-e2b1-7be0-accd-e5e34d399cfe/tool-outputs/01a165a6-539f-7283-8c44-335850cabd33/call_01a165a647137662acb3a7cbb612bd77-tool_patch.json), unveraendert, als Inline-Doku ----
// {"files":[{"path":"\\\\?\\C:\\Users\\danie\\OneDrive\\github-repos\\infra-pilot\\services\\management-panel\\.env.example","hunks":[{"oldStart":28,"oldLines":4,"newStart":28,"newLines":9,"lines":[" CORS_ORIGINS=http://localhost:5173,http://localhost:3001"," "," # Service URLs","-INTEGRATION_SERVICE_URL=http://localhost:9000","+INTEGRATION_SERVICE_URL=http://localhost:9000","+","+# Orchestrator (enables deployment forwarding and the Living Fleet proxy).","+# ORCHESTRATOR_API_TOKEN is the orchestrator's FEDERATION_API_TOKEN value.","+ORCHESTRATOR_URL=http://localhost:8500","+ORCHESTRATOR_API_TOKEN="]}]}]}
