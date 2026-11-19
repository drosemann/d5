// Goose-Port-Spiegel von: projects/github-repos-infra-pilot/services/management-panel/src/i18n/rtl-support.tsx
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/github-repos-infra-pilot/services/management-panel/src/i18n/rtl-support.tsx");
}

// ---- Original-Code (projects/github-repos-infra-pilot/services/management-panel/src/i18n/rtl-support.tsx), unveraendert, als Inline-Doku ----
// import { useEffect, type ReactNode } from 'react';
// import { useI18n } from './index';
//
// export const RTLProvider = ({ children }: { children: ReactNode }) => {
//   const { direction } = useI18n();
//
//   useEffect(() => {
//     document.documentElement.dir = direction;
//     document.documentElement.setAttribute('data-direction', direction);
//   }, [direction]);
//
//   return <>{children}</>;
// };
//
