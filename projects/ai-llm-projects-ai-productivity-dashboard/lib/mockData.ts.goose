// Goose-Port-Spiegel von: projects/ai-llm-projects-ai-productivity-dashboard/lib/mockData.ts
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/ai-llm-projects-ai-productivity-dashboard/lib/mockData.ts");
}

// ---- Original-Code (projects/ai-llm-projects-ai-productivity-dashboard/lib/mockData.ts), unveraendert, als Inline-Doku ----
// import type {
//   Task,
//   BackgroundJob,
//   AgendaItem,
//   QuickWin,
//   StatusPipelineItem,
//   DashboardMetrics,
//   Memory,
//   Project,
// } from '@/types'
//
// export const mockMetrics: DashboardMetrics = {
//   tasksCompleted: 2,
//   updates: 3,
//   decisionsNeeded: 1,
// }
//
// export const mockPipelineItems: StatusPipelineItem[] = [
//   {
//     id: '1',
//     title: 'Q4 Launch Strategy',
//     status: 'in_progress',
//     lastAction: 'Deck draft updated · Sent to team',
//     nextStep: 'Next: finalize messaging',
//   },
//   {
//     id: '2',
//     title: 'Gym Membership Canceled',
//     status: 'done',
//     lastAction: 'As requested · Refund initiated',
//     nextStep: '',
//   },
//   {
//     id: '3',
//     title: 'Japan Trip · Apr 24',
//     status: 'upcoming',
//     lastAction: 'Itinerary refined · 17 reservations confirmed',
//     nextStep: '',
//     date: 'Apr 24',
//   },
// ]
//
// export const mockTasks: Task[] = [
//   {
//     id: 'task-1',
//     user_id: 'user-1',
//     project_id: 'proj-1',
//     title: 'Review & approve: Q4 messaging',
//     description:
//       'I compared 6 options and recommend Option B.',
//     status: 'needs_input',
//     priority: 'high',
//     due_date: new Date(Date.now() + 30 * 60 * 1000).toISOString(),
//     ai_rationale: 'I compared 6 options and recommend Option B.',
//     metadata: { attachment: 'Q4_Messaging_Recommendation.pdf' },
//     created_at: new Date().toISOString(),
//     updated_at: new Date().toISOString(),
//   },
//   {
//     id: 'task-3',
//     user_id: 'user-1',
//     project_id: null,
//     title: 'Prep: Dentist Appointment',
//     description: 'Added to calendar · Suggested talking points ready',
//     status: 'upcoming',
//     priority: 'low',
//     due_date: new Date(Date.now() + 24 * 60 * 60 * 1000).toISOString(),
//     ai_rationale: null,
//     metadata: {},
//     created_at: new Date().toISOString(),
//     updated_at: new Date().toISOString(),
//   },
// ]
//
// export const mockBackgroundJobs: BackgroundJob[] = [
//   {
//     id: 'job-1',
//     user_id: 'user-1',
//     task_id: null,
//     title: 'Deep Research: Industry benchmark report',
//     progress_percent: 42,
//     status: 'running',
//     sources_count: 120,
//     next_update_at: new Date(Date.now() + 60 * 60 * 1000).toISOString(),
//     created_at: new Date().toISOString(),
//     updated_at: new Date().toISOString(),
//   },
// ]
//
// export const mockAgendaItems: AgendaItem[] = [
//   {
//     id: 'agenda-1',
//     user_id: 'user-1',
//     title: 'Q4 Review Sync',
//     start_time: new Date().toISOString().replace(/T.*/, 'T10:00:00'),
//     end_time: new Date().toISOString().replace(/T.*/, 'T10:30:00'),
//     location: 'Room 4A',
//     type: 'meeting',
//     join_url: '#',
//     created_at: new Date().toISOString(),
//   },
//   {
//     id: 'agenda-2',
//     user_id: 'user-1',
//     title: 'Dentist Appointment',
//     start_time: new Date().toISOString().replace(/T.*/, 'T13:30:00'),
//     end_time: new Date().toISOString().replace(/T.*/, 'T14:15:00'),
//     location: 'Downtown Dental',
//     type: 'appointment',
//     join_url: null,
//     created_at: new Date().toISOString(),
//   },
//   {
//     id: 'agenda-3',
//     user_id: 'user-1',
//     title: 'Dinner with Alex',
//     start_time: new Date().toISOString().replace(/T.*/, 'T18:00:00'),
//     end_time: new Date().toISOString().replace(/T.*/, 'T19:00:00'),
//     location: 'Alba Restaurant',
//     type: 'personal',
//     join_url: null,
//     created_at: new Date().toISOString(),
//   },
// ]
//
// export const mockQuickWins: QuickWin[] = [
//   {
//     id: 'qw-1',
//     user_id: 'user-1',
//     title: 'Rescheduled team offsite to May 2–4 to avoid conflicts',
//     category: 'scheduling',
//     completed_at: new Date().toISOString(),
//   },
//   {
//     id: 'qw-2',
//     user_id: 'user-1',
//     title: 'Found and applied $28 credit to your flight',
//     category: 'travel',
//     completed_at: new Date().toISOString(),
//   },
//   {
//     id: 'qw-3',
//     user_id: 'user-1',
//     title: 'Drafted thank-you note to investor James L.',
//     category: 'communication',
//     completed_at: new Date().toISOString(),
//   },
// ]
//
// export const mockProjects: Project[] = [
//   {
//     id: 'proj-1',
//     user_id: 'user-1',
//     title: 'Launch Strategy',
//     description: 'Q4 product launch campaign',
//     status: 'active',
//     color: '#3b82f6',
//     created_at: new Date().toISOString(),
//   },
//   {
//     id: 'proj-2',
//     user_id: 'user-1',
//     title: 'Japan Trip',
//     description: 'April vacation planning',
//     status: 'active',
//     color: '#8b5cf6',
//     created_at: new Date().toISOString(),
//   },
//   {
//     id: 'proj-3',
//     user_id: 'user-1',
//     title: 'Health & Fitness',
//     description: 'Workout and wellness tracking',
//     status: 'active',
//     color: '#10b981',
//     created_at: new Date().toISOString(),
//   },
//   {
//     id: 'proj-4',
//     user_id: 'user-1',
//     title: 'Learning Python',
//     description: 'Programming course progress',
//     status: 'active',
//     color: '#f59e0b',
//     created_at: new Date().toISOString(),
//   },
// ]
//
// export const mockMemories: Memory[] = [
//   {
//     id: 'mem-1',
//     user_id: 'user-1',
//     key: 'preferred_flight_class',
//     value: 'Business class for flights over 4 hours',
//     category: 'preference',
//     created_at: new Date().toISOString(),
//     updated_at: new Date().toISOString(),
//   },
//   {
//     id: 'mem-2',
//     user_id: 'user-1',
//     key: 'work_hours',
//     value: 'Prefers to work 9am–6pm, no meetings after 5pm',
//     category: 'preference',
//     created_at: new Date().toISOString(),
//     updated_at: new Date().toISOString(),
//   },
//   {
//     id: 'mem-3',
//     user_id: 'user-1',
//     key: 'q4_launch_deadline',
//     value: 'Q4 launch is October 15th, hard deadline from CEO',
//     category: 'fact',
//     created_at: new Date().toISOString(),
//     updated_at: new Date().toISOString(),
//   },
//   {
//     id: 'mem-4',
//     user_id: 'user-1',
//     key: 'japan_trip_context',
//     value: '17 reservations confirmed, packing list generated',
//     category: 'project',
//     created_at: new Date().toISOString(),
//     updated_at: new Date().toISOString(),
//   },
// ]
//
