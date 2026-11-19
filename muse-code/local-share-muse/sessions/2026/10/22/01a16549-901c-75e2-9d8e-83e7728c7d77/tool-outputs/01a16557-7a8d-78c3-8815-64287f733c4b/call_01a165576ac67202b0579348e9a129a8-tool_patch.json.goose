// Goose-Port-Spiegel von: muse-code/local-share-muse/sessions/2026/10/22/01a16549-901c-75e2-9d8e-83e7728c7d77/tool-outputs/01a16557-7a8d-78c3-8815-64287f733c4b/call_01a165576ac67202b0579348e9a129a8-tool_patch.json
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: muse-code/local-share-muse/sessions/2026/10/22/01a16549-901c-75e2-9d8e-83e7728c7d77/tool-outputs/01a16557-7a8d-78c3-8815-64287f733c4b/call_01a165576ac67202b0579348e9a129a8-tool_patch.json");
}

// ---- Original-Code (muse-code/local-share-muse/sessions/2026/10/22/01a16549-901c-75e2-9d8e-83e7728c7d77/tool-outputs/01a16557-7a8d-78c3-8815-64287f733c4b/call_01a165576ac67202b0579348e9a129a8-tool_patch.json), unveraendert, als Inline-Doku ----
// {"files":[{"path":"\\\\?\\C:\\Users\\danie\\OneDrive\\github-repos\\stranded-horizons\\api\\socket.js","hunks":[{"oldStart":1,"oldLines":0,"newStart":1,"newLines":16,"lines":["+import { createApp, attachSockets } from '../../server/src/index.js';","+","+// Vercel-compatible entry: Vercel runs this as a serverless function, so the","+// Socket.IO server attaches per-invocation on the long-lived Node runtime.","+// Hobby default: without REDIS_URL / SUPABASE_JWT_SECRET the socket layer","+// still boots; auth rejects until env is configured (see docs/v2/SELFHOST.md).","+// For a VPS, run `npm start` in server/ instead (persistent process + 2s tick).","+let handler;","+export default function (req, res) {","+  if (!handler) {","+    const app = createApp();","+    handler = app;","+    attachSockets(req.socket.server, { skipRedis: false });","+  }","+  return handler(req, res);","+}"]}]}]}
