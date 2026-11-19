// Goose-Port-Spiegel von: projects/github-repos-infra-pilot/services/management-panel/src/components/accessibility/FocusTrap.tsx
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/github-repos-infra-pilot/services/management-panel/src/components/accessibility/FocusTrap.tsx");
}

// ---- Original-Code (projects/github-repos-infra-pilot/services/management-panel/src/components/accessibility/FocusTrap.tsx), unveraendert, als Inline-Doku ----
// import { useEffect, useRef, type ReactNode } from 'react';
//
// interface FocusTrapProps {
//   active: boolean;
//   children: ReactNode;
// }
//
// export const FocusTrap = ({ active, children }: FocusTrapProps) => {
//   const containerRef = useRef<HTMLDivElement>(null);
//
//   useEffect(() => {
//     if (!active || !containerRef.current) return;
//
//     const container = containerRef.current;
//     const focusableSelector =
//       'a[href], button:not([disabled]), textarea:not([disabled]), input:not([disabled]), select:not([disabled]), [tabindex]:not([tabindex="-1"])';
//
//     const getFocusableElements = () =>
//       Array.from(container.querySelectorAll<HTMLElement>(focusableSelector));
//
//     const handleKeyDown = (e: KeyboardEvent) => {
//       if (e.key !== 'Tab') return;
//       const focusable = getFocusableElements();
//       if (focusable.length === 0) return;
//
//       const first = focusable[0];
//       const last = focusable[focusable.length - 1];
//
//       if (e.shiftKey) {
//         if (document.activeElement === first) {
//           e.preventDefault();
//           last.focus();
//         }
//       } else {
//         if (document.activeElement === last) {
//           e.preventDefault();
//           first.focus();
//         }
//       }
//     };
//
//     document.addEventListener('keydown', handleKeyDown);
//     focusable[0]?.focus();
//
//     return () => document.removeEventListener('keydown', handleKeyDown);
//   }, [active]);
//
//   return <div ref={containerRef}>{children}</div>;
// };
//
// const focusable: HTMLElement[] = [];
//
