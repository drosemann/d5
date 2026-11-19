// Goose-Port-Spiegel von: muse-code/local-share-muse/sessions/2026/10/23/01a1699b-382e-7593-9559-6538baf01e6f/tool-outputs/01a169a1-52aa-7bb1-ac3d-91133dd43897/call_01a169a145ea70259f7ff77560b836bb-tool_patch.json
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: muse-code/local-share-muse/sessions/2026/10/23/01a1699b-382e-7593-9559-6538baf01e6f/tool-outputs/01a169a1-52aa-7bb1-ac3d-91133dd43897/call_01a169a145ea70259f7ff77560b836bb-tool_patch.json");
}

// ---- Original-Code (muse-code/local-share-muse/sessions/2026/10/23/01a1699b-382e-7593-9559-6538baf01e6f/tool-outputs/01a169a1-52aa-7bb1-ac3d-91133dd43897/call_01a169a145ea70259f7ff77560b836bb-tool_patch.json), unveraendert, als Inline-Doku ----
// {"files":[{"path":"\\\\?\\C:\\Users\\danie\\OneDrive\\github-repos\\stranded-horizons\\src\\simulation\\ProjectileSystem.js","hunks":[{"oldStart":1,"oldLines":0,"newStart":1,"newLines":18,"lines":["+import { queryByKind, removeEntity } from '../core/EntityStore.js';","+","+function updateSet(state, dt, faction) {","+  for (const p of [...queryByKind(state.store, 'projectile')]) {","+    if (p.data.faction !== faction) continue;","+    p.position.x += p.data.dx * p.data.speed * dt;","+    p.position.y += p.data.dy * p.data.speed * dt;","+    p.data.life -= dt;","+    if (p.data.life <= 0 || p.position.x < -30 || p.position.y < -30 || p.position.x > state.world.width + 30 || p.position.y > state.world.height + 30) {","+      removeEntity(state.store, p);","+    }","+  }","+}","+","+export function updateProjectiles(state, dt) {","+  updateSet(state, dt, 'player');","+  updateSet(state, dt, 'enemy');","+}"]}]}]}
