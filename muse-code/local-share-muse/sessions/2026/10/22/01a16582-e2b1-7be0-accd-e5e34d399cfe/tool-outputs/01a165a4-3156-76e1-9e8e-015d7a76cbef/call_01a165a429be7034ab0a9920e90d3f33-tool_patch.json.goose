// Goose-Port-Spiegel von: muse-code/local-share-muse/sessions/2026/10/22/01a16582-e2b1-7be0-accd-e5e34d399cfe/tool-outputs/01a165a4-3156-76e1-9e8e-015d7a76cbef/call_01a165a429be7034ab0a9920e90d3f33-tool_patch.json
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: muse-code/local-share-muse/sessions/2026/10/22/01a16582-e2b1-7be0-accd-e5e34d399cfe/tool-outputs/01a165a4-3156-76e1-9e8e-015d7a76cbef/call_01a165a429be7034ab0a9920e90d3f33-tool_patch.json");
}

// ---- Original-Code (muse-code/local-share-muse/sessions/2026/10/22/01a16582-e2b1-7be0-accd-e5e34d399cfe/tool-outputs/01a165a4-3156-76e1-9e8e-015d7a76cbef/call_01a165a429be7034ab0a9920e90d3f33-tool_patch.json), unveraendert, als Inline-Doku ----
// {"files":[{"path":"\\\\?\\C:\\Users\\danie\\OneDrive\\github-repos\\infra-pilot\\services\\orchestrator-agent\\webhook_server.py","hunks":[{"oldStart":943,"oldLines":6,"newStart":943,"newLines":9,"lines":["     import living_fleet","     app.router.add_get(\"/api/v1/fleet/creatures\", living_fleet.fleet_list)","     app.router.add_get(\"/api/v1/fleet/creatures/{workload_id}\", living_fleet.fleet_detail)","-    app.router.add_post(\"/api/v1/fleet/creatures/{workload_id}/rename\", living_fleet.fleet_rename)","+    app.router.add_post(\"/api/v1/fleet/creatures/{workload_id}/rename\", living_fleet.fleet_rename)","+    import fleet_collect","+","+    fleet_collect.register(app)"," ","     return app"]}]}]}
