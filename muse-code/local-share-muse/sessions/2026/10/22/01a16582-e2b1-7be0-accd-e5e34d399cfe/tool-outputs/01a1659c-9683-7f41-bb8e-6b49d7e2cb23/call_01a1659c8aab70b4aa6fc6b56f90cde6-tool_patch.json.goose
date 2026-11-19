// Goose-Port-Spiegel von: muse-code/local-share-muse/sessions/2026/10/22/01a16582-e2b1-7be0-accd-e5e34d399cfe/tool-outputs/01a1659c-9683-7f41-bb8e-6b49d7e2cb23/call_01a1659c8aab70b4aa6fc6b56f90cde6-tool_patch.json
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: muse-code/local-share-muse/sessions/2026/10/22/01a16582-e2b1-7be0-accd-e5e34d399cfe/tool-outputs/01a1659c-9683-7f41-bb8e-6b49d7e2cb23/call_01a1659c8aab70b4aa6fc6b56f90cde6-tool_patch.json");
}

// ---- Original-Code (muse-code/local-share-muse/sessions/2026/10/22/01a16582-e2b1-7be0-accd-e5e34d399cfe/tool-outputs/01a1659c-9683-7f41-bb8e-6b49d7e2cb23/call_01a1659c8aab70b4aa6fc6b56f90cde6-tool_patch.json), unveraendert, als Inline-Doku ----
// {"files":[{"path":"\\\\?\\C:\\Users\\danie\\OneDrive\\github-repos\\infra-pilot\\docker-compose.yml","hunks":[{"oldStart":187,"oldLines":7,"newStart":187,"newLines":8,"lines":["       PTERODACTYL_API_KEY: ${PTERODACTYL_API_KEY:-local-dev-key}","       SERVER_CREATION_CHANNEL_ID: ${SERVER_CREATION_CHANNEL_ID:-}","       LOCATION_ID: ${LOCATION_ID:-1}","-      API_BASE_URL: http://management-panel:3001","+      API_BASE_URL: http://management-panel:3001","+      FEDERATION_API_TOKEN: ${FEDERATION_API_TOKEN:-}","       DB_HOST: postgres","       DB_PORT: 5432","       DB_USER: ${POSTGRES_USER:-infra_pilot}"]}]}]}
