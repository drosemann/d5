// Goose-Port-Spiegel von: muse-code/local-share-muse/sessions/2026/10/26/01a17a70-fbe5-79a1-a804-b788e3fbfaf0/tool-outputs/01a17a7f-d860-7fc2-a027-4c2df967e435/call_01a17a7fcfa374958ee410073094b96a-tool_patch.json
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: muse-code/local-share-muse/sessions/2026/10/26/01a17a70-fbe5-79a1-a804-b788e3fbfaf0/tool-outputs/01a17a7f-d860-7fc2-a027-4c2df967e435/call_01a17a7fcfa374958ee410073094b96a-tool_patch.json");
}

// ---- Original-Code (muse-code/local-share-muse/sessions/2026/10/26/01a17a70-fbe5-79a1-a804-b788e3fbfaf0/tool-outputs/01a17a7f-d860-7fc2-a027-4c2df967e435/call_01a17a7fcfa374958ee410073094b96a-tool_patch.json), unveraendert, als Inline-Doku ----
// {"files":[{"path":"\\\\?\\C:\\Users\\danie\\OneDrive\\github-repos\\infra-pilot\\services\\management-panel\\server\\index.ts","hunks":[{"oldStart":3450,"oldLines":7,"newStart":3450,"newLines":18,"lines":["   output: string[];"," }"," ","-const terminalRooms = new Map<string, TerminalRoom>();","+const terminalRooms = new Map<string, TerminalRoom>();","+","+// Long-lived flag subscribers (?channel=feature-flags). Kept outside rooms:","+// they only receive invalidation broadcasts pushed on every flag write.","+const flagSubscribers = new Set<WebSocket>();","+","+function broadcastFlagChange(changedKey?: string) {","+  const msg = JSON.stringify({ type: 'feature-flags:changed', key: changedKey || null, at: new Date().toISOString() });","+  for (const client of flagSubscribers) {","+    if (client.readyState === WebSocket.OPEN) client.send(msg);","+  }","+}"," "," wss.on('connection', (ws, req) => {","   const url = new URL(req.url || '', 'http://localhost');"]}]}]}
