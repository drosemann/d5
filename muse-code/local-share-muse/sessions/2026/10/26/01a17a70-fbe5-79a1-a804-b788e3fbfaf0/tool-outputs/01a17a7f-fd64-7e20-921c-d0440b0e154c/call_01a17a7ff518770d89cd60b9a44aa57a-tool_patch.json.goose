// Goose-Port-Spiegel von: muse-code/local-share-muse/sessions/2026/10/26/01a17a70-fbe5-79a1-a804-b788e3fbfaf0/tool-outputs/01a17a7f-fd64-7e20-921c-d0440b0e154c/call_01a17a7ff518770d89cd60b9a44aa57a-tool_patch.json
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: muse-code/local-share-muse/sessions/2026/10/26/01a17a70-fbe5-79a1-a804-b788e3fbfaf0/tool-outputs/01a17a7f-fd64-7e20-921c-d0440b0e154c/call_01a17a7ff518770d89cd60b9a44aa57a-tool_patch.json");
}

// ---- Original-Code (muse-code/local-share-muse/sessions/2026/10/26/01a17a70-fbe5-79a1-a804-b788e3fbfaf0/tool-outputs/01a17a7f-fd64-7e20-921c-d0440b0e154c/call_01a17a7ff518770d89cd60b9a44aa57a-tool_patch.json), unveraendert, als Inline-Doku ----
// {"files":[{"path":"\\\\?\\C:\\Users\\danie\\OneDrive\\github-repos\\infra-pilot\\services\\management-panel\\server\\index.ts","hunks":[{"oldStart":4601,"oldLines":7,"newStart":4601,"newLines":7,"lines":["   for (const r of rules || []) {","     const errMsg = validateRule(r);","     if (errMsg) return res.status(400).json({ error: errMsg });","-    await supabase.from('feature_flag_rules').upsert({ flag_key: key, ...r, updated_by: userId });","+    await upsertFlagRule(key, r, userId);","   }","   await logAudit(userId, 'flag:create', 'feature_flag', key, null, req.body, (req as any).ip);","   res.status(201).json({ flag: data });"]}]}]}
