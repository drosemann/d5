import { NextResponse } from 'next/server'
import {
  getTasks,
  getBackgroundJobs,
  getAgendaItems,
  getQuickWins,
  getProjects,
  getMemories,
  getDashboardMetrics,
  getStatusPipeline,
} from '@/lib/data'

export async function GET() {
  try {
    const [
      tasks,
      backgroundJobs,
      agendaItems,
      quickWins,
      projects,
      memories,
      metrics,
      pipeline,
    ] = await Promise.all([
      getTasks(),
      getBackgroundJobs(),
      getAgendaItems(),
      getQuickWins(),
      getProjects(),
      getMemories(),
      getDashboardMetrics(),
      getStatusPipeline(),
    ])

    return NextResponse.json({
      tasks,
      backgroundJobs,
      agendaItems,
      quickWins,
      projects,
      memories,
      metrics,
      pipeline,
    })
  } catch (error) {
    console.error('[v0] Dashboard data fetch error:', error)
    return NextResponse.json(
      { error: 'Failed to fetch dashboard data' },
      { status: 500 }
    )
  }
}
