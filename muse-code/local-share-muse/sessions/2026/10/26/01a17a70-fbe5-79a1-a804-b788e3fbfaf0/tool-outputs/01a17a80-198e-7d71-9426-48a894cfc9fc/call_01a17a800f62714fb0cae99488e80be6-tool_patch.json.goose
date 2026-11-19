// Goose-Port-Spiegel von: muse-code/local-share-muse/sessions/2026/10/26/01a17a70-fbe5-79a1-a804-b788e3fbfaf0/tool-outputs/01a17a80-198e-7d71-9426-48a894cfc9fc/call_01a17a800f62714fb0cae99488e80be6-tool_patch.json
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: muse-code/local-share-muse/sessions/2026/10/26/01a17a70-fbe5-79a1-a804-b788e3fbfaf0/tool-outputs/01a17a80-198e-7d71-9426-48a894cfc9fc/call_01a17a800f62714fb0cae99488e80be6-tool_patch.json");
}

// ---- Original-Code (muse-code/local-share-muse/sessions/2026/10/26/01a17a70-fbe5-79a1-a804-b788e3fbfaf0/tool-outputs/01a17a80-198e-7d71-9426-48a894cfc9fc/call_01a17a800f62714fb0cae99488e80be6-tool_patch.json), unveraendert, als Inline-Doku ----
// {"files":[{"path":"\\\\?\\C:\\Users\\danie\\OneDrive\\github-repos\\infra-pilot\\services\\management-panel\\server\\index.ts","hunks":[{"oldStart":4616,"oldLines":7,"newStart":4616,"newLines":7,"lines":["     const errMsg = validateRule(req.body.rule);","     if (errMsg) return res.status(400).json({ error: errMsg });","     try { await upsertFlagRule(req.params.key, req.body.rule, userId); } catch (err: any) { return res.status(400).json({ error: err.message }); }","-    if (error) return res.status(400).json({ error: error.message });","+    broadcastFlagChange(req.params.key);","   } else {","     const { error } = await supabase.from('feature_flags').update(req.body).eq('key', req.params.key);","     if (error) return res.status(400).json({ error: error.message });"]}]}]}
