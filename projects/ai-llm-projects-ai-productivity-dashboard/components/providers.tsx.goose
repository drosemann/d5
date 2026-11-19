// Goose-Port-Spiegel von: projects/ai-llm-projects-ai-productivity-dashboard/components/providers.tsx
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/ai-llm-projects-ai-productivity-dashboard/components/providers.tsx");
}

// ---- Original-Code (projects/ai-llm-projects-ai-productivity-dashboard/components/providers.tsx), unveraendert, als Inline-Doku ----
// 'use client'
//
// import { QueryClient, QueryClientProvider } from '@tanstack/react-query'
// import { useState } from 'react'
//
// export function Providers({ children }: { children: React.ReactNode }) {
//   const [queryClient] = useState(
//     () =>
//       new QueryClient({
//         defaultOptions: {
//           queries: {
//             staleTime: 30_000,
//             refetchOnWindowFocus: false,
//           },
//         },
//       })
//   )
//
//   return (
//     <QueryClientProvider client={queryClient}>
//       {children}
//     </QueryClientProvider>
//   )
// }
//
