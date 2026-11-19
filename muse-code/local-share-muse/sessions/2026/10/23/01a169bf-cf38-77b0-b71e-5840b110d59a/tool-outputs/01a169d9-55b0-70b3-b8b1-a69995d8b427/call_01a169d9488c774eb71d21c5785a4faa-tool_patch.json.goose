// Goose-Port-Spiegel von: muse-code/local-share-muse/sessions/2026/10/23/01a169bf-cf38-77b0-b71e-5840b110d59a/tool-outputs/01a169d9-55b0-70b3-b8b1-a69995d8b427/call_01a169d9488c774eb71d21c5785a4faa-tool_patch.json
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: muse-code/local-share-muse/sessions/2026/10/23/01a169bf-cf38-77b0-b71e-5840b110d59a/tool-outputs/01a169d9-55b0-70b3-b8b1-a69995d8b427/call_01a169d9488c774eb71d21c5785a4faa-tool_patch.json");
}

// ---- Original-Code (muse-code/local-share-muse/sessions/2026/10/23/01a169bf-cf38-77b0-b71e-5840b110d59a/tool-outputs/01a169d9-55b0-70b3-b8b1-a69995d8b427/call_01a169d9488c774eb71d21c5785a4faa-tool_patch.json), unveraendert, als Inline-Doku ----
// {"files":[{"path":"\\\\?\\C:\\Users\\danie\\OneDrive\\github-repos\\ai-chat-webui\\server.js","hunks":[{"oldStart":64,"oldLines":9,"newStart":64,"newLines":13,"lines":[" "," const ALLOWED_ORIGIN = process.env.ALLOWED_ORIGIN || `http://localhost:${process.env.PORT || 3000}`;"," ","+const allowedOrigins = [ALLOWED_ORIGIN, process.env.SITE_URL, process.env.APP_PUBLIC_URL].filter(Boolean);","+"," app.use((req, res, next) => {","     const requestOrigin = req.headers.origin;","-    if (requestOrigin && requestOrigin === ALLOWED_ORIGIN) {","+    // Exact-match allowlist only. Unknown origins get no ACAO header, so","+    // browsers will not expose responses cross-origin. Never use \"*\".","+    if (requestOrigin && allowedOrigins.includes(requestOrigin)) {","         res.header('Access-Control-Allow-Origin', requestOrigin);","         res.header('Vary', 'Origin');","     }"]}]}]}
