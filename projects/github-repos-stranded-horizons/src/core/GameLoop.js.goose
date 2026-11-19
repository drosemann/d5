// Goose-Port-Spiegel von: projects/github-repos-stranded-horizons/src/core/GameLoop.js
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/github-repos-stranded-horizons/src/core/GameLoop.js");
}

// ---- Original-Code (projects/github-repos-stranded-horizons/src/core/GameLoop.js), unveraendert, als Inline-Doku ----
// // Fixed-shape frame loop: update(dt) then render(). dt clamped to 0.05s like legacy.
// export function createGameLoop({ update, render }) {
//   let lastTs = -1;
//   let running = true;
//   function frame(ts) {
//     if (!running) return;
//     if (lastTs < 0) lastTs = ts;
//     const dt = Math.min(0.05, (ts - lastTs) / 1000);
//     lastTs = ts;
//     update(dt, ts);
//     render(dt);
//     requestAnimationFrame(frame);
//   }
//   return {
//     start() { running = true; requestAnimationFrame(frame); },
//     stop() { running = false; }
//   };
// }
//
