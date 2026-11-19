// Goose-Port-Spiegel von: muse-code/local-share-muse/sessions/2026/10/26/01a17a70-fbe5-79a1-a804-b788e3fbfaf0/tool-outputs/01a17a80-41e6-7f41-8f49-aa495e2c8487/call_01a17a803b4477a097ce9308b5493855-tool_patch.json
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: muse-code/local-share-muse/sessions/2026/10/26/01a17a70-fbe5-79a1-a804-b788e3fbfaf0/tool-outputs/01a17a80-41e6-7f41-8f49-aa495e2c8487/call_01a17a803b4477a097ce9308b5493855-tool_patch.json");
}

// ---- Original-Code (muse-code/local-share-muse/sessions/2026/10/26/01a17a70-fbe5-79a1-a804-b788e3fbfaf0/tool-outputs/01a17a80-41e6-7f41-8f49-aa495e2c8487/call_01a17a803b4477a097ce9308b5493855-tool_patch.json), unveraendert, als Inline-Doku ----
// {"files":[{"path":"\\\\?\\C:\\Users\\danie\\OneDrive\\github-repos\\infra-pilot\\services\\management-panel\\server\\index.ts","hunks":[{"oldStart":4633,"oldLines":6,"newStart":4633,"newLines":7,"lines":["   const { data: before } = await supabase.from('feature_flag_rules').select('*').eq('flag_key', req.params.key);","   await supabase.from('feature_flag_rules').update({ enabled: false, rollout_percentage: 0 }).eq('flag_key', req.params.key);","   await logAudit(userId, 'flag:kill', 'feature_flag', req.params.key, before, { enabled: false }, (req as any).ip);","+  broadcastFlagChange(req.params.key);","   res.json({ ok: true, killed: req.params.key });"," });"," "]}]}]}
