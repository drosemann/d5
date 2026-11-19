import type { User } from '@supabase/supabase-js'

export const DEMO_EMAIL = 'demo@chiefos.app'
export const DEMO_PASSWORD = 'demo'
export const DEMO_SESSION_COOKIE = 'chiefos-demo-session'

export const DEMO_USER: User = {
  id: 'demo-user-00000000-0000-0000-0000-000000000001',
  aud: 'authenticated',
  role: 'authenticated',
  email: DEMO_EMAIL,
  email_confirmed_at: new Date().toISOString(),
  phone: '',
  confirmed_at: new Date().toISOString(),
  last_sign_in_at: new Date().toISOString(),
  app_metadata: { provider: 'demo', providers: ['demo'] },
  user_metadata: { full_name: 'Demo User' },
  identities: [],
  created_at: new Date().toISOString(),
  updated_at: new Date().toISOString(),
  is_anonymous: false,
}

/** Returns true when Supabase env vars are not yet configured. */
export function isSupabaseUnconfigured(): boolean {
  const url = process.env.NEXT_PUBLIC_SUPABASE_URL ?? ''
  const key = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY ?? ''
  return (
    !url ||
    url === 'http://localhost:8000' ||
    !key ||
    key === 'your-anon-key-here'
  )
}

/** Returns true if the given user ID is the demo user. */
export function isDemoUser(userId: string | undefined): boolean {
  return userId === DEMO_USER.id
}
