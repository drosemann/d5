// Goose-Port-Spiegel von: muse-code/local-share-muse/sessions/2026/10/22/01a16582-e2b1-7be0-accd-e5e34d399cfe/tool-outputs/01a16589-02f8-7850-a3f9-ef90a2502ba5/call_01a16588f3e871fba0eb06c6fb7defe1-tool_patch.json
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: muse-code/local-share-muse/sessions/2026/10/22/01a16582-e2b1-7be0-accd-e5e34d399cfe/tool-outputs/01a16589-02f8-7850-a3f9-ef90a2502ba5/call_01a16588f3e871fba0eb06c6fb7defe1-tool_patch.json");
}

// ---- Original-Code (muse-code/local-share-muse/sessions/2026/10/22/01a16582-e2b1-7be0-accd-e5e34d399cfe/tool-outputs/01a16589-02f8-7850-a3f9-ef90a2502ba5/call_01a16588f3e871fba0eb06c6fb7defe1-tool_patch.json), unveraendert, als Inline-Doku ----
// {"files":[{"path":"\\\\?\\C:\\Users\\danie\\OneDrive\\github-repos\\infra-pilot\\cli\\ipilot\\commands\\pet.py","hunks":[{"oldStart":44,"oldLines":7,"newStart":44,"newLines":7,"lines":["         ipilot pet status my-api","     \"\"\"","     client = _get_client(ctx)","-    result = client.get(f\"/api/v1/fleet/creatures/{workload_id}\")","+    result = client.get_creature(workload_id)","     print_output(result, output or ctx.obj.get(\"output\", \"table\"))"," "," "]}]}]}
