// Goose-Port-Spiegel von: muse-code/local-share-muse/sessions/2026/10/23/01a169bf-cf38-77b0-b71e-5840b110d59a/tool-outputs/01a169d9-8c5b-7e30-afa5-07a923bfcf5c/call_01a169d95df276d584f14160268a298b-tool_patch.json
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: muse-code/local-share-muse/sessions/2026/10/23/01a169bf-cf38-77b0-b71e-5840b110d59a/tool-outputs/01a169d9-8c5b-7e30-afa5-07a923bfcf5c/call_01a169d95df276d584f14160268a298b-tool_patch.json");
}

// ---- Original-Code (muse-code/local-share-muse/sessions/2026/10/23/01a169bf-cf38-77b0-b71e-5840b110d59a/tool-outputs/01a169d9-8c5b-7e30-afa5-07a923bfcf5c/call_01a169d95df276d584f14160268a298b-tool_patch.json), unveraendert, als Inline-Doku ----
// {"files":[{"path":"\\\\?\\C:\\Users\\danie\\OneDrive\\github-repos\\ai-chat-webui\\server.js","hunks":[{"oldStart":218,"oldLines":6,"newStart":218,"newLines":14,"lines":[" });"," "," const PORT = process.env.PORT || 3000;","+","+if (!SUPABASE_URL || !SUPABASE_ANON_KEY || !SUPABASE_JWT_SECRET) {","+    console.warn('[security] Supabase is not fully configured (SUPABASE_URL / SUPABASE_ANON_KEY / SUPABASE_JWT_SECRET). /api/* will reject all requests until it is.');","+}","+if (process.env.NODE_ENV === 'production' && allowedOrigins.some((o) => o.startsWith('http://localhost') || o.startsWith('http://127.'))) {","+    console.warn('[security] NODE_ENV=production but a localhost origin is allowlisted for CORS. Serve over HTTPS and allowlist the public URL only.');","+}","+"," app.listen(PORT, () => {","     console.log(`Server running at http://localhost:${PORT}`);","     console.log('Environment:', {"]}]}]}
