'use client'

import useSWR from 'swr'
import type {
  Task,
  BackgroundJob,
  AgendaItem,
  QuickWin,
  Project,
  Memory,
  DashboardMetrics,
  StatusPipelineItem,
} from '@/types'

interface DashboardData {
  tasks: Task[]
  backgroundJobs: BackgroundJob[]
  agendaItems: AgendaItem[]
  quickWins: QuickWin[]
  projects: Project[]
  memories: Memory[]
  metrics: DashboardMetrics
  pipeline: StatusPipelineItem[]
}

const fetcher = (url: string) => fetch(url).then((res) => res.json())

export function useDashboardData() {
  const { data, error, isLoading, mutate } = useSWR<DashboardData>(
    '/api/dashboard',
    fetcher,
    {
      refreshInterval: 30000, // Refresh every 30 seconds
      revalidateOnFocus: true,
      dedupingInterval: 5000,
    }
  )

  return {
    data,
    error,
    isLoading,
    mutate,
    // Convenience accessors
    tasks: data?.tasks ?? [],
    backgroundJobs: data?.backgroundJobs ?? [],
    agendaItems: data?.agendaItems ?? [],
    quickWins: data?.quickWins ?? [],
    projects: data?.projects ?? [],
    memories: data?.memories ?? [],
    metrics: data?.metrics ?? { tasksCompleted: 0, updates: 0, decisionsNeeded: 0 },
    pipeline: data?.pipeline ?? [],
  }
}
