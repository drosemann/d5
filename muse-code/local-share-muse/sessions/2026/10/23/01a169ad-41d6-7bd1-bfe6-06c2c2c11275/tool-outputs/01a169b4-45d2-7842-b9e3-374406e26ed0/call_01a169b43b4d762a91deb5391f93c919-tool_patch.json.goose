// Goose-Port-Spiegel von: muse-code/local-share-muse/sessions/2026/10/23/01a169ad-41d6-7bd1-bfe6-06c2c2c11275/tool-outputs/01a169b4-45d2-7842-b9e3-374406e26ed0/call_01a169b43b4d762a91deb5391f93c919-tool_patch.json
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: muse-code/local-share-muse/sessions/2026/10/23/01a169ad-41d6-7bd1-bfe6-06c2c2c11275/tool-outputs/01a169b4-45d2-7842-b9e3-374406e26ed0/call_01a169b43b4d762a91deb5391f93c919-tool_patch.json");
}

// ---- Original-Code (muse-code/local-share-muse/sessions/2026/10/23/01a169ad-41d6-7bd1-bfe6-06c2c2c11275/tool-outputs/01a169b4-45d2-7842-b9e3-374406e26ed0/call_01a169b43b4d762a91deb5391f93c919-tool_patch.json), unveraendert, als Inline-Doku ----
// {"files":[{"path":"\\\\?\\C:\\Users\\danie\\OneDrive\\github-repos\\ed-docs\\web\\src\\lib\\golf.ts","hunks":[{"oldStart":1,"oldLines":0,"newStart":1,"newLines":13,"lines":["+export function golfScore(chars: number, keys: number, commands: number): number {","+  if (keys === 0) return 0;","+  const efficiency = chars / Math.max(1, keys);","+  const bonus = Math.min(20, commands * 2);","+  return Math.max(0, Math.min(100, Math.round(efficiency * 100 + bonus)));","+}","+","+export function golfVerdict(score: number): string {","+  if (score >= 85) return 'surgical. the clerk nods.';","+  if (score >= 65) return 'respectable. fewer hjkl next time.';","+  if (score >= 40) return 'clumsy. the arrow keys saw everything.';","+  return 'mashy. were you paddling upstream?';","+}"]}]}]}
