// Goose-Port-Spiegel von: projects/github-repos-ed-docs/web/src/lib/golf.ts
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/github-repos-ed-docs/web/src/lib/golf.ts");
}

// ---- Original-Code (projects/github-repos-ed-docs/web/src/lib/golf.ts), unveraendert, als Inline-Doku ----
// export function golfScore(chars: number, keys: number, commands: number): number {
//   if (keys === 0) return 0;
//   const efficiency = chars / Math.max(1, keys);
//   const bonus = Math.min(20, commands * 2);
//   return Math.max(0, Math.min(100, Math.round(efficiency * 100 + bonus)));
// }
//
// export function golfVerdict(score: number): string {
//   if (score >= 85) return 'surgical. the clerk nods.';
//   if (score >= 65) return 'respectable. fewer hjkl next time.';
//   if (score >= 40) return 'clumsy. the arrow keys saw everything.';
//   return 'mashy. were you paddling upstream?';
// }
//
