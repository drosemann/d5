// Goose-Port-Spiegel von: projects/ai-llm-projects-ai-productivity-dashboard/supabase/seed.sql
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/ai-llm-projects-ai-productivity-dashboard/supabase/seed.sql");
}

// ---- Original-Code (projects/ai-llm-projects-ai-productivity-dashboard/supabase/seed.sql), unveraendert, als Inline-Doku ----
// -- Sample data for testing
// -- Run this after creating a user account in your self-hosted Supabase
//
// -- Replace 'YOUR_USER_ID_HERE' with your actual user ID from auth.users
//
// -- Projects
// INSERT INTO public.projects (user_id, title, description, status, color) VALUES
// ('YOUR_USER_ID_HERE', 'Launch Strategy', 'Q4 product launch campaign', 'active', '#3b82f6'),
// ('YOUR_USER_ID_HERE', 'Japan Trip', 'April vacation planning', 'active', '#8b5cf6'),
// ('YOUR_USER_ID_HERE', 'Health & Fitness', 'Workout and wellness tracking', 'active', '#10b981'),
// ('YOUR_USER_ID_HERE', 'Learning Python', 'Programming course progress', 'active', '#f59e0b');
//
// -- Tasks
// INSERT INTO public.tasks (user_id, project_id, title, description, status, priority, due_date, ai_rationale) VALUES
// ('YOUR_USER_ID_HERE', (SELECT id FROM public.projects WHERE title = 'Launch Strategy' LIMIT 1), 'Review & approve: Q4 messaging', 'I compared 6 options and recommend Option B.', 'needs_input', 'high', NOW() + INTERVAL '30 minutes', 'Based on competitive analysis and brand guidelines, Option B best balances impact with feasibility.'),
// ('YOUR_USER_ID_HERE', NULL, 'Prep: Dentist Appointment', 'Added to calendar. Suggested talking points ready.', 'upcoming', 'low', NOW() + INTERVAL '1 day', NULL),
// ('YOUR_USER_ID_HERE', (SELECT id FROM public.projects WHERE title = 'Launch Strategy' LIMIT 1), 'Q4 Launch Strategy', 'Deck draft updated. Sent to team.', 'in_progress', 'high', NOW() + INTERVAL '7 days', 'Next: finalize messaging'),
// ('YOUR_USER_ID_HERE', NULL, 'Gym Membership Canceled', 'As requested. Refund initiated.', 'done', 'low', NULL, NULL);
//
// -- Background jobs
// INSERT INTO public.background_jobs (user_id, title, progress_percent, status, sources_count, next_update_at) VALUES
// ('YOUR_USER_ID_HERE', 'Deep Research: Industry benchmark report', 42, 'running', 120, NOW() + INTERVAL '1 hour');
//
// -- Agenda items for today
// INSERT INTO public.agenda_items (user_id, title, start_time, end_time, location, type, join_url) VALUES
// ('YOUR_USER_ID_HERE', 'Q4 Review Sync', NOW()::date + INTERVAL '10 hours', NOW()::date + INTERVAL '10 hours 30 minutes', 'Room 4A', 'meeting', 'https://meet.google.com/abc-defg-hij'),
// ('YOUR_USER_ID_HERE', 'Dentist Appointment', NOW()::date + INTERVAL '13 hours 30 minutes', NOW()::date + INTERVAL '14 hours 15 minutes', 'Downtown Dental', 'appointment', NULL),
// ('YOUR_USER_ID_HERE', 'Dinner with Alex', NOW()::date + INTERVAL '18 hours', NOW()::date + INTERVAL '19 hours', 'Alba Restaurant', 'personal', NULL);
//
// -- Memories
// INSERT INTO public.memories (user_id, key, value, category) VALUES
// ('YOUR_USER_ID_HERE', 'preferred_flight_class', 'Business class for flights over 4 hours', 'preference'),
// ('YOUR_USER_ID_HERE', 'work_hours', 'Prefers to work 9am-6pm, no meetings after 5pm', 'preference'),
// ('YOUR_USER_ID_HERE', 'q4_launch_deadline', 'Q4 launch is October 15th, hard deadline from CEO', 'fact'),
// ('YOUR_USER_ID_HERE', 'japan_trip_context', '17 reservations confirmed, packing list generated', 'project');
//
// -- Quick wins
// INSERT INTO public.quick_wins (user_id, title, category) VALUES
// ('YOUR_USER_ID_HERE', 'Rescheduled team offsite to May 2-4 to avoid conflicts', 'scheduling'),
// ('YOUR_USER_ID_HERE', 'Found and applied $28 credit to your flight', 'travel'),
// ('YOUR_USER_ID_HERE', 'Drafted thank-you note to investor James L.', 'communication');
//
