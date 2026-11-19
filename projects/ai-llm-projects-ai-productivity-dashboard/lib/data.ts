import { createServerClient, getServerUser } from './supabaseServer'
import { supabase } from './supabaseClient'
import type {
  Task,
  BackgroundJob,
  AgendaItem,
  QuickWin,
  Project,
  Memory,
  Conversation,
  Message,
  DashboardMetrics,
  StatusPipelineItem,
} from '@/types'
import {
  mockTasks,
  mockBackgroundJobs,
  mockAgendaItems,
  mockQuickWins,
  mockProjects,
  mockMemories,
  mockMetrics,
  mockPipelineItems,
} from './mockData'
import { isDemoUser } from './demoAuth'

// Helper to check if we should use mock data
function shouldUseMockData(userId: string | undefined): boolean {
  return !userId || isDemoUser(userId)
}

// ============ SERVER-SIDE DATA FETCHING ============

export async function getProjects(): Promise<Project[]> {
  const user = await getServerUser()
  if (shouldUseMockData(user?.id)) return mockProjects

  const client = await createServerClient()
  const { data, error } = await client
    .from('projects')
    .select('*')
    .eq('user_id', user!.id)
    .eq('status', 'active')
    .order('created_at', { ascending: false })

  if (error) {
    console.error('[v0] Error fetching projects:', error)
    return []
  }
  return data ?? []
}

export async function getTasks(): Promise<Task[]> {
  const user = await getServerUser()
  if (shouldUseMockData(user?.id)) return mockTasks

  const client = await createServerClient()
  const { data, error } = await client
    .from('tasks')
    .select('*')
    .eq('user_id', user!.id)
    .in('status', ['needs_input', 'in_progress', 'upcoming'])
    .order('due_date', { ascending: true, nullsFirst: false })
    .limit(20)

  if (error) {
    console.error('[v0] Error fetching tasks:', error)
    return []
  }
  return data ?? []
}

export async function getBackgroundJobs(): Promise<BackgroundJob[]> {
  const user = await getServerUser()
  if (shouldUseMockData(user?.id)) return mockBackgroundJobs

  const client = await createServerClient()
  const { data, error } = await client
    .from('background_jobs')
    .select('*')
    .eq('user_id', user!.id)
    .eq('status', 'running')
    .order('created_at', { ascending: false })
    .limit(5)

  if (error) {
    console.error('[v0] Error fetching background jobs:', error)
    return []
  }
  return data ?? []
}

export async function getAgendaItems(): Promise<AgendaItem[]> {
  const user = await getServerUser()
  if (shouldUseMockData(user?.id)) return mockAgendaItems

  const client = await createServerClient()
  const today = new Date()
  today.setHours(0, 0, 0, 0)
  const tomorrow = new Date(today)
  tomorrow.setDate(tomorrow.getDate() + 1)

  const { data, error } = await client
    .from('agenda_items')
    .select('*')
    .eq('user_id', user!.id)
    .gte('start_time', today.toISOString())
    .lt('start_time', tomorrow.toISOString())
    .order('start_time', { ascending: true })

  if (error) {
    console.error('[v0] Error fetching agenda items:', error)
    return []
  }
  return data ?? []
}

export async function getQuickWins(): Promise<QuickWin[]> {
  const user = await getServerUser()
  if (shouldUseMockData(user?.id)) return mockQuickWins

  const client = await createServerClient()
  const { data, error } = await client
    .from('quick_wins')
    .select('*')
    .eq('user_id', user!.id)
    .order('completed_at', { ascending: false })
    .limit(5)

  if (error) {
    console.error('[v0] Error fetching quick wins:', error)
    return []
  }
  return data ?? []
}

export async function getMemories(): Promise<Memory[]> {
  const user = await getServerUser()
  if (shouldUseMockData(user?.id)) return mockMemories

  const client = await createServerClient()
  const { data, error } = await client
    .from('memories')
    .select('*')
    .eq('user_id', user!.id)
    .order('updated_at', { ascending: false })
    .limit(20)

  if (error) {
    console.error('[v0] Error fetching memories:', error)
    return []
  }
  return data ?? []
}

export async function getDashboardMetrics(): Promise<DashboardMetrics> {
  const user = await getServerUser()
  if (shouldUseMockData(user?.id)) return mockMetrics

  const client = await createServerClient()

  // Count tasks completed today
  const today = new Date()
  today.setHours(0, 0, 0, 0)

  const [completedRes, needsInputRes, jobsRes] = await Promise.all([
    client
      .from('tasks')
      .select('id', { count: 'exact', head: true })
      .eq('user_id', user!.id)
      .eq('status', 'done')
      .gte('updated_at', today.toISOString()),
    client
      .from('tasks')
      .select('id', { count: 'exact', head: true })
      .eq('user_id', user!.id)
      .eq('status', 'needs_input'),
    client
      .from('background_jobs')
      .select('id', { count: 'exact', head: true })
      .eq('user_id', user!.id)
      .eq('status', 'running'),
  ])

  return {
    tasksCompleted: completedRes.count ?? 0,
    updates: jobsRes.count ?? 0,
    decisionsNeeded: needsInputRes.count ?? 0,
  }
}

