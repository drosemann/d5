// Goose-Port-Spiegel von: projects/github-repos-stranded-horizons/src/core/EventBus.js
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/github-repos-stranded-horizons/src/core/EventBus.js");
}

// ---- Original-Code (projects/github-repos-stranded-horizons/src/core/EventBus.js), unveraendert, als Inline-Doku ----
// // Minimal event bus for side effects only (audio/UI). Core sim stays direct calls.
// export function createEventBus() {
//   const handlers = new Map();
//   return {
//     on(event, fn) {
//       if (!handlers.has(event)) handlers.set(event, new Set());
//       handlers.get(event).add(fn);
//       return () => handlers.get(event).delete(fn);
//     },
//     emit(event, payload) {
//       const set = handlers.get(event);
//       if (!set) return;
//       for (const fn of [...set]) { try { fn(payload); } catch { /* subscriber error isolated */ } }
//     }
//   };
// }
//
