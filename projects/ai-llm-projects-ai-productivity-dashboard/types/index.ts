export type TaskStatus = 'in_progress' | 'done' | 'upcoming' | 'needs_input'
export type JobStatus = 'running' | 'completed' | 'failed' | 'paused'
export type MessageRole = 'user' | 'assistant' | 'system'
export type ProjectStatus = 'active' | 'archived'
export type AgendaType = 'meeting' | 'appointment' | 'personal'
export type MemoryCategory = 'preference' | 'fact' | 'project'

export interface Profile {
  id: string
  display_name: string
  avatar_url: string | null
  proactive_mode_enabled: boolean
  email: string
  created_at: string
}

export interface Project {
  id: string
  user_id: string
  title: string
  description: string | null
  status: ProjectStatus
  color: string
  created_at: string
}

export interface Task {
  id: string
  user_id: string
  project_id: string | null
  title: string
  description: string | null
  status: TaskStatus
  priority: 'low' | 'medium' | 'high'
  due_date: string | null
  ai_rationale: string | null
  metadata: Record<string, unknown>
  created_at: string
  updated_at: string
}

export interface BackgroundJob {
  id: string
  user_id: string
  task_id: string | null
  title: string
  progress_percent: number
  status: JobStatus
  sources_count: number
  next_update_at: string | null
  created_at: string
  updated_at: string
}

export interface AgendaItem {
  id: string
  user_id: string
  title: string
  start_time: string
  end_time: string | null
  location: string | null
  type: AgendaType
  join_url: string | null
  created_at: string
}

export interface Memory {
  id: string
  user_id: string
  key: string
  value: string
  category: MemoryCategory
  created_at: string
  updated_at: string
}

export interface QuickWin {
  id: string
  user_id: string
  title: string
  category: string
  completed_at: string
}

export interface Conversation {
  id: string
  user_id: string
  title: string
  project_id: string | null
  model_used: string
  created_at: string
  updated_at: string
}

export interface Message {
  id: string
  conversation_id: string
  user_id: string
  role: MessageRole
  content: string
  attachments: Attachment[]
  created_at: string
}

export interface Attachment {
  id: string
  message_id: string
  storage_path: string
  filename: string
  mime_type: string
  created_at: string
}

export interface OllamaModel {
  name: string
  modified_at: string
  size: number
}

export interface StatusPipelineItem {
  id: string
  title: string
  status: 'in_progress' | 'done' | 'upcoming'
  lastAction: string
  nextStep: string
  date?: string
}

export interface DashboardMetrics {
  tasksCompleted: number
  updates: number
  decisionsNeeded: number
}
