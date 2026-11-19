-- ChiefOS Database Schema for Self-Hosted Supabase
-- Run this in your Supabase SQL Editor

-- Enable UUID extension
create extension if not exists "uuid-ossp";

-- Profiles table (extends Supabase auth.users)
create table if not exists public.profiles (
  id uuid primary key references auth.users(id) on delete cascade,
  display_name text not null,
  avatar_url text,
  proactive_mode_enabled boolean default true,
  email text not null,
  created_at timestamptz default now()
);

-- Projects table
create table if not exists public.projects (
  id uuid primary key default uuid_generate_v4(),
  user_id uuid references auth.users(id) on delete cascade not null,
  title text not null,
  description text,
  status text default 'active' check (status in ('active', 'archived')),
  color text default '#3b82f6',
  created_at timestamptz default now()
);

-- Tasks table
create table if not exists public.tasks (
  id uuid primary key default uuid_generate_v4(),
  user_id uuid references auth.users(id) on delete cascade not null,
  project_id uuid references public.projects(id) on delete set null,
  title text not null,
  description text,
  status text default 'upcoming' check (status in ('in_progress', 'done', 'upcoming', 'needs_input')),
  priority text default 'medium' check (priority in ('low', 'medium', 'high')),
  due_date timestamptz,
  ai_rationale text,
  metadata jsonb default '{}',
  created_at timestamptz default now(),
  updated_at timestamptz default now()
);

-- Background jobs table
create table if not exists public.background_jobs (
  id uuid primary key default uuid_generate_v4(),
  user_id uuid references auth.users(id) on delete cascade not null,
  task_id uuid references public.tasks(id) on delete set null,
  title text not null,
  progress_percent integer default 0 check (progress_percent >= 0 and progress_percent <= 100),
  status text default 'running' check (status in ('running', 'completed', 'failed', 'paused')),
  sources_count integer default 0,
  next_update_at timestamptz,
  created_at timestamptz default now(),
  updated_at timestamptz default now()
);

-- Agenda items table
create table if not exists public.agenda_items (
  id uuid primary key default uuid_generate_v4(),
  user_id uuid references auth.users(id) on delete cascade not null,
  title text not null,
  start_time timestamptz not null,
  end_time timestamptz,
  location text,
  type text default 'meeting' check (type in ('meeting', 'appointment', 'personal')),
  join_url text,
  created_at timestamptz default now()
);

-- Memory table (user preferences and facts the AI remembers)
create table if not exists public.memories (
  id uuid primary key default uuid_generate_v4(),
  user_id uuid references auth.users(id) on delete cascade not null,
  key text not null,
  value text not null,
  category text default 'fact' check (category in ('preference', 'fact', 'project')),
  created_at timestamptz default now(),
  updated_at timestamptz default now(),
  unique (user_id, key)
);

-- Quick wins table
create table if not exists public.quick_wins (
  id uuid primary key default uuid_generate_v4(),
  user_id uuid references auth.users(id) on delete cascade not null,
  title text not null,
  category text not null,
  completed_at timestamptz default now()
);

-- Conversations table
create table if not exists public.conversations (
  id uuid primary key default uuid_generate_v4(),
  user_id uuid references auth.users(id) on delete cascade not null,
  title text default 'New conversation',
  project_id uuid references public.projects(id) on delete set null,
  model_used text default 'llama3.2',
  created_at timestamptz default now(),
  updated_at timestamptz default now()
);

-- Messages table
create table if not exists public.messages (
  id uuid primary key default uuid_generate_v4(),
  conversation_id uuid references public.conversations(id) on delete cascade not null,
  user_id uuid references auth.users(id) on delete cascade not null,
  role text not null check (role in ('user', 'assistant', 'system')),
  content text not null,
  attachments jsonb default '[]',
  created_at timestamptz default now()
);

-- Indexes for performance
create index if not exists idx_tasks_user_id on public.tasks(user_id);
create index if not exists idx_tasks_status on public.tasks(status);
create index if not exists idx_tasks_due_date on public.tasks(due_date);
create index if not exists idx_agenda_items_user_id on public.agenda_items(user_id);
create index if not exists idx_agenda_items_start_time on public.agenda_items(start_time);
create index if not exists idx_messages_conversation_id on public.messages(conversation_id);
create index if not exists idx_projects_user_id on public.projects(user_id);
create index if not exists idx_memories_user_id on public.memories(user_id);
create index if not exists idx_quick_wins_user_id on public.quick_wins(user_id);

-- Row Level Security (RLS) policies
-- Enable RLS on all tables
alter table public.profiles enable row level security;
alter table public.projects enable row level security;
alter table public.tasks enable row level security;
alter table public.background_jobs enable row level security;
alter table public.agenda_items enable row level security;
alter table public.memories enable row level security;
alter table public.quick_wins enable row level security;
alter table public.conversations enable row level security;
alter table public.messages enable row level security;

