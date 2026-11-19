// Goose-Port-Spiegel von: projects/ai-llm-projects-ai-productivity-dashboard/lib/supabaseServer.ts
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/ai-llm-projects-ai-productivity-dashboard/lib/supabaseServer.ts");
}

// ---- Original-Code (projects/ai-llm-projects-ai-productivity-dashboard/lib/supabaseServer.ts), unveraendert, als Inline-Doku ----
// import { createClient } from '@supabase/supabase-js'
// import { cookies } from 'next/headers'
// import { DEMO_SESSION_COOKIE, DEMO_USER, isSupabaseUnconfigured } from '@/lib/demoAuth'
//
// export async function createServerClient() {
//   const cookieStore = await cookies()
//   const accessToken = cookieStore.get('sb-access-token')?.value
//   const refreshToken = cookieStore.get('sb-refresh-token')?.value
//
//   const client = createClient(
//     process.env.NEXT_PUBLIC_SUPABASE_URL!,
//     process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!,
//     {
//       auth: {
//         autoRefreshToken: false,
//         persistSession: false,
//         detectSessionInUrl: false,
//       },
//     }
//   )
//
//   if (accessToken && refreshToken) {
//     await client.auth.setSession({
//       access_token: accessToken,
//       refresh_token: refreshToken,
//     })
//   }
//
//   return client
// }
//
// export async function getServerUser() {
//   const cookieStore = await cookies()
//
//   // Return demo user if demo session cookie is set
//   if (cookieStore.get(DEMO_SESSION_COOKIE)?.value) {
//     return DEMO_USER
//   }
//
//   // Return null immediately if Supabase isn't configured
//   if (isSupabaseUnconfigured()) return null
//
//   const client = await createServerClient()
//   const { data: { user } } = await client.auth.getUser()
//   return user
// }
//
