// Goose-Port-Spiegel von: projects/github-repos-stranded-horizons/src/core/rng.js
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/github-repos-stranded-horizons/src/core/rng.js");
}

// ---- Original-Code (projects/github-repos-stranded-horizons/src/core/rng.js), unveraendert, als Inline-Doku ----
// // Seeded RNG (mulberry32). Pass an rng function into systems instead of Math.random.
// export function mulberry32(seed) {
//   let a = seed >>> 0;
//   return function () {
//     a |= 0; a = (a + 0x6D2B79F5) | 0;
//     let t = Math.imul(a ^ (a >>> 15), 1 | a);
//     t = (t + Math.imul(t ^ (t >>> 7), 61 | t)) ^ t;
//     return ((t ^ (t >>> 14)) >>> 0) / 4294967296;
//   };
// }
//
// export function randomId(rng, prefix = 'e') {
//   return `${prefix}_${Math.floor(rng() * 0xffffff).toString(16)}`;
// }
//
