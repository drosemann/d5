// Goose-Port-Spiegel von: muse-code/local-share-muse/sessions/2026/10/26/01a17a70-fbe5-79a1-a804-b788e3fbfaf0/tool-outputs/01a17a79-5a0c-7013-87ec-ca1da9b0ad25/call_01a17a7953d9750986abca0e33898d59-tool_patch.json
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: muse-code/local-share-muse/sessions/2026/10/26/01a17a70-fbe5-79a1-a804-b788e3fbfaf0/tool-outputs/01a17a79-5a0c-7013-87ec-ca1da9b0ad25/call_01a17a7953d9750986abca0e33898d59-tool_patch.json");
}

// ---- Original-Code (muse-code/local-share-muse/sessions/2026/10/26/01a17a70-fbe5-79a1-a804-b788e3fbfaf0/tool-outputs/01a17a79-5a0c-7013-87ec-ca1da9b0ad25/call_01a17a7953d9750986abca0e33898d59-tool_patch.json), unveraendert, als Inline-Doku ----
// {"files":[{"path":"\\\\?\\C:\\Users\\danie\\OneDrive\\github-repos\\infra-pilot\\services\\management-panel\\server\\openapi.ts","hunks":[{"oldStart":509,"oldLines":7,"newStart":509,"newLines":7,"lines":["   },"," };"," ","-spec.schemas = spec.schemas || {};","+spec.components.schemas.FeatureFlag = { type: 'object', properties: { key: { type: 'string' }, enabled: { type: 'boolean' } } };"," spec.paths['/feature-flags/evaluate'] = {","   get: {","     summary: 'Evaluate feature flags for the caller',"]}]}]}
