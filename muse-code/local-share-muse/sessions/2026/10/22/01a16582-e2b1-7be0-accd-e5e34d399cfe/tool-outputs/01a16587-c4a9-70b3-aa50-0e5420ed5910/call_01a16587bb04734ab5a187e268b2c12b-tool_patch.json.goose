// Goose-Port-Spiegel von: muse-code/local-share-muse/sessions/2026/10/22/01a16582-e2b1-7be0-accd-e5e34d399cfe/tool-outputs/01a16587-c4a9-70b3-aa50-0e5420ed5910/call_01a16587bb04734ab5a187e268b2c12b-tool_patch.json
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: muse-code/local-share-muse/sessions/2026/10/22/01a16582-e2b1-7be0-accd-e5e34d399cfe/tool-outputs/01a16587-c4a9-70b3-aa50-0e5420ed5910/call_01a16587bb04734ab5a187e268b2c12b-tool_patch.json");
}

// ---- Original-Code (muse-code/local-share-muse/sessions/2026/10/22/01a16582-e2b1-7be0-accd-e5e34d399cfe/tool-outputs/01a16587-c4a9-70b3-aa50-0e5420ed5910/call_01a16587bb04734ab5a187e268b2c12b-tool_patch.json), unveraendert, als Inline-Doku ----
// {"files":[{"path":"\\\\?\\C:\\Users\\danie\\OneDrive\\github-repos\\infra-pilot\\cli\\ipilot\\commands\\pet.py","hunks":[{"oldStart":28,"oldLines":7,"newStart":28,"newLines":7,"lines":["         ipilot pet list","     \"\"\"","     client = _get_client(ctx)","-    result = client.get(\"/api/v1/fleet/creatures\")","+    result = client.list_creatures()","     print_output(result, output or ctx.obj.get(\"output\", \"table\"))"," "," "]}]}]}
