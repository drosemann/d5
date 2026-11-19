// Goose-Port-Spiegel von: muse-code/local-share-muse/sessions/2026/10/23/01a1699b-382e-7593-9559-6538baf01e6f/tool-outputs/01a169a2-418a-7503-b595-8d52815482ae/call_01a169a2350470618860882abfee4a94-tool_patch.json
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: muse-code/local-share-muse/sessions/2026/10/23/01a1699b-382e-7593-9559-6538baf01e6f/tool-outputs/01a169a2-418a-7503-b595-8d52815482ae/call_01a169a2350470618860882abfee4a94-tool_patch.json");
}

// ---- Original-Code (muse-code/local-share-muse/sessions/2026/10/23/01a1699b-382e-7593-9559-6538baf01e6f/tool-outputs/01a169a2-418a-7503-b595-8d52815482ae/call_01a169a2350470618860882abfee4a94-tool_patch.json), unveraendert, als Inline-Doku ----
// {"files":[{"path":"\\\\?\\C:\\Users\\danie\\OneDrive\\github-repos\\stranded-horizons\\src\\input\\InputState.js","hunks":[{"oldStart":1,"oldLines":0,"newStart":1,"newLines":16,"lines":["+// Normalized per-frame input snapshot. Simulation reads only this object.","+export function createInputState() {","+  return {","+    moveUp: false, moveDown: false, moveLeft: false, moveRight: false,","+    touchActive: false, touchX: 0, touchY: 0,","+    aimX: 0, aimY: 0,","+    shootHeld: false,","+    actions: [] // edge-triggered: 'dash' | 'reload' | 'switch' | 'pause' | 'shoot'","+  };","+}","+","+export function consumeActions(input) {","+  const a = input.actions;","+  input.actions = [];","+  return a;","+}"]}]}]}
