// Goose-Port-Spiegel von: projects/github-repos-ed-docs/web/src/lib/sound.ts
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/github-repos-ed-docs/web/src/lib/sound.ts");
}

// ---- Original-Code (projects/github-repos-ed-docs/web/src/lib/sound.ts), unveraendert, als Inline-Doku ----
// let ctx: AudioContext | null = null;
//
// function audio(): AudioContext | null {
//   try {
//     if (!ctx) ctx = new AudioContext();
//     if (ctx.state === 'suspended') void ctx.resume();
//     return ctx;
//   } catch {
//     return null;
//   }
// }
//
// export function kaChunk(): void {
//   const ac = audio();
//   if (!ac) return;
//   const t = ac.currentTime;
//   const osc = ac.createOscillator();
//   const gain = ac.createGain();
//   osc.type = 'square';
//   osc.frequency.setValueAtTime(180, t);
//   osc.frequency.exponentialRampToValueAtTime(60, t + 0.09);
//   gain.gain.setValueAtTime(0.12, t);
//   gain.gain.exponentialRampToValueAtTime(0.001, t + 0.12);
//   osc.connect(gain).connect(ac.destination);
//   osc.start(t);
//   osc.stop(t + 0.13);
// }
//
// export function softTick(): void {
//   const ac = audio();
//   if (!ac) return;
//   const t = ac.currentTime;
//   const osc = ac.createOscillator();
//   const gain = ac.createGain();
//   osc.type = 'sine';
//   osc.frequency.setValueAtTime(660, t);
//   gain.gain.setValueAtTime(0.05, t);
//   gain.gain.exponentialRampToValueAtTime(0.001, t + 0.05);
//   osc.connect(gain).connect(ac.destination);
//   osc.start(t);
//   osc.stop(t + 0.06);
// }
//
