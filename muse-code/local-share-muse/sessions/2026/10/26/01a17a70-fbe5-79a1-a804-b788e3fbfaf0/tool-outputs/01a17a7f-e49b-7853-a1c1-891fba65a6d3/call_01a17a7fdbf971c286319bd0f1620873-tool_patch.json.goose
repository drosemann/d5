// Goose-Port-Spiegel von: muse-code/local-share-muse/sessions/2026/10/26/01a17a70-fbe5-79a1-a804-b788e3fbfaf0/tool-outputs/01a17a7f-e49b-7853-a1c1-891fba65a6d3/call_01a17a7fdbf971c286319bd0f1620873-tool_patch.json
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: muse-code/local-share-muse/sessions/2026/10/26/01a17a70-fbe5-79a1-a804-b788e3fbfaf0/tool-outputs/01a17a7f-e49b-7853-a1c1-891fba65a6d3/call_01a17a7fdbf971c286319bd0f1620873-tool_patch.json");
}

// ---- Original-Code (muse-code/local-share-muse/sessions/2026/10/26/01a17a70-fbe5-79a1-a804-b788e3fbfaf0/tool-outputs/01a17a7f-e49b-7853-a1c1-891fba65a6d3/call_01a17a7fdbf971c286319bd0f1620873-tool_patch.json), unveraendert, als Inline-Doku ----
// {"files":[{"path":"\\\\?\\C:\\Users\\danie\\OneDrive\\github-repos\\infra-pilot\\services\\management-panel\\server\\index.ts","hunks":[{"oldStart":3467,"oldLines":7,"newStart":3467,"newLines":16,"lines":["   const url = new URL(req.url || '', 'http://localhost');","   const appId = url.searchParams.get('appId');","   const sessionId = url.searchParams.get('sessionId');","-  const displayName = url.searchParams.get('displayName') || 'Anonymous';","+  const displayName = url.searchParams.get('displayName') || 'Anonymous';","+","+  // Feature-flag invalidation channel: no auth on the socket itself, it only","+  // carries \"something changed\" nudges — clients refetch over authenticated HTTP.","+  if (url.searchParams.get('channel') === 'feature-flags') {","+    flagSubscribers.add(ws);","+    ws.on('close', () => { flagSubscribers.delete(ws); });","+    ws.send(JSON.stringify({ type: 'feature-flags:hello' }));","+    return;","+  }"," ","   // Collaborative Terminal connection","   if (sessionId) {"]}]}]}
