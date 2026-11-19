// Goose-Port-Spiegel von: projects/ai-llm-projects-ai-productivity-dashboard/components/tasks/TaskCardUpcoming.tsx
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/ai-llm-projects-ai-productivity-dashboard/components/tasks/TaskCardUpcoming.tsx");
}

// ---- Original-Code (projects/ai-llm-projects-ai-productivity-dashboard/components/tasks/TaskCardUpcoming.tsx), unveraendert, als Inline-Doku ----
// 'use client'
//
// import type { Task } from '@/types'
// import { CalendarClock } from 'lucide-react'
// import { Badge } from '@/components/ui/badge'
// import { formatDistanceToNow } from 'date-fns'
//
// interface Props {
//   task: Task
// }
//
// export function TaskCardUpcoming({ task }: Props) {
//   const timeLeft = task.due_date
//     ? formatDistanceToNow(new Date(task.due_date), { addSuffix: true })
//     : null
//
//   return (
//     <div className="border border-border bg-muted/30 rounded-xl p-4 space-y-3 hover:border-border/80 transition-colors">
//       {/* Top row */}
//       <div className="flex items-start justify-between gap-3">
//         <Badge className="text-[11px] font-medium bg-muted text-muted-foreground border-0 px-2 py-0.5 rounded-full gap-1">
//           <CalendarClock className="w-3 h-3" />
//           Coming up
//         </Badge>
//         {timeLeft && (
//           <span className="text-xs text-muted-foreground shrink-0">{timeLeft}</span>
//         )}
//       </div>
//
//       {/* Title + description */}
//       <div>
//         <h3 className="font-semibold text-[15px] text-foreground">{task.title}</h3>
//         {task.description && (
//           <p className="text-sm text-muted-foreground mt-1 leading-relaxed">{task.description}</p>
//         )}
//       </div>
//     </div>
//   )
// }
//
