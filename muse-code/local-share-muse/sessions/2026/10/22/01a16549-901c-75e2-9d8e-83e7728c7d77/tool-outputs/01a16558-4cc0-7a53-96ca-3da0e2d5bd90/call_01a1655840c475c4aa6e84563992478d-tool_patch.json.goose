// Goose-Port-Spiegel von: muse-code/local-share-muse/sessions/2026/10/22/01a16549-901c-75e2-9d8e-83e7728c7d77/tool-outputs/01a16558-4cc0-7a53-96ca-3da0e2d5bd90/call_01a1655840c475c4aa6e84563992478d-tool_patch.json
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: muse-code/local-share-muse/sessions/2026/10/22/01a16549-901c-75e2-9d8e-83e7728c7d77/tool-outputs/01a16558-4cc0-7a53-96ca-3da0e2d5bd90/call_01a1655840c475c4aa6e84563992478d-tool_patch.json");
}

// ---- Original-Code (muse-code/local-share-muse/sessions/2026/10/22/01a16549-901c-75e2-9d8e-83e7728c7d77/tool-outputs/01a16558-4cc0-7a53-96ca-3da0e2d5bd90/call_01a1655840c475c4aa6e84563992478d-tool_patch.json), unveraendert, als Inline-Doku ----
// {"files":[{"path":"\\\\?\\C:\\Users\\danie\\OneDrive\\github-repos\\stranded-horizons\\db\\schema.sql","hunks":[{"oldStart":79,"oldLines":3,"newStart":79,"newLines":9,"lines":[" alter table ticks enable row level security;"," alter table admin_audit enable row level security;"," alter table imports enable row level security;","+","+create table if not exists admin_allowlist (","+  user_id uuid primary key,","+  added_at timestamptz not null default now()","+);","+alter table admin_allowlist enable row level security;"]}]}]}
