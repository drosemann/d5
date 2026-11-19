// Goose-Port-Spiegel von: muse-code/local-share-muse/sessions/2026/10/26/01a17a70-fbe5-79a1-a804-b788e3fbfaf0/tool-outputs/01a17a7c-35cf-70e3-9cdd-57f376d63ed4/call_01a17a7c2ad67110b4f526aa884ded8b-tool_patch.json
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: muse-code/local-share-muse/sessions/2026/10/26/01a17a70-fbe5-79a1-a804-b788e3fbfaf0/tool-outputs/01a17a7c-35cf-70e3-9cdd-57f376d63ed4/call_01a17a7c2ad67110b4f526aa884ded8b-tool_patch.json");
}

// ---- Original-Code (muse-code/local-share-muse/sessions/2026/10/26/01a17a70-fbe5-79a1-a804-b788e3fbfaf0/tool-outputs/01a17a7c-35cf-70e3-9cdd-57f376d63ed4/call_01a17a7c2ad67110b4f526aa884ded8b-tool_patch.json), unveraendert, als Inline-Doku ----
// {"files":[{"path":"\\\\?\\C:\\Users\\danie\\OneDrive\\github-repos\\infra-pilot\\.env.example","hunks":[{"oldStart":55,"oldLines":6,"newStart":55,"newLines":12,"lines":[" # compose falls back to 'admin' only when unset (change immediately)."," GRAFANA_ADMIN_PASSWORD="," ","+# --- Feature Flags (panel is source of truth; consumers poll the panel API) ---","+FEATURE_FLAGS_ENABLED=false","+FEATURE_FLAGS_PANEL_URL=http://localhost:3001","+FEATURE_FLAGS_POLL_SECONDS=30","+FEATURE_FLAGS_SERVICE_TOKEN=","+"," # --- Discord Service ---"," DISCORD_TOKEN="," PTERODACTYL_API_URL=http://localhost:8080/api"]}]}]}
