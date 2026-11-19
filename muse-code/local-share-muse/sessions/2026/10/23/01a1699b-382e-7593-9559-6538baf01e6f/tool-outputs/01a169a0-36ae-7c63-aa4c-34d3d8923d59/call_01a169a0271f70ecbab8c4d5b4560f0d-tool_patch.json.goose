// Goose-Port-Spiegel von: muse-code/local-share-muse/sessions/2026/10/23/01a1699b-382e-7593-9559-6538baf01e6f/tool-outputs/01a169a0-36ae-7c63-aa4c-34d3d8923d59/call_01a169a0271f70ecbab8c4d5b4560f0d-tool_patch.json
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: muse-code/local-share-muse/sessions/2026/10/23/01a1699b-382e-7593-9559-6538baf01e6f/tool-outputs/01a169a0-36ae-7c63-aa4c-34d3d8923d59/call_01a169a0271f70ecbab8c4d5b4560f0d-tool_patch.json");
}

// ---- Original-Code (muse-code/local-share-muse/sessions/2026/10/23/01a1699b-382e-7593-9559-6538baf01e6f/tool-outputs/01a169a0-36ae-7c63-aa4c-34d3d8923d59/call_01a169a0271f70ecbab8c4d5b4560f0d-tool_patch.json), unveraendert, als Inline-Doku ----
// {"files":[{"path":"\\\\?\\C:\\Users\\danie\\OneDrive\\github-repos\\stranded-horizons\\src\\data\\config.js","hunks":[{"oldStart":1,"oldLines":0,"newStart":1,"newLines":11,"lines":["+import { WEAPONS } from './weapons.js';","+import { ENEMY_TYPES } from './enemies.js';","+","+export const GAME_CONFIG = {","+  player: { width: 46, height: 46, baseSpeed: 280, baseHealth: 180, maxStamina: 100, staminaRegen: 20, dashCost: 35, dashCooldown: 650, dashMultiplier: 3, invulnerabilityMs: 300 },","+  weapons: WEAPONS,","+  enemyTypes: ENEMY_TYPES,","+  wave: { preparationDuration: 8000, baseCount: 8, growthPerWave: 4, baseSpawnInterval: 1200, minSpawnInterval: 350 },","+  drops: { baseChance: 0.24, durationMs: 7000, coinBurst: 14 },","+  visuals: { hitFlashMs: 120, deathFadeMs: 1400, screenShakeDecay: 0.84 }","+};"]}]}]}
