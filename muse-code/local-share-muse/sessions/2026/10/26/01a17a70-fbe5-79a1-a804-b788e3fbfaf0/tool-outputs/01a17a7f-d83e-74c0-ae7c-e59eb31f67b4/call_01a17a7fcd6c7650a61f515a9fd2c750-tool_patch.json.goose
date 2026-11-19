// Goose-Port-Spiegel von: muse-code/local-share-muse/sessions/2026/10/26/01a17a70-fbe5-79a1-a804-b788e3fbfaf0/tool-outputs/01a17a7f-d83e-74c0-ae7c-e59eb31f67b4/call_01a17a7fcd6c7650a61f515a9fd2c750-tool_patch.json
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: muse-code/local-share-muse/sessions/2026/10/26/01a17a70-fbe5-79a1-a804-b788e3fbfaf0/tool-outputs/01a17a7f-d83e-74c0-ae7c-e59eb31f67b4/call_01a17a7fcd6c7650a61f515a9fd2c750-tool_patch.json");
}

// ---- Original-Code (muse-code/local-share-muse/sessions/2026/10/26/01a17a70-fbe5-79a1-a804-b788e3fbfaf0/tool-outputs/01a17a7f-d83e-74c0-ae7c-e59eb31f67b4/call_01a17a7fcd6c7650a61f515a9fd2c750-tool_patch.json), unveraendert, als Inline-Doku ----
// {"files":[{"path":"\\\\?\\C:\\Users\\danie\\OneDrive\\github-repos\\infra-pilot\\services\\management-panel\\server\\index.ts","hunks":[{"oldStart":4519,"oldLines":7,"newStart":4519,"newLines":7,"lines":[" }"," "," // GET /api/feature-flags/evaluate — any authenticated user, resolved map only.","-app.get('/api/feature-flags/evaluate', verifyAuth, async (req: Request, res: Response) => {","+app.get('/api/feature-flags/evaluate', verifyFlagReader, async (req: Request, res: Response) => {","   try {","     const env = (process.env.NODE_ENV === 'production' ? 'production' : 'development') as 'development' | 'staging' | 'production';","     const subject = {"]}]}]}
