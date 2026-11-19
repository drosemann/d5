'use client'

import type { Task } from '@/types'
import { FileText, AlertCircle } from 'lucide-react'
import { Button } from '@/components/ui/button'
import { Badge } from '@/components/ui/badge'
import { formatDistanceToNow } from 'date-fns'

interface Props {
  task: Task
  onApprove?: (id: string) => void
  onDefer?: (id: string) => void
}

export function TaskCardNeedsInput({ task, onApprove, onDefer }: Props) {
  const timeLeft = task.due_date
    ? formatDistanceToNow(new Date(task.due_date), { addSuffix: false })
    : null

  const filename = task.metadata?.attachment as string | undefined

  return (
    <div className="border border-amber-500/30 bg-amber-500/5 rounded-xl p-4 space-y-3 hover:border-amber-500/50 transition-colors">
      {/* Top row */}
      <div className="flex items-start justify-between gap-3">
        <div className="flex items-center gap-2">
          <Badge className="text-[11px] font-medium bg-amber-500/20 text-amber-600 dark:text-amber-400 border-0 px-2 py-0.5 rounded-full">
            <AlertCircle className="w-3 h-3 mr-1" />
            Needs your input
          </Badge>
        </div>
        {timeLeft && (
          <span className="text-xs text-muted-foreground shrink-0">By {timeLeft}</span>
        )}
      </div>

      {/* Title */}
      <div>
        <h3 className="font-semibold text-[15px] text-foreground">{task.title}</h3>
        {task.ai_rationale && (
          <p className="text-sm text-muted-foreground mt-1 leading-relaxed">{task.ai_rationale}</p>
        )}
      </div>

      {/* Attachment */}
      {filename && (
        <div className="flex items-center gap-2 p-2.5 bg-background border border-border rounded-lg w-fit">
          <div className="w-8 h-8 rounded-md bg-red-500/10 flex items-center justify-center">
            <FileText className="w-4 h-4 text-red-500" />
          </div>
          <span className="text-xs font-medium text-foreground">{filename}</span>
        </div>
      )}

      {/* Actions */}
      <div className="flex items-center gap-2 pt-1">
        <Button
          size="sm"
          className="h-8 text-sm px-4 bg-foreground text-background hover:bg-foreground/90"
          onClick={() => onApprove?.(task.id)}
        >
          Review
        </Button>
        <Button
          variant="ghost"
          size="sm"
          className="h-8 text-sm px-4 text-muted-foreground hover:text-foreground"
          onClick={() => onDefer?.(task.id)}
        >
          Not now
        </Button>
      </div>
    </div>
  )
}
