// Goose-Port-Spiegel von: projects/ai-llm-projects-ai-productivity-dashboard/components/dashboard/ProactiveHero.tsx
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/ai-llm-projects-ai-productivity-dashboard/components/dashboard/ProactiveHero.tsx");
}

// ---- Original-Code (projects/ai-llm-projects-ai-productivity-dashboard/components/dashboard/ProactiveHero.tsx), unveraendert, als Inline-Doku ----
// 'use client'
//
// import { ChevronRight } from 'lucide-react'
// import { Button } from '@/components/ui/button'
// import { format } from 'date-fns'
// import { useDashboardData } from '@/hooks/useDashboardData'
//
// export function ProactiveHero() {
//   const { metrics } = useDashboardData()
//   const hour = new Date().getHours()
//   const greeting =
//     hour < 12 ? 'Good morning' : hour < 18 ? 'Good afternoon' : 'Good evening'
//
//   const { tasksCompleted, updates, decisionsNeeded } = metrics
//
//   return (
//     <div className="pb-4">
//       <p className="text-sm text-muted-foreground mb-1">{format(new Date(), 'EEEE, MMMM d')}</p>
//       <div className="flex items-start justify-between gap-4">
//         <div>
//           <p className="text-lg text-foreground/80">{greeting}, Aria.</p>
//           <h1 className="text-3xl font-bold text-foreground text-balance leading-tight">
//             {"I've got things moving."}
//           </h1>
//           <div className="flex items-center gap-2 mt-2 flex-wrap">
//             <span className="text-sm text-muted-foreground">
//               <span className="text-foreground font-medium">{tasksCompleted}</span> tasks completed
//             </span>
//             <span className="text-muted-foreground">·</span>
//             <span className="text-sm text-muted-foreground">
//               <span className="text-foreground font-medium">{updates}</span> updates
//             </span>
//             <span className="text-muted-foreground">·</span>
//             <span className="text-sm text-muted-foreground">
//               <span className="text-amber-500 font-medium">{decisionsNeeded}</span> decision needed
//             </span>
//           </div>
//         </div>
//         <Button
//           variant="ghost"
//           size="sm"
//           className="text-muted-foreground hover:text-foreground gap-1 shrink-0 hidden sm:flex"
//         >
//           See full plan
//           <ChevronRight className="w-4 h-4" />
//         </Button>
//       </div>
//     </div>
//   )
// }
//
