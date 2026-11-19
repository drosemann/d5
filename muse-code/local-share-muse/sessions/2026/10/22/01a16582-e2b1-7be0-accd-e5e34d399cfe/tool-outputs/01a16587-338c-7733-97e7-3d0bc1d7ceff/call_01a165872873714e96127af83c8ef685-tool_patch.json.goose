// Goose-Port-Spiegel von: muse-code/local-share-muse/sessions/2026/10/22/01a16582-e2b1-7be0-accd-e5e34d399cfe/tool-outputs/01a16587-338c-7733-97e7-3d0bc1d7ceff/call_01a165872873714e96127af83c8ef685-tool_patch.json
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: muse-code/local-share-muse/sessions/2026/10/22/01a16582-e2b1-7be0-accd-e5e34d399cfe/tool-outputs/01a16587-338c-7733-97e7-3d0bc1d7ceff/call_01a165872873714e96127af83c8ef685-tool_patch.json");
}

// ---- Original-Code (muse-code/local-share-muse/sessions/2026/10/22/01a16582-e2b1-7be0-accd-e5e34d399cfe/tool-outputs/01a16587-338c-7733-97e7-3d0bc1d7ceff/call_01a165872873714e96127af83c8ef685-tool_patch.json), unveraendert, als Inline-Doku ----
// {"files":[{"path":"\\\\?\\C:\\Users\\danie\\OneDrive\\github-repos\\infra-pilot\\services\\orchestrator-agent\\webhook_server.py","hunks":[{"oldStart":937,"oldLines":6,"newStart":937,"newLines":12,"lines":["     async def gitops_webhook(request: web.Request) -> web.Response:","         return await verify_gitops_token(request, deployment_apply)"," ","-    app.router.add_post(\"/webhook/gitops\", gitops_webhook)","+    app.router.add_post(\"/webhook/gitops\", gitops_webhook)","+    # Living Fleet (barecode): read-only creature views + rename-only mutation.","+    # Gated by LIVING_FLEET_ENABLED; handlers return 404 while disabled.","+    import living_fleet","+    app.router.add_get(\"/api/v1/fleet/creatures\", living_fleet.fleet_list)","+    app.router.add_get(\"/api/v1/fleet/creatures/{workload_id}\", living_fleet.fleet_detail)","+    app.router.add_post(\"/api/v1/fleet/creatures/{workload_id}/rename\", living_fleet.fleet_rename)"," ","     return app"]}]}]}
