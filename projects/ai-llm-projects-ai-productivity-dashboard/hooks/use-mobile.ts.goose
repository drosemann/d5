// Goose-Port-Spiegel von: projects/ai-llm-projects-ai-productivity-dashboard/hooks/use-mobile.ts
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/ai-llm-projects-ai-productivity-dashboard/hooks/use-mobile.ts");
}

// ---- Original-Code (projects/ai-llm-projects-ai-productivity-dashboard/hooks/use-mobile.ts), unveraendert, als Inline-Doku ----
// import * as React from 'react'
//
// const MOBILE_BREAKPOINT = 768
//
// export function useIsMobile() {
//   const [isMobile, setIsMobile] = React.useState<boolean | undefined>(undefined)
//
//   React.useEffect(() => {
//     const mql = window.matchMedia(`(max-width: ${MOBILE_BREAKPOINT - 1}px)`)
//     const onChange = () => {
//       setIsMobile(window.innerWidth < MOBILE_BREAKPOINT)
//     }
//     mql.addEventListener('change', onChange)
//     setIsMobile(window.innerWidth < MOBILE_BREAKPOINT)
//     return () => mql.removeEventListener('change', onChange)
//   }, [])
//
//   return !!isMobile
// }
//