export async function getStatusPipeline(): Promise<StatusPipelineItem[]> {
  const user = await getServerUser()
  if (shouldUseMockData(user?.id)) return mockPipelineItems

  const client = await createServerClient()
  const { data, error } = await client
    .from('tasks')
    .select('id, title, status, description, due_date, ai_rationale')
    .eq('user_id', user!.id)
    .in('status', ['in_progress', 'done', 'upcoming'])
    .order('updated_at', { ascending: false })
    .limit(3)

  if (error) {
    console.error('[v0] Error fetching pipeline:', error)
    return []
  }

  return (data ?? []).map((task) => ({
    id: task.id,
    title: task.title,
    status: task.status as 'in_progress' | 'done' | 'upcoming',
    lastAction: task.description ?? '',
    nextStep: task.ai_rationale ?? '',
    date: task.due_date ? new Date(task.due_date).toLocaleDateString('en-US', { month: 'short', day: 'numeric' }) : undefined,
  }))
}

export async function getConversations(): Promise<Conversation[]> {
  const user = await getServerUser()
  if (shouldUseMockData(user?.id)) return []

  const client = await createServerClient()
  const { data, error } = await client
    .from('conversations')
    .select('*')
    .eq('user_id', user!.id)
    .order('updated_at', { ascending: false })
    .limit(20)

  if (error) {
    console.error('[v0] Error fetching conversations:', error)
    return []
  }
  return data ?? []
}

// ============ CLIENT-SIDE MUTATIONS ============

export async function createTask(task: Omit<Task, 'id' | 'created_at' | 'updated_at'>): Promise<Task | null> {
  const { data, error } = await supabase
    .from('tasks')
    .insert(task)
    .select()
    .single()

  if (error) {
    console.error('[v0] Error creating task:', error)
    return null
  }
  return data
}

export async function updateTask(id: string, updates: Partial<Task>): Promise<Task | null> {
  const { data, error } = await supabase
    .from('tasks')
    .update(updates)
    .eq('id', id)
    .select()
    .single()

  if (error) {
    console.error('[v0] Error updating task:', error)
    return null
  }
  return data
}

export async function createProject(project: Omit<Project, 'id' | 'created_at'>): Promise<Project | null> {
  const { data, error } = await supabase
    .from('projects')
    .insert(project)
    .select()
    .single()

  if (error) {
    console.error('[v0] Error creating project:', error)
    return null
  }
  return data
}

export async function createMemory(memory: Omit<Memory, 'id' | 'created_at' | 'updated_at'>): Promise<Memory | null> {
  const { data, error } = await supabase
    .from('memories')
    .upsert(memory, { onConflict: 'user_id,key' })
    .select()
    .single()

  if (error) {
    console.error('[v0] Error creating memory:', error)
    return null
  }
  return data
}

export async function deleteMemory(id: string): Promise<boolean> {
  const { error } = await supabase
    .from('memories')
    .delete()
    .eq('id', id)

  if (error) {
    console.error('[v0] Error deleting memory:', error)
    return false
  }
  return true
}

export async function createConversation(
  userId: string,
  title: string,
  model: string,
  projectId?: string
): Promise<Conversation | null> {
  const { data, error } = await supabase
    .from('conversations')
    .insert({
      user_id: userId,
      title,
      model_used: model,
      project_id: projectId ?? null,
    })
    .select()
    .single()

  if (error) {
    console.error('[v0] Error creating conversation:', error)
    return null
  }
  return data
}

export async function saveMessage(message: Omit<Message, 'id' | 'created_at'>): Promise<Message | null> {
  const { data, error } = await supabase
    .from('messages')
    .insert(message)
    .select()
    .single()

  if (error) {
    console.error('[v0] Error saving message:', error)
    return null
  }
  return data
}

export async function getConversationMessages(conversationId: string): Promise<Message[]> {
  const { data, error } = await supabase
    .from('messages')
    .select('*')
    .eq('conversation_id', conversationId)
    .order('created_at', { ascending: true })

  if (error) {
    console.error('[v0] Error fetching messages:', error)
    return []
  }
  return data ?? []
}

export async function createAgendaItem(item: Omit<AgendaItem, 'id' | 'created_at'>): Promise<AgendaItem | null> {
  const { data, error } = await supabase
    .from('agenda_items')
    .insert(item)
    .select()
    .single()

  if (error) {
    console.error('[v0] Error creating agenda item:', error)
    return null
  }
  return data
}

export async function createQuickWin(win: Omit<QuickWin, 'id' | 'completed_at'>): Promise<QuickWin | null> {
  const { data, error } = await supabase
    .from('quick_wins')
    .insert(win)
    .select()
    .single()

  if (error) {
    console.error('[v0] Error creating quick win:', error)
    return null
  }
  return data
}
