// Goose-Port-Spiegel von: muse-code/local-share-muse/sessions/2026/10/26/01a17a70-fbe5-79a1-a804-b788e3fbfaf0/tool-outputs/01a17a80-5015-7050-8b60-78185dc87458/call_01a17a80492c724eb425e848cb0857aa-tool_patch.json
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: muse-code/local-share-muse/sessions/2026/10/26/01a17a70-fbe5-79a1-a804-b788e3fbfaf0/tool-outputs/01a17a80-5015-7050-8b60-78185dc87458/call_01a17a80492c724eb425e848cb0857aa-tool_patch.json");
}

// ---- Original-Code (muse-code/local-share-muse/sessions/2026/10/26/01a17a70-fbe5-79a1-a804-b788e3fbfaf0/tool-outputs/01a17a80-5015-7050-8b60-78185dc87458/call_01a17a80492c724eb425e848cb0857aa-tool_patch.json), unveraendert, als Inline-Doku ----
// {"files":[{"path":"\\\\?\\C:\\Users\\danie\\OneDrive\\github-repos\\infra-pilot\\services\\management-panel\\server\\index.ts","hunks":[{"oldStart":4622,"oldLines":6,"newStart":4622,"newLines":7,"lines":["     const { error } = await supabase.from('feature_flags').update(req.body).eq('key', req.params.key);","     if (error) return res.status(400).json({ error: error.message });","   }","+  broadcastFlagChange(req.params.key);","   await logAudit(userId, 'flag:update', 'feature_flag', req.params.key, before, req.body, (req as any).ip);","   res.json({ ok: true });"," });"]}]}]}
