// Goose-Port-Spiegel von: muse-code/local-share-muse/sessions/2026/10/26/01a17a70-fbe5-79a1-a804-b788e3fbfaf0/tool-outputs/01a17a81-3cef-7133-8616-3df04a6364e1/call_01a17a81355e7130a1090a3753b883b9-tool_patch.json
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: muse-code/local-share-muse/sessions/2026/10/26/01a17a70-fbe5-79a1-a804-b788e3fbfaf0/tool-outputs/01a17a81-3cef-7133-8616-3df04a6364e1/call_01a17a81355e7130a1090a3753b883b9-tool_patch.json");
}

// ---- Original-Code (muse-code/local-share-muse/sessions/2026/10/26/01a17a70-fbe5-79a1-a804-b788e3fbfaf0/tool-outputs/01a17a81-3cef-7133-8616-3df04a6364e1/call_01a17a81355e7130a1090a3753b883b9-tool_patch.json), unveraendert, als Inline-Doku ----
// {"files":[{"path":"\\\\?\\C:\\Users\\danie\\OneDrive\\github-repos\\infra-pilot\\services\\management-panel\\tests\\helpers\\supabase-mock.ts","hunks":[{"oldStart":73,"oldLines":6,"newStart":73,"newLines":16,"lines":["     return row ? makeResponse(row) : makeResponse(null, { code: 'PGRST116' });","   }"," ","+  maybeSingle() {","+    if (this.pendingInsert) {","+      const rows = Array.isArray(this.pendingInsert) ? this.pendingInsert : [this.pendingInsert];","+      const inserted = rows.map((row) => this.insertRow(row));","+      return makeResponse(inserted[0] ?? null);","+    }","+    const row = this.rows().find((candidate) => this.matches(candidate));","+    return makeResponse(row ?? null);","+  }","+","   then(resolve: (value: any) => void, reject?: (reason?: any) => void) {","     return this.execute().then(resolve, reject);","   }"]}]}]}
