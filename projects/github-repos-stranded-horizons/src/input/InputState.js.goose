// Goose-Port-Spiegel von: projects/github-repos-stranded-horizons/src/input/InputState.js
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/github-repos-stranded-horizons/src/input/InputState.js");
}

// ---- Original-Code (projects/github-repos-stranded-horizons/src/input/InputState.js), unveraendert, als Inline-Doku ----
// // Normalized per-frame input snapshot. Simulation reads only this object.
// export function createInputState() {
//   return {
//     moveUp: false, moveDown: false, moveLeft: false, moveRight: false,
//     touchActive: false, touchX: 0, touchY: 0,
//     aimX: 0, aimY: 0,
//     shootHeld: false,
//     actions: [] // edge-triggered: 'dash' | 'reload' | 'switch' | 'pause' | 'shoot'
//   };
// }
//
// export function consumeActions(input) {
//   const a = input.actions;
//   input.actions = [];
//   return a;
// }
//
