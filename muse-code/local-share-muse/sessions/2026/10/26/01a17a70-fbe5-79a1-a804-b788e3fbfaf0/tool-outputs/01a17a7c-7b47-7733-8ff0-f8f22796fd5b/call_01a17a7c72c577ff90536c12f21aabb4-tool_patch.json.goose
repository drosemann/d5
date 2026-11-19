// Goose-Port-Spiegel von: muse-code/local-share-muse/sessions/2026/10/26/01a17a70-fbe5-79a1-a804-b788e3fbfaf0/tool-outputs/01a17a7c-7b47-7733-8ff0-f8f22796fd5b/call_01a17a7c72c577ff90536c12f21aabb4-tool_patch.json
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: muse-code/local-share-muse/sessions/2026/10/26/01a17a70-fbe5-79a1-a804-b788e3fbfaf0/tool-outputs/01a17a7c-7b47-7733-8ff0-f8f22796fd5b/call_01a17a7c72c577ff90536c12f21aabb4-tool_patch.json");
}

// ---- Original-Code (muse-code/local-share-muse/sessions/2026/10/26/01a17a70-fbe5-79a1-a804-b788e3fbfaf0/tool-outputs/01a17a7c-7b47-7733-8ff0-f8f22796fd5b/call_01a17a7c72c577ff90536c12f21aabb4-tool_patch.json), unveraendert, als Inline-Doku ----
// {"files":[{"path":"\\\\?\\C:\\Users\\danie\\OneDrive\\github-repos\\infra-pilot\\docker-compose.yml","hunks":[{"oldStart":192,"oldLines":7,"newStart":192,"newLines":10,"lines":["       SERVER_CREATION_CHANNEL_ID: ${SERVER_CREATION_CHANNEL_ID:-}","       LOCATION_ID: ${LOCATION_ID:-1}","       API_BASE_URL: http://management-panel:3001","-      FEDERATION_API_TOKEN: ${FEDERATION_API_TOKEN:-}","+      FEDERATION_API_TOKEN: ${FEDERATION_API_TOKEN:-}","+      FEATURE_FLAGS_ENABLED: ${FEATURE_FLAGS_ENABLED:-false}","+      FEATURE_FLAGS_PANEL_URL: ${FEATURE_FLAGS_PANEL_URL:-http://management-panel:3001}","+      FEATURE_FLAGS_SERVICE_TOKEN: ${FEATURE_FLAGS_SERVICE_TOKEN:-}","       DB_HOST: postgres","       DB_PORT: 5432","       DB_USER: ${POSTGRES_USER:-infra_pilot}"]}]}]}
