// Goose-Port-Spiegel von: muse-code/local-share-muse/sessions/2026/10/26/01a17a70-fbe5-79a1-a804-b788e3fbfaf0/tool-outputs/01a17a7c-7002-7bb0-8613-2f04f8031935/call_01a17a7c68947159a80d95da9df7ecf2-tool_patch.json
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: muse-code/local-share-muse/sessions/2026/10/26/01a17a70-fbe5-79a1-a804-b788e3fbfaf0/tool-outputs/01a17a7c-7002-7bb0-8613-2f04f8031935/call_01a17a7c68947159a80d95da9df7ecf2-tool_patch.json");
}

// ---- Original-Code (muse-code/local-share-muse/sessions/2026/10/26/01a17a70-fbe5-79a1-a804-b788e3fbfaf0/tool-outputs/01a17a7c-7002-7bb0-8613-2f04f8031935/call_01a17a7c68947159a80d95da9df7ecf2-tool_patch.json), unveraendert, als Inline-Doku ----
// {"files":[{"path":"\\\\?\\C:\\Users\\danie\\OneDrive\\github-repos\\infra-pilot\\docker-compose.yml","hunks":[{"oldStart":131,"oldLines":7,"newStart":131,"newLines":11,"lines":["       # Bearer token for the /api/ route group. Fails closed when set:","       # requests without a matching Authorization header get a 401.","       FEDERATION_API_TOKEN: ${FEDERATION_API_TOKEN:?FEDERATION_API_TOKEN must be set (see .env.example or scripts/generate-env.sh)}","-      PYTHONUNBUFFERED: \"1\"","+      PYTHONUNBUFFERED: \"1\"","+      FEATURE_FLAGS_ENABLED: ${FEATURE_FLAGS_ENABLED:-false}","+      FEATURE_FLAGS_PANEL_URL: ${FEATURE_FLAGS_PANEL_URL:-http://management-panel:3001}","+      FEATURE_FLAGS_POLL_SECONDS: ${FEATURE_FLAGS_POLL_SECONDS:-30}","+      FEATURE_FLAGS_SERVICE_TOKEN: ${FEATURE_FLAGS_SERVICE_TOKEN:-}","     ports:","       - \"${ORCHESTRATOR_WEBHOOK_PORT:-8500}:8500\"","     healthcheck:"]}]}]}
