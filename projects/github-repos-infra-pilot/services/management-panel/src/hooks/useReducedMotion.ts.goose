// Goose-Port-Spiegel von: projects/github-repos-infra-pilot/services/management-panel/src/hooks/useReducedMotion.ts
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/github-repos-infra-pilot/services/management-panel/src/hooks/useReducedMotion.ts");
}

// ---- Original-Code (projects/github-repos-infra-pilot/services/management-panel/src/hooks/useReducedMotion.ts), unveraendert, als Inline-Doku ----
// import { useState, useEffect } from 'react';
//
// export function useReducedMotion(): boolean {
//   const [prefersReduced, setPrefersReduced] = useState(() => {
//     try {
//       return window.matchMedia('(prefers-reduced-motion: reduce)').matches;
//     } catch {
//       return false;
//     }
//   });
//
//   useEffect(() => {
//     let mq: MediaQueryList;
//     try {
//       mq = window.matchMedia('(prefers-reduced-motion: reduce)');
//       const handler = (e: MediaQueryListEvent) => setPrefersReduced(e.matches);
//       mq.addEventListener('change', handler);
//       return () => mq.removeEventListener('change', handler);
//     } catch {}
//   }, []);
//
//   return prefersReduced;
// }
//
