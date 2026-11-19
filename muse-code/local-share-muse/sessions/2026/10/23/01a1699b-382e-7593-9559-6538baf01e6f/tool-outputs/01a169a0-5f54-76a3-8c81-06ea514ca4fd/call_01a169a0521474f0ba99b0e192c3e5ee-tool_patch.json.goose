// Goose-Port-Spiegel von: muse-code/local-share-muse/sessions/2026/10/23/01a1699b-382e-7593-9559-6538baf01e6f/tool-outputs/01a169a0-5f54-76a3-8c81-06ea514ca4fd/call_01a169a0521474f0ba99b0e192c3e5ee-tool_patch.json
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: muse-code/local-share-muse/sessions/2026/10/23/01a1699b-382e-7593-9559-6538baf01e6f/tool-outputs/01a169a0-5f54-76a3-8c81-06ea514ca4fd/call_01a169a0521474f0ba99b0e192c3e5ee-tool_patch.json");
}

// ---- Original-Code (muse-code/local-share-muse/sessions/2026/10/23/01a1699b-382e-7593-9559-6538baf01e6f/tool-outputs/01a169a0-5f54-76a3-8c81-06ea514ca4fd/call_01a169a0521474f0ba99b0e192c3e5ee-tool_patch.json), unveraendert, als Inline-Doku ----
// {"files":[{"path":"\\\\?\\C:\\Users\\danie\\OneDrive\\github-repos\\stranded-horizons\\src\\core\\rng.js","hunks":[{"oldStart":1,"oldLines":0,"newStart":1,"newLines":14,"lines":["+// Seeded RNG (mulberry32). Pass an rng function into systems instead of Math.random.","+export function mulberry32(seed) {","+  let a = seed >>> 0;","+  return function () {","+    a |= 0; a = (a + 0x6D2B79F5) | 0;","+    let t = Math.imul(a ^ (a >>> 15), 1 | a);","+    t = (t + Math.imul(t ^ (t >>> 7), 61 | t)) ^ t;","+    return ((t ^ (t >>> 14)) >>> 0) / 4294967296;","+  };","+}","+","+export function randomId(rng, prefix = 'e') {","+  return `${prefix}_${Math.floor(rng() * 0xffffff).toString(16)}`;","+}"]}]}]}
