// Goose-Port-Spiegel von: muse-code/local-share-muse/sessions/2026/10/26/01a17a70-fbe5-79a1-a804-b788e3fbfaf0/tool-outputs/01a17a7d-4eb9-7923-b5a3-609b5927148e/call_01a17a7d466a7774b621cbcd90e9a690-tool_patch.json
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: muse-code/local-share-muse/sessions/2026/10/26/01a17a70-fbe5-79a1-a804-b788e3fbfaf0/tool-outputs/01a17a7d-4eb9-7923-b5a3-609b5927148e/call_01a17a7d466a7774b621cbcd90e9a690-tool_patch.json");
}

// ---- Original-Code (muse-code/local-share-muse/sessions/2026/10/26/01a17a70-fbe5-79a1-a804-b788e3fbfaf0/tool-outputs/01a17a7d-4eb9-7923-b5a3-609b5927148e/call_01a17a7d466a7774b621cbcd90e9a690-tool_patch.json), unveraendert, als Inline-Doku ----
// {"files":[{"path":"\\\\?\\C:\\Users\\danie\\OneDrive\\github-repos\\infra-pilot\\cli\\README.md","hunks":[{"oldStart":49,"oldLines":5,"newStart":49,"newLines":13,"lines":[" ## Development checks"," "," ```bash","-pytest tests/cli/ -v","+pytest tests/cli/ -v","+pytest tests/orchestrator/test_feature_flags.py -v  # feature-flag evaluation contract","+```","+","+## Feature flags","+","+`ipilot flags ...` manages panel feature flags: `list`, `evaluate`,","+`create <key>`, `rollout <key> --env production --percent 50`, and","+`kill <key>` (disables everywhere at once). Writes require a panel admin."," ```"]}]}]}
