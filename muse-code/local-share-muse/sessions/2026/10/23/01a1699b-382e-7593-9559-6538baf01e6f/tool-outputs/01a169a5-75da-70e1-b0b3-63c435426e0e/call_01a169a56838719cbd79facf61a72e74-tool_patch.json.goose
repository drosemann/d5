// Goose-Port-Spiegel von: muse-code/local-share-muse/sessions/2026/10/23/01a1699b-382e-7593-9559-6538baf01e6f/tool-outputs/01a169a5-75da-70e1-b0b3-63c435426e0e/call_01a169a56838719cbd79facf61a72e74-tool_patch.json
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: muse-code/local-share-muse/sessions/2026/10/23/01a1699b-382e-7593-9559-6538baf01e6f/tool-outputs/01a169a5-75da-70e1-b0b3-63c435426e0e/call_01a169a56838719cbd79facf61a72e74-tool_patch.json");
}

// ---- Original-Code (muse-code/local-share-muse/sessions/2026/10/23/01a1699b-382e-7593-9559-6538baf01e6f/tool-outputs/01a169a5-75da-70e1-b0b3-63c435426e0e/call_01a169a56838719cbd79facf61a72e74-tool_patch.json), unveraendert, als Inline-Doku ----
// {"files":[{"path":"\\\\?\\C:\\Users\\danie\\OneDrive\\github-repos\\stranded-horizons\\src\\main.js","hunks":[{"oldStart":158,"oldLines":9,"newStart":158,"newLines":18,"lines":["     handleCollisions(state, ctx);","     applyDerivedStats(state); // legacy updateUI() recalculated derived stats every frame","     if (state.phase === 'gameover') return;","-  } else if (state.phase === 'waveComplete' && state.timeMs >= state.wave.prepEndAtMs) {","+  } else if (state.phase === 'waveComplete') {","     state.timeMs += dt * 1000;","-    beginNextWave(state, ctx);","+    for (const action of consumeActions(input)) {","+      if (action === 'pause') togglePause();","+    }","+    if (state.phase === 'waveComplete' && state.timeMs >= state.wave.prepEndAtMs) {","+      beginNextWave(state, ctx);","+    }","+  } else {","+    for (const action of consumeActions(input)) {","+      if (action === 'pause') togglePause();","+    }","   }","   updateCamera();","   hud.sync(state);"]}]}]}
