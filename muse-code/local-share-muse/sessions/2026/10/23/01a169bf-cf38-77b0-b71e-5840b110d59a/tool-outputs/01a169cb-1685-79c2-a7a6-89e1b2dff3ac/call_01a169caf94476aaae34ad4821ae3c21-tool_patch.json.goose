// Goose-Port-Spiegel von: muse-code/local-share-muse/sessions/2026/10/23/01a169bf-cf38-77b0-b71e-5840b110d59a/tool-outputs/01a169cb-1685-79c2-a7a6-89e1b2dff3ac/call_01a169caf94476aaae34ad4821ae3c21-tool_patch.json
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: muse-code/local-share-muse/sessions/2026/10/23/01a169bf-cf38-77b0-b71e-5840b110d59a/tool-outputs/01a169cb-1685-79c2-a7a6-89e1b2dff3ac/call_01a169caf94476aaae34ad4821ae3c21-tool_patch.json");
}

// ---- Original-Code (muse-code/local-share-muse/sessions/2026/10/23/01a169bf-cf38-77b0-b71e-5840b110d59a/tool-outputs/01a169cb-1685-79c2-a7a6-89e1b2dff3ac/call_01a169caf94476aaae34ad4821ae3c21-tool_patch.json), unveraendert, als Inline-Doku ----
// {"files":[{"path":"\\\\?\\C:\\Users\\danie\\OneDrive\\github-repos\\ai-chat-webui\\supabase\\gateway\\Caddyfile","hunks":[{"oldStart":1,"oldLines":0,"newStart":1,"newLines":16,"lines":["+:8000 {","+\thandle /auth/v1/* {","+\t\turi strip_prefix /auth/v1","+\t\treverse_proxy auth:9999","+\t}","+\thandle /rest/v1/* {","+\t\turi strip_prefix /rest/v1","+\t\treverse_proxy rest:3000","+\t}","+\thandle /health {","+\t\trespond \"supabase gateway ok\" 200","+\t}","+\thandle {","+\t\trespond \"Not Found\" 404","+\t}","+}"]}]}]}
