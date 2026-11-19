// Goose-Port-Spiegel von: muse-code/local-share-muse/sessions/2026/10/26/01a17a70-fbe5-79a1-a804-b788e3fbfaf0/tool-outputs/01a17a82-88d6-7b02-824a-4ee73e9087ba/call_01a17a8282d57260a08ef75a5bcce52e-tool_patch.json
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: muse-code/local-share-muse/sessions/2026/10/26/01a17a70-fbe5-79a1-a804-b788e3fbfaf0/tool-outputs/01a17a82-88d6-7b02-824a-4ee73e9087ba/call_01a17a8282d57260a08ef75a5bcce52e-tool_patch.json");
}

// ---- Original-Code (muse-code/local-share-muse/sessions/2026/10/26/01a17a70-fbe5-79a1-a804-b788e3fbfaf0/tool-outputs/01a17a82-88d6-7b02-824a-4ee73e9087ba/call_01a17a8282d57260a08ef75a5bcce52e-tool_patch.json), unveraendert, als Inline-Doku ----
// {"files":[{"path":"\\\\?\\C:\\Users\\danie\\OneDrive\\github-repos\\infra-pilot\\wiki\\03-Configuration.md","hunks":[{"oldStart":53,"oldLines":7,"newStart":53,"newLines":8,"lines":[" - The panel owns flags (`feature_flags` + `feature_flag_rules` tables).","   Admins manage them at `/feature-flags` in the UI; every change is audit-logged."," - Consumers (orchestrator `feature_flags.py`, CLI `ipilot flags`, Discord","-  `feature-flags.js`) poll `GET /api/feature-flags/evaluate` every 30 s.","+  `feature-flags.js`) poll `GET /api/feature-flags/evaluate` every 30 s,","+  plus an immediate WebSocket push (`?channel=feature-flags`) on every write.","   Set `FEATURE_FLAGS_ENABLED=true` to opt in; default is `false` (code defaults apply)."," - Kill switch: `POST /api/feature-flags/:key/kill` (or the Kill button, or","   `ipilot flags kill <key>`) disables a flag in all environments at once."]}]}]}
