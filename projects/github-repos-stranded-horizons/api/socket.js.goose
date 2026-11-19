// Goose-Port-Spiegel von: projects/github-repos-stranded-horizons/api/socket.js
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/github-repos-stranded-horizons/api/socket.js");
}

// ---- Original-Code (projects/github-repos-stranded-horizons/api/socket.js), unveraendert, als Inline-Doku ----
// import { createApp, attachSockets } from '../../server/src/index.js';
//
// // Vercel-compatible entry: Vercel runs this as a serverless function, so the
// // Socket.IO server attaches per-invocation on the long-lived Node runtime.
// // Hobby default: without REDIS_URL / SUPABASE_JWT_SECRET the socket layer
// // still boots; auth rejects until env is configured (see docs/v2/SELFHOST.md).
// // For a VPS, run `npm start` in server/ instead (persistent process + 2s tick).
// let handler;
// export default function (req, res) {
//   if (!handler) {
//     const app = createApp();
//     handler = app;
//     attachSockets(req.socket.server, { skipRedis: false });
//   }
//   return handler(req, res);
// }
//
