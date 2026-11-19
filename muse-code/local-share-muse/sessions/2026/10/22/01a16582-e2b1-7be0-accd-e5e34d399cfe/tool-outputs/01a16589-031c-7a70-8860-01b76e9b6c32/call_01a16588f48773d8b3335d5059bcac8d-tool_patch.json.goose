// Goose-Port-Spiegel von: muse-code/local-share-muse/sessions/2026/10/22/01a16582-e2b1-7be0-accd-e5e34d399cfe/tool-outputs/01a16589-031c-7a70-8860-01b76e9b6c32/call_01a16588f48773d8b3335d5059bcac8d-tool_patch.json
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: muse-code/local-share-muse/sessions/2026/10/22/01a16582-e2b1-7be0-accd-e5e34d399cfe/tool-outputs/01a16589-031c-7a70-8860-01b76e9b6c32/call_01a16588f48773d8b3335d5059bcac8d-tool_patch.json");
}

// ---- Original-Code (muse-code/local-share-muse/sessions/2026/10/22/01a16582-e2b1-7be0-accd-e5e34d399cfe/tool-outputs/01a16589-031c-7a70-8860-01b76e9b6c32/call_01a16588f48773d8b3335d5059bcac8d-tool_patch.json), unveraendert, als Inline-Doku ----
// {"files":[{"path":"\\\\?\\C:\\Users\\danie\\OneDrive\\github-repos\\infra-pilot\\cli\\ipilot\\commands\\pet.py","hunks":[{"oldStart":61,"oldLines":8,"newStart":61,"newLines":5,"lines":["         ipilot pet rename my-api \"Sir Deploys-a-Lot\"","     \"\"\"","     client = _get_client(ctx)","-    result = client.post(","-        f\"/api/v1/fleet/creatures/{workload_id}/rename\",","-        {\"display_name\": display_name},","-    )","+    result = client.rename_creature(workload_id, display_name)","     print_output(result, output or ctx.obj.get(\"output\", \"table\"))"]}]}]}
