// Goose-Port-Spiegel von: muse-code/local-share-muse/sessions/2026/10/23/01a1699b-382e-7593-9559-6538baf01e6f/tool-outputs/01a169a4-1aa7-7ad1-b476-d0d5e88f58f5/call_01a169a40e2674e4b0bf7d3130f9801e-tool_patch.json
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: muse-code/local-share-muse/sessions/2026/10/23/01a1699b-382e-7593-9559-6538baf01e6f/tool-outputs/01a169a4-1aa7-7ad1-b476-d0d5e88f58f5/call_01a169a40e2674e4b0bf7d3130f9801e-tool_patch.json");
}

// ---- Original-Code (muse-code/local-share-muse/sessions/2026/10/23/01a1699b-382e-7593-9559-6538baf01e6f/tool-outputs/01a169a4-1aa7-7ad1-b476-d0d5e88f58f5/call_01a169a40e2674e4b0bf7d3130f9801e-tool_patch.json), unveraendert, als Inline-Doku ----
// {"files":[{"path":"\\\\?\\C:\\Users\\danie\\OneDrive\\github-repos\\stranded-horizons\\src\\main.js","hunks":[{"oldStart":75,"oldLines":7,"newStart":75,"newLines":6,"lines":[" function updateCamera() {","   if (renderer.name === '25d') {","     camera.x = canvas.width / 2 - state.player.position.x;","-    camera.y = canvas.height / 2 - state.position?.y;","     camera.y = canvas.height / 2 - state.player.position.y;","   } else { camera.x = 0; camera.y = 0; }","   const wheel = updateCamera._zoom;"]}]}]}
