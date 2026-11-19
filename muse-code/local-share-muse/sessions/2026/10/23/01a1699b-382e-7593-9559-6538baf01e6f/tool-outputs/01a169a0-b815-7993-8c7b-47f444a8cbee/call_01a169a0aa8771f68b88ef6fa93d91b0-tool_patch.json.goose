// Goose-Port-Spiegel von: muse-code/local-share-muse/sessions/2026/10/23/01a1699b-382e-7593-9559-6538baf01e6f/tool-outputs/01a169a0-b815-7993-8c7b-47f444a8cbee/call_01a169a0aa8771f68b88ef6fa93d91b0-tool_patch.json
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: muse-code/local-share-muse/sessions/2026/10/23/01a1699b-382e-7593-9559-6538baf01e6f/tool-outputs/01a169a0-b815-7993-8c7b-47f444a8cbee/call_01a169a0aa8771f68b88ef6fa93d91b0-tool_patch.json");
}

// ---- Original-Code (muse-code/local-share-muse/sessions/2026/10/23/01a1699b-382e-7593-9559-6538baf01e6f/tool-outputs/01a169a0-b815-7993-8c7b-47f444a8cbee/call_01a169a0aa8771f68b88ef6fa93d91b0-tool_patch.json), unveraendert, als Inline-Doku ----
// {"files":[{"path":"\\\\?\\C:\\Users\\danie\\OneDrive\\github-repos\\stranded-horizons\\src\\core\\GameLoop.js","hunks":[{"oldStart":1,"oldLines":0,"newStart":1,"newLines":18,"lines":["+// Fixed-shape frame loop: update(dt) then render(). dt clamped to 0.05s like legacy.","+export function createGameLoop({ update, render }) {","+  let lastTs = -1;","+  let running = true;","+  function frame(ts) {","+    if (!running) return;","+    if (lastTs < 0) lastTs = ts;","+    const dt = Math.min(0.05, (ts - lastTs) / 1000);","+    lastTs = ts;","+    update(dt, ts);","+    render(dt);","+    requestAnimationFrame(frame);","+  }","+  return {","+    start() { running = true; requestAnimationFrame(frame); },","+    stop() { running = false; }","+  };","+}"]}]}]}
