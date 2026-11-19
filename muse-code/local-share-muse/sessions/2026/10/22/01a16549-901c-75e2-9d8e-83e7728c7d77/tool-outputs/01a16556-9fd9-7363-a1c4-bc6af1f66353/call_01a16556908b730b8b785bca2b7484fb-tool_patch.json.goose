// Goose-Port-Spiegel von: muse-code/local-share-muse/sessions/2026/10/22/01a16549-901c-75e2-9d8e-83e7728c7d77/tool-outputs/01a16556-9fd9-7363-a1c4-bc6af1f66353/call_01a16556908b730b8b785bca2b7484fb-tool_patch.json
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: muse-code/local-share-muse/sessions/2026/10/22/01a16549-901c-75e2-9d8e-83e7728c7d77/tool-outputs/01a16556-9fd9-7363-a1c4-bc6af1f66353/call_01a16556908b730b8b785bca2b7484fb-tool_patch.json");
}

// ---- Original-Code (muse-code/local-share-muse/sessions/2026/10/22/01a16549-901c-75e2-9d8e-83e7728c7d77/tool-outputs/01a16556-9fd9-7363-a1c4-bc6af1f66353/call_01a16556908b730b8b785bca2b7484fb-tool_patch.json), unveraendert, als Inline-Doku ----
// {"files":[{"path":"\\\\?\\C:\\Users\\danie\\OneDrive\\github-repos\\stranded-horizons\\server\\src\\db.js","hunks":[{"oldStart":1,"oldLines":0,"newStart":1,"newLines":10,"lines":["+import pg from 'pg';","+","+const pool = new pg.Pool({","+  connectionString: process.env.DATABASE_URL,","+  max: 10,","+});","+","+export const db = {","+  query: (text, params) => pool.query(text, params),","+};"]}]}]}
