// Goose-Port-Spiegel von: muse-code/local-share-muse/sessions/2026/10/22/01a16549-901c-75e2-9d8e-83e7728c7d77/tool-outputs/01a16559-c008-7d91-a376-56007d2e557c/call_01a16559b61277ef9fdb1e9a6f5842d3-tool_patch.json
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: muse-code/local-share-muse/sessions/2026/10/22/01a16549-901c-75e2-9d8e-83e7728c7d77/tool-outputs/01a16559-c008-7d91-a376-56007d2e557c/call_01a16559b61277ef9fdb1e9a6f5842d3-tool_patch.json");
}

// ---- Original-Code (muse-code/local-share-muse/sessions/2026/10/22/01a16549-901c-75e2-9d8e-83e7728c7d77/tool-outputs/01a16559-c008-7d91-a376-56007d2e557c/call_01a16559b61277ef9fdb1e9a6f5842d3-tool_patch.json), unveraendert, als Inline-Doku ----
// {"files":[{"path":"\\\\?\\C:\\Users\\danie\\OneDrive\\github-repos\\stranded-horizons\\server\\src\\index.js","hunks":[{"oldStart":110,"oldLines":8,"newStart":110,"newLines":8,"lines":["   const app = createApp();","   const http = createServer(app);","   attachSockets(http);","-  let n = BigInt(Date.now() / 2000);","-  setInterval(() => { n += 1n; runTick('shard-0', n).catch(() => {}); }, 2000);","+  let n = Math.floor(Date.now() / 2000);","+  setInterval(() => { n += 1; runTick('shard-0', n).catch(() => {}); }, 2000);","   const port = Number(process.env.PORT || 3000);","   http.listen(port, () => console.log(`sh-server listening on :${port}`));"," }"]}]}]}
