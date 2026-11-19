// Goose-Port-Spiegel von: muse-code/local-share-muse/sessions/2026/10/26/01a17a70-fbe5-79a1-a804-b788e3fbfaf0/tool-outputs/01a17a7f-fd86-7613-98d0-84b36581a85c/call_01a17a7ff716711d9365f368e19abc2d-tool_patch.json
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: muse-code/local-share-muse/sessions/2026/10/26/01a17a70-fbe5-79a1-a804-b788e3fbfaf0/tool-outputs/01a17a7f-fd86-7613-98d0-84b36581a85c/call_01a17a7ff716711d9365f368e19abc2d-tool_patch.json");
}

// ---- Original-Code (muse-code/local-share-muse/sessions/2026/10/26/01a17a70-fbe5-79a1-a804-b788e3fbfaf0/tool-outputs/01a17a7f-fd86-7613-98d0-84b36581a85c/call_01a17a7ff716711d9365f368e19abc2d-tool_patch.json), unveraendert, als Inline-Doku ----
// {"files":[{"path":"\\\\?\\C:\\Users\\danie\\OneDrive\\github-repos\\infra-pilot\\services\\management-panel\\server\\index.ts","hunks":[{"oldStart":4615,"oldLines":7,"newStart":4615,"newLines":7,"lines":["   if (req.body.rule) {","     const errMsg = validateRule(req.body.rule);","     if (errMsg) return res.status(400).json({ error: errMsg });","-    const { error } = await supabase.from('feature_flag_rules').upsert({ flag_key: req.params.key, ...req.body.rule, updated_by: userId });","+    try { await upsertFlagRule(req.params.key, req.body.rule, userId); } catch (err: any) { return res.status(400).json({ error: err.message }); }","     if (error) return res.status(400).json({ error: error.message });","   } else {","     const { error } = await supabase.from('feature_flags').update(req.body).eq('key', req.params.key);"]}]}]}
