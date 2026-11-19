// Goose-Port-Spiegel von: muse-code/local-share-muse/sessions/2026/10/26/01a17a70-fbe5-79a1-a804-b788e3fbfaf0/tool-outputs/01a17a7d-65a4-7130-95aa-efc161aafa8d/call_01a17a7d5a1271a6935589526d65ef95-tool_patch.json
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: muse-code/local-share-muse/sessions/2026/10/26/01a17a70-fbe5-79a1-a804-b788e3fbfaf0/tool-outputs/01a17a7d-65a4-7130-95aa-efc161aafa8d/call_01a17a7d5a1271a6935589526d65ef95-tool_patch.json");
}

// ---- Original-Code (muse-code/local-share-muse/sessions/2026/10/26/01a17a70-fbe5-79a1-a804-b788e3fbfaf0/tool-outputs/01a17a7d-65a4-7130-95aa-efc161aafa8d/call_01a17a7d5a1271a6935589526d65ef95-tool_patch.json), unveraendert, als Inline-Doku ----
// {"files":[{"path":"\\\\?\\C:\\Users\\danie\\OneDrive\\github-repos\\infra-pilot\\CHANGELOG.md","hunks":[{"oldStart":6,"oldLines":7,"newStart":6,"newLines":16,"lines":[" "," ## [Unreleased]"," ","-### Added","+### Added","+","+- Feature flags: panel-owned `feature_flags`/`feature_flag_rules` tables with","+  per-environment enable/rollout/targeting, admin UI at `/feature-flags`,","+  `GET /api/feature-flags/evaluate` + kill switch, RBAC","+  `feature-flag:read/manage` permissions, orchestrator `feature_flags.py`","+  consumer (gates `living_fleet`), `ipilot flags` CLI group, Discord","+  `feature-flags.js` consumer, and a shared evaluation contract fixture","+  (`tests/fixtures/feature-flag-contract.yaml`). Opt-in via","+  `FEATURE_FLAGS_ENABLED`; env override `FEATURE_FLAG_<KEY>` always wins."," "," - Safe update flow: `scripts/update.sh` (backup first,","   `git pull --ff-only`, rebuild, health + volume verification;"]}]}]}
