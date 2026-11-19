'use client'

import { TaskCardNeedsInput } from './TaskCardNeedsInput'
import { TaskCardBackground } from './TaskCardBackground'
import { TaskCardUpcoming } from './TaskCardUpcoming'
import { Sparkles, ChevronRight, Loader2 } from 'lucide-react'
import { useState } from 'react'
import { useDashboardData } from '@/hooks/useDashboardData'

export function TaskFeed() {
  const { tasks, backgroundJobs, isLoading } = useDashboardData()
  const [approvedIds, setApprovedIds] = useState<string[]>([])
  const [deferredIds, setDeferredIds] = useState<string[]>([])

  const needsInputTasks = tasks.filter(
    (t) => t.status === 'needs_input' && !approvedIds.includes(t.id) && !deferredIds.includes(t.id)
  )
  const upcomingTasks = tasks.filter((t) => t.status === 'upcoming')

  if (isLoading) {
    return (
      <div className="flex items-center justify-center py-10">
        <Loader2 className="w-6 h-6 animate-spin text-muted-foreground" />
      </div>
    )
  }

  return (
    <div className="space-y-3">
      {/* Section header */}
      <div className="flex items-center justify-between">
        <div className="flex items-center gap-2">
          <h2 className="text-sm font-semibold text-foreground">Your day, handled</h2>
          <span className="text-xs px-2 py-0.5 rounded-full bg-primary/10 text-primary font-medium">
            Proactive plan
          </span>
          <span className="text-xs text-muted-foreground hidden sm:block">
            {"I'll keep working and let you know when something needs you."}
          </span>
        </div>
        <button className="text-xs text-muted-foreground hover:text-foreground flex items-center gap-1 transition-colors">
          View timeline
          <ChevronRight className="w-3 h-3" />
        </button>
      </div>

      {/* Cards */}
      {needsInputTasks.map((task) => (
        <TaskCardNeedsInput
          key={task.id}
          task={task}
          onApprove={(id) => setApprovedIds((prev) => [...prev, id])}
          onDefer={(id) => setDeferredIds((prev) => [...prev, id])}
        />
      ))}

      {backgroundJobs.map((job) => (
        <TaskCardBackground key={job.id} job={job} />
      ))}

      {upcomingTasks.map((task) => (
        <TaskCardUpcoming key={task.id} task={task} />
      ))}

      {/* All handled empty state */}
      {needsInputTasks.length === 0 && backgroundJobs.length === 0 && upcomingTasks.length === 0 && (
        <div className="flex flex-col items-center gap-2 py-10 text-center">
          <Sparkles className="w-8 h-8 text-primary" />
          <p className="text-sm font-medium text-foreground">{"You're all caught up!"}</p>
          <p className="text-xs text-muted-foreground">{"I'll surface new tasks as they come in."}</p>
        </div>
      )}
    </div>
  )
}
