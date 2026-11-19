import { NextResponse } from 'next/server'
import type { NextRequest } from 'next/server'
import { DEMO_SESSION_COOKIE } from '@/lib/demoAuth'

const PUBLIC_PATHS = ['/login', '/register']

export function middleware(request: NextRequest) {
  const { pathname } = request.nextUrl
  const accessToken = request.cookies.get('sb-access-token')?.value
  const demoSession = request.cookies.get(DEMO_SESSION_COOKIE)?.value

  const isAuthenticated = !!accessToken || !!demoSession
  const isPublic = PUBLIC_PATHS.some((p) => pathname.startsWith(p))

  if (!isAuthenticated && !isPublic) {
    const url = request.nextUrl.clone()
    url.pathname = '/login'
    return NextResponse.redirect(url)
  }

  if (isAuthenticated && isPublic) {
    const url = request.nextUrl.clone()
    url.pathname = '/'
    return NextResponse.redirect(url)
  }

  return NextResponse.next()
}

export const config = {
  matcher: ['/((?!_next/static|_next/image|favicon.ico|icon.*|apple-icon.*).*)'],
}
