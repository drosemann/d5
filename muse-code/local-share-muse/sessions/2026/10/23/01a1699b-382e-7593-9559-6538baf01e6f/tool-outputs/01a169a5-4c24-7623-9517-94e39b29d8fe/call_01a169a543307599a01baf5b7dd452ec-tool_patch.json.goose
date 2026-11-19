// Goose-Port-Spiegel von: muse-code/local-share-muse/sessions/2026/10/23/01a1699b-382e-7593-9559-6538baf01e6f/tool-outputs/01a169a5-4c24-7623-9517-94e39b29d8fe/call_01a169a543307599a01baf5b7dd452ec-tool_patch.json
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: muse-code/local-share-muse/sessions/2026/10/23/01a1699b-382e-7593-9559-6538baf01e6f/tool-outputs/01a169a5-4c24-7623-9517-94e39b29d8fe/call_01a169a543307599a01baf5b7dd452ec-tool_patch.json");
}

// ---- Original-Code (muse-code/local-share-muse/sessions/2026/10/23/01a1699b-382e-7593-9559-6538baf01e6f/tool-outputs/01a169a5-4c24-7623-9517-94e39b29d8fe/call_01a169a543307599a01baf5b7dd452ec-tool_patch.json), unveraendert, als Inline-Doku ----
// {"files":[{"path":"\\\\?\\C:\\Users\\danie\\OneDrive\\github-repos\\stranded-horizons\\src\\main.js","hunks":[{"oldStart":3,"oldLines":7,"newStart":3,"newLines":7,"lines":[" import { createGameLoop } from './core/GameLoop.js';"," import { mulberry32 } from './core/rng.js';"," import { loadMetaProgress, loadBestRun, saveMeta, saveBestRun } from './persistence/MetaStore.js';","-import { handleMovement, tryDash, applyDerivedStats, damagePlayer } from './simulation/PlayerSystem.js';","+import { handleMovement, tryDash, applyDerivedStats } from './simulation/PlayerSystem.js';"," import { tryShoot, switchWeapon, startReload, finishReloadIfNeeded } from './simulation/WeaponSystem.js';"," import { updateEnemies } from './simulation/EnemySystem.js';"," import { updateProjectiles } from './simulation/ProjectileSystem.js';"]}]}]}
