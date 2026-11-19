// Goose-Port-Spiegel von: muse-code/local-share-muse/sessions/2026/10/23/01a1699b-382e-7593-9559-6538baf01e6f/tool-outputs/01a169a6-2fd1-70f0-8fdd-4b61c7b06ddb/call_01a169a623937161aa47047f3c887a6c-tool_patch.json
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: muse-code/local-share-muse/sessions/2026/10/23/01a1699b-382e-7593-9559-6538baf01e6f/tool-outputs/01a169a6-2fd1-70f0-8fdd-4b61c7b06ddb/call_01a169a623937161aa47047f3c887a6c-tool_patch.json");
}

// ---- Original-Code (muse-code/local-share-muse/sessions/2026/10/23/01a1699b-382e-7593-9559-6538baf01e6f/tool-outputs/01a169a6-2fd1-70f0-8fdd-4b61c7b06ddb/call_01a169a623937161aa47047f3c887a6c-tool_patch.json), unveraendert, als Inline-Doku ----
// {"files":[{"path":"\\\\?\\C:\\Users\\danie\\OneDrive\\github-repos\\stranded-horizons\\src\\main.js","hunks":[{"oldStart":137,"oldLines":7,"newStart":137,"newLines":7,"lines":["   if (state.phase === 'playing') {","     state.timeMs += dt * 1000;","     finishReloadIfNeeded(state, ctx);","-    handleMovement(state, input, dt, ctx);","+    handleMovement(state, input, dt);","     if (input.shootHeld) {","       const w = screenToWorld(camera, input.aimX, input.aimY);","       tryShoot(state, w, ctx);"]}]}]}
