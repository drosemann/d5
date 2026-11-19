import { getServerUser } from '@/lib/supabaseServer'
import { AppShell } from '@/components/layout/AppShell'

export default async function HomePage() {
  const user = await getServerUser()
  return <AppShell user={user} />
}