-- Profiles: users can only see and update their own profile
create policy "Users can view own profile" on public.profiles
  for select using (auth.uid() = id);
create policy "Users can update own profile" on public.profiles
  for update using (auth.uid() = id);

-- Projects: users can CRUD their own projects
create policy "Users can view own projects" on public.projects
  for select using (auth.uid() = user_id);
create policy "Users can insert own projects" on public.projects
  for insert with check (auth.uid() = user_id);
create policy "Users can update own projects" on public.projects
  for update using (auth.uid() = user_id);
create policy "Users can delete own projects" on public.projects
  for delete using (auth.uid() = user_id);

-- Tasks: users can CRUD their own tasks
create policy "Users can view own tasks" on public.tasks
  for select using (auth.uid() = user_id);
create policy "Users can insert own tasks" on public.tasks
  for insert with check (auth.uid() = user_id);
create policy "Users can update own tasks" on public.tasks
  for update using (auth.uid() = user_id);
create policy "Users can delete own tasks" on public.tasks
  for delete using (auth.uid() = user_id);

-- Background jobs: users can CRUD their own jobs
create policy "Users can view own jobs" on public.background_jobs
  for select using (auth.uid() = user_id);
create policy "Users can insert own jobs" on public.background_jobs
  for insert with check (auth.uid() = user_id);
create policy "Users can update own jobs" on public.background_jobs
  for update using (auth.uid() = user_id);
create policy "Users can delete own jobs" on public.background_jobs
  for delete using (auth.uid() = user_id);

-- Agenda items: users can CRUD their own items
create policy "Users can view own agenda" on public.agenda_items
  for select using (auth.uid() = user_id);
create policy "Users can insert own agenda" on public.agenda_items
  for insert with check (auth.uid() = user_id);
create policy "Users can update own agenda" on public.agenda_items
  for update using (auth.uid() = user_id);
create policy "Users can delete own agenda" on public.agenda_items
  for delete using (auth.uid() = user_id);

-- Memories: users can CRUD their own memories
create policy "Users can view own memories" on public.memories
  for select using (auth.uid() = user_id);
create policy "Users can insert own memories" on public.memories
  for insert with check (auth.uid() = user_id);
create policy "Users can update own memories" on public.memories
  for update using (auth.uid() = user_id);
create policy "Users can delete own memories" on public.memories
  for delete using (auth.uid() = user_id);

-- Quick wins: users can CRUD their own wins
create policy "Users can view own quick_wins" on public.quick_wins
  for select using (auth.uid() = user_id);
create policy "Users can insert own quick_wins" on public.quick_wins
  for insert with check (auth.uid() = user_id);
create policy "Users can delete own quick_wins" on public.quick_wins
  for delete using (auth.uid() = user_id);

-- Conversations: users can CRUD their own conversations
create policy "Users can view own conversations" on public.conversations
  for select using (auth.uid() = user_id);
create policy "Users can insert own conversations" on public.conversations
  for insert with check (auth.uid() = user_id);
create policy "Users can update own conversations" on public.conversations
  for update using (auth.uid() = user_id);
create policy "Users can delete own conversations" on public.conversations
  for delete using (auth.uid() = user_id);

-- Messages: users can CRUD their own messages
create policy "Users can view own messages" on public.messages
  for select using (auth.uid() = user_id);
create policy "Users can insert own messages" on public.messages
  for insert with check (auth.uid() = user_id);
create policy "Users can delete own messages" on public.messages
  for delete using (auth.uid() = user_id);

-- Function to auto-create profile on user signup
create or replace function public.handle_new_user()
returns trigger as $$
begin
  insert into public.profiles (id, display_name, email)
  values (
    new.id,
    coalesce(new.raw_user_meta_data->>'full_name', split_part(new.email, '@', 1)),
    new.email
  );
  return new;
end;
$$ language plpgsql security definer;

-- Trigger to create profile on signup
drop trigger if exists on_auth_user_created on auth.users;
create trigger on_auth_user_created
  after insert on auth.users
  for each row execute function public.handle_new_user();

-- Function to update updated_at timestamp
create or replace function public.update_updated_at()
returns trigger as $$
begin
  new.updated_at = now();
  return new;
end;
$$ language plpgsql;

-- Triggers for updated_at
create trigger update_tasks_updated_at before update on public.tasks
  for each row execute function public.update_updated_at();
create trigger update_jobs_updated_at before update on public.background_jobs
  for each row execute function public.update_updated_at();
create trigger update_memories_updated_at before update on public.memories
  for each row execute function public.update_updated_at();
create trigger update_conversations_updated_at before update on public.conversations
  for each row execute function public.update_updated_at();
