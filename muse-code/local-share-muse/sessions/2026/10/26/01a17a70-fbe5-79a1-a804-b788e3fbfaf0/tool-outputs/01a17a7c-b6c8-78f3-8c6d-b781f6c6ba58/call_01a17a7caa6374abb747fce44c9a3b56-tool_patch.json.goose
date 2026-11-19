// Goose-Port-Spiegel von: muse-code/local-share-muse/sessions/2026/10/26/01a17a70-fbe5-79a1-a804-b788e3fbfaf0/tool-outputs/01a17a7c-b6c8-78f3-8c6d-b781f6c6ba58/call_01a17a7caa6374abb747fce44c9a3b56-tool_patch.json
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: muse-code/local-share-muse/sessions/2026/10/26/01a17a70-fbe5-79a1-a804-b788e3fbfaf0/tool-outputs/01a17a7c-b6c8-78f3-8c6d-b781f6c6ba58/call_01a17a7caa6374abb747fce44c9a3b56-tool_patch.json");
}

// ---- Original-Code (muse-code/local-share-muse/sessions/2026/10/26/01a17a70-fbe5-79a1-a804-b788e3fbfaf0/tool-outputs/01a17a7c-b6c8-78f3-8c6d-b781f6c6ba58/call_01a17a7caa6374abb747fce44c9a3b56-tool_patch.json), unveraendert, als Inline-Doku ----
// {"files":[{"path":"\\\\?\\C:\\Users\\danie\\OneDrive\\github-repos\\infra-pilot\\docs\\ARCHITECTURE.md","hunks":[{"oldStart":57,"oldLines":6,"newStart":57,"newLines":17,"lines":[" "," ---"," ","+## Feature flags","+","+Panel Postgres is the single source of truth (`feature_flags`,","+`feature_flag_rules`); orchestrator, CLI, and Discord service are","+read-only consumers polling `GET /api/feature-flags/evaluate`.","+Evaluation order: archived/expired → default; missing/disabled rule →","+off; deny-list → off; allow-list → on; percentage bucket","+`sha256(\"flag:subject\") % 100 < rollout` → on, else off. Fallback:","+cache → `FEATURE_FLAG_<KEY>` env override → code default. A flag","+never replaces auth/RBAC — it only hides or blocks a feature early.","+"," ## Invariants"," "," 1. Panel operational `/api/*` routes require authentication."]}]}]}
