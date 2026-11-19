// Goose-Port-Spiegel von: muse-code/local-share-muse/sessions/2026/10/22/01a16549-901c-75e2-9d8e-83e7728c7d77/tool-outputs/01a16556-86fd-7de0-b20c-14142c5d9bd8/call_01a165567a3d7393bea4d5ff2ffa02d1-tool_patch.json
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: muse-code/local-share-muse/sessions/2026/10/22/01a16549-901c-75e2-9d8e-83e7728c7d77/tool-outputs/01a16556-86fd-7de0-b20c-14142c5d9bd8/call_01a165567a3d7393bea4d5ff2ffa02d1-tool_patch.json");
}

// ---- Original-Code (muse-code/local-share-muse/sessions/2026/10/22/01a16549-901c-75e2-9d8e-83e7728c7d77/tool-outputs/01a16556-86fd-7de0-b20c-14142c5d9bd8/call_01a165567a3d7393bea4d5ff2ffa02d1-tool_patch.json), unveraendert, als Inline-Doku ----
// {"files":[{"path":"\\\\?\\C:\\Users\\danie\\OneDrive\\github-repos\\stranded-horizons\\db\\seed.sql","hunks":[{"oldStart":1,"oldLines":0,"newStart":1,"newLines":7,"lines":["+-- Seed a small dev world: owner ids are placeholders for local testing.","+insert into bases (owner_id, chunk_x, chunk_y, world_x, world_y, efficiency_cached)","+values","+  (null, 50, 50, 100.0, 100.0, 99.29),","+  (null, 52, 48, 500.0, -300.0, 97.08),","+  (null, 65, 65, 3100.0, 3100.0, 78.07)","+on conflict do nothing;"]}]}]}
