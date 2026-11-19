// Goose-Port-Spiegel von: muse-code/local-share-muse/sessions/2026/10/22/01a16582-e2b1-7be0-accd-e5e34d399cfe/tool-outputs/01a1659c-ca09-7b50-a840-4123b831a00e/call_01a1659cbedd7785a0e2cc9108140e90-tool_patch.json
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: muse-code/local-share-muse/sessions/2026/10/22/01a16582-e2b1-7be0-accd-e5e34d399cfe/tool-outputs/01a1659c-ca09-7b50-a840-4123b831a00e/call_01a1659cbedd7785a0e2cc9108140e90-tool_patch.json");
}

// ---- Original-Code (muse-code/local-share-muse/sessions/2026/10/22/01a16582-e2b1-7be0-accd-e5e34d399cfe/tool-outputs/01a1659c-ca09-7b50-a840-4123b831a00e/call_01a1659cbedd7785a0e2cc9108140e90-tool_patch.json), unveraendert, als Inline-Doku ----
// {"files":[{"path":"\\\\?\\C:\\Users\\danie\\OneDrive\\github-repos\\infra-pilot\\services\\orchestrator-agent\\living_fleet.py","hunks":[{"oldStart":315,"oldLines":7,"newStart":315,"newLines":7,"lines":["     creature = data.get(workload_id)","     if creature is None:","         return web.json_response({\"error\": \"unknown workload\"}, status=404)","-    return web.json_response(public_view(creature))","+    return web.json_response(public_view(creature, creature.get(\"last_signals\") or {}))"," "," "," async def fleet_rename(request) -> Any:  # type: ignore[no-untyped-def]"]}]}]}
