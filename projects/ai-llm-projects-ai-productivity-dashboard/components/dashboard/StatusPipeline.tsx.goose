// Goose-Port-Spiegel von: projects/ai-llm-projects-ai-productivity-dashboard/components/dashboard/StatusPipeline.tsx
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/ai-llm-projects-ai-productivity-dashboard/components/dashboard/StatusPipeline.tsx");
}

// ---- Original-Code (projects/ai-llm-projects-ai-productivity-dashboard/components/dashboard/StatusPipeline.tsx), unveraendert, als Inline-Doku ----
// 'use client'
//
// import type { StatusPipelineItem } from '@/types'
// import { ChevronRight, Loader2 } from 'lucide-react'
// import { cn } from '@/lib/utils'
// import { useDashboardData } from '@/hooks/useDashboardData'
//
// const statusConfig = {
//   in_progress: {
//     label: 'IN PROGRESS',
//     dot: 'bg-blue-500',
//     border: 'border-blue-500/30',
//     bg: 'bg-blue-500/5',
//     text: 'text-blue-500',
//   },
//   done: {
//     label: 'DONE',
//     dot: 'bg-green-500',
//     border: 'border-green-500/30',
//     bg: 'bg-green-500/5',
//     text: 'text-green-500',
//   },
//   upcoming: {
//     label: 'UPCOMING',
//     dot: 'bg-purple-500',
//     border: 'border-purple-500/30',
//     bg: 'bg-purple-500/5',
//     text: 'text-purple-500',
//   },
// }
//
// function StatusCard({ item }: { item: StatusPipelineItem }) {
//   const cfg = statusConfig[item.status]
//   return (
//     <div
//       className={cn(
//         'flex-1 min-w-[220px] max-w-xs border rounded-xl p-4 cursor-pointer hover:shadow-sm transition-all group',
//         cfg.border,
//         cfg.bg
//       )}
//     >
//       <div className="flex items-center justify-between mb-2.5">
//         <div className="flex items-center gap-2">
//           <span className={cn('w-2 h-2 rounded-full shrink-0', cfg.dot)} />
//           <span className={cn('text-[10px] font-bold tracking-wider uppercase', cfg.text)}>
//             {cfg.label}
//           </span>
//         </div>
//         <ChevronRight className="w-4 h-4 text-muted-foreground group-hover:text-foreground transition-colors" />
//       </div>
//       <h3 className="font-semibold text-sm text-foreground mb-1.5 leading-snug">{item.title}</h3>
//       <p className="text-[12px] text-muted-foreground leading-relaxed">{item.lastAction}</p>
//       {item.nextStep && (
//         <p className="text-[12px] text-muted-foreground/70 mt-1 italic">{item.nextStep}</p>
//       )}
//     </div>
//   )
// }
//
// export function StatusPipeline() {
//   const { pipeline, isLoading } = useDashboardData()
//
//   if (isLoading) {
//     return (
//       <div className="flex items-center justify-center py-8">
//         <Loader2 className="w-5 h-5 animate-spin text-muted-foreground" />
//       </div>
//     )
//   }
//
//   if (pipeline.length === 0) {
//     return null
//   }
//
//   return (
//     <div className="flex gap-3 overflow-x-auto pb-2 scrollbar-hide -mx-1 px-1">
//       {pipeline.map((item) => (
//         <StatusCard key={item.id} item={item} />
//       ))}
//     </div>
//   )
// }
//
