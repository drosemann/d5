'use client'

import type { BackgroundJob } from '@/types'
import { Loader2 } from 'lucide-react'
import { Button } from '@/components/ui/button'
import { Badge } from '@/components/ui/badge'
import { formatDistanceToNow } from 'date-fns'
import { Progress } from '@/components/ui/progress'

interface Props {
  job: BackgroundJob
}

export function TaskCardBackground({ job }: Props) {
  const nextUpdate = job.next_update_at
    ? formatDistanceToNow(new Date(job.next_update_at), { addSuffix: true })
    : null

  return (
    <div className="border border-blue-500/30 bg-blue-500/5 rounded-xl p-4 space-y-3 hover:border-blue-500/50 transition-colors">
      {/* Top row */}
      <div className="flex items-start justify-between gap-3">
        <Badge className="text-[11px] font-medium bg-blue-500/20 text-blue-600 dark:text-blue-400 border-0 px-2 py-0.5 rounded-full gap-1">
          <Loader2 className="w-3 h-3 animate-spin" />
          Running in background
        </Badge>
        {nextUpdate && (
          <span className="text-xs text-muted-foreground shrink-0">Next update {nextUpdate}</span>
        )}
      </div>

      {/* Title */}
      <div>
        <h3 className="font-semibold text-[15px] text-foreground">{job.title}</h3>
        <p className="text-sm text-muted-foreground mt-1">
          Scanning {job.sources_count}+ sources · {job.progress_percent}% complete
        </p>
      </div>

      {/* Progress bar */}
      <Progress value={job.progress_percent} className="h-1.5 bg-blue-500/20 [&>div]:bg-blue-500" />

      {/* Action */}
      <div className="pt-1">
        <Button
          variant="outline"
          size="sm"
          className="h-8 text-sm border-blue-500/30 text-foreground hover:bg-blue-500/10"
        >
          View progress
        </Button>
      </div>
    </div>
  )
}
