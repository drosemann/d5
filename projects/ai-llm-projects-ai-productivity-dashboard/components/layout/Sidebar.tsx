'use client'

import { cn } from '@/lib/utils'
import { useUIStore } from '@/stores/uiStore'
import { useDashboardData } from '@/hooks/useDashboardData'
import {
  Home,
  Inbox,
  FolderOpen,
  Brain,
  CheckSquare,
  Store,
  Zap,
  Settings,
  MoreHorizontal,
  PanelLeftClose,
  PanelLeftOpen,
  LogOut,
} from 'lucide-react'
import { Badge } from '@/components/ui/badge'
import { Switch } from '@/components/ui/switch'
import { Avatar, AvatarFallback, AvatarImage } from '@/components/ui/avatar'
import { Button } from '@/components/ui/button'
import { Tooltip, TooltipContent, TooltipProvider, TooltipTrigger } from '@/components/ui/tooltip'
import { DropdownMenu, DropdownMenuContent, DropdownMenuItem, DropdownMenuSeparator, DropdownMenuTrigger } from '@/components/ui/dropdown-menu'
import { signOut } from '@/app/actions/auth'
import type { User } from '@supabase/supabase-js'
import { format } from 'date-fns'

const navItems = [
  { icon: Home, label: 'Home', view: 'dashboard' as const },
  { icon: Inbox, label: 'Inbox', view: 'inbox' as const, badge: 4 },
  { icon: FolderOpen, label: 'Projects', view: 'projects' as const },
  { icon: Brain, label: 'Memory', view: 'memory' as const },
  { icon: CheckSquare, label: 'Tasks', view: 'tasks' as const },
  { icon: Store, label: 'Explore GPTs', view: 'projects' as const },
]

interface SidebarProps {
  user: User | null
}

export function Sidebar({ user }: SidebarProps) {
  const { sidebarCollapsed, toggleSidebar, proactiveMode, toggleProactiveMode, activeView, setActiveView } = useUIStore()
  const { projects, agendaItems } = useDashboardData()

  const displayName = user?.user_metadata?.full_name ?? user?.email?.split('@')[0] ?? 'You'
  const displayEmail = user?.email ?? ''
  const initials = displayName.split(' ').map((n: string) => n[0]).join('').slice(0, 2).toUpperCase()

  return (
    <TooltipProvider delayDuration={0}>
      <aside
        className={cn(
          'flex flex-col h-full bg-sidebar border-r border-sidebar-border transition-all duration-300 shrink-0',
          sidebarCollapsed ? 'w-[72px]' : 'w-[260px]'
        )}
      >
        {/* Header */}
        <div className={cn('flex items-center h-14 px-4 border-b border-sidebar-border', sidebarCollapsed && 'justify-center')}>
          {!sidebarCollapsed && (
            <div className="flex items-center gap-2 flex-1 min-w-0">
              <div className="w-7 h-7 rounded-lg bg-primary flex items-center justify-center shrink-0">
                <Zap className="w-4 h-4 text-primary-foreground" />
              </div>
              <span className="font-semibold text-sm text-sidebar-foreground truncate">ChiefOS</span>
            </div>
          )}
          <Button
            variant="ghost"
            size="icon"
            className="h-7 w-7 text-muted-foreground hover:text-sidebar-foreground shrink-0"
            onClick={toggleSidebar}
          >
            {sidebarCollapsed ? <PanelLeftOpen className="w-4 h-4" /> : <PanelLeftClose className="w-4 h-4" />}
          </Button>
        </div>

        {/* Nav */}
        <nav className="flex-1 overflow-y-auto py-3 space-y-0.5 px-2">
          {navItems.map((item) => {
            const isActive = activeView === item.view
            const btn = (
              <button
                key={item.label}
                onClick={() => setActiveView(item.view)}
                className={cn(
                  'w-full flex items-center gap-3 px-2.5 py-2 rounded-lg text-sm transition-colors',
                  isActive
                    ? 'bg-sidebar-accent text-sidebar-foreground font-medium'
                    : 'text-muted-foreground hover:bg-sidebar-accent/60 hover:text-sidebar-foreground',
                  sidebarCollapsed && 'justify-center px-0'
                )}
              >
                <item.icon className="w-[18px] h-[18px] shrink-0" />
                {!sidebarCollapsed && (
                  <>
                    <span className="flex-1 text-left truncate">{item.label}</span>
                    {item.badge && (
                      <Badge className="h-5 px-1.5 text-[11px] bg-primary text-primary-foreground rounded-full">
                        {item.badge}
                      </Badge>
                    )}
                  </>
                )}
              </button>
            )

            if (sidebarCollapsed) {
              return (
                <Tooltip key={item.label}>
                  <TooltipTrigger asChild>{btn}</TooltipTrigger>
                  <TooltipContent side="right">
                    {item.label}
                    {item.badge ? ` (${item.badge})` : ''}
                  </TooltipContent>
                </Tooltip>
              )
            }
            return btn
          })}

          {/* Pinned */}
          {!sidebarCollapsed && projects.length > 0 && (
            <div className="pt-4">
              <p className="px-2.5 mb-1.5 text-[11px] font-medium text-muted-foreground uppercase tracking-wider">
                Pinned
              </p>
              {projects.slice(0, 4).map((project) => (
                <button
                  key={project.id}
                  className="w-full flex items-center gap-3 px-2.5 py-2 rounded-lg text-sm text-muted-foreground hover:bg-sidebar-accent/60 hover:text-sidebar-foreground transition-colors"
                >
                  <span
                    className="w-2 h-2 rounded-full shrink-0"
                    style={{ backgroundColor: project.color }}
                  />
                  <span className="truncate">{project.title}</span>
                </button>
              ))}
            </div>
          )}

          {/* Today's schedule */}
          {!sidebarCollapsed && agendaItems.length > 0 && (
            <div className="pt-4">
              <p className="px-2.5 mb-1.5 text-[11px] font-medium text-muted-foreground uppercase tracking-wider">
                Today
              </p>
              {agendaItems.map((event) => (
                <div
                  key={event.id}
                  className="flex items-start gap-3 px-2.5 py-1.5 rounded-lg hover:bg-sidebar-accent/40 cursor-default"
                >
                  <span className="text-[11px] text-muted-foreground w-14 shrink-0 pt-0.5">
                    {format(new Date(event.start_time), 'h:mm a')}
                  </span>
                  <span className="text-sm text-sidebar-foreground/80 truncate">{event.title}</span>
                </div>
              ))}
            </div>
          )}
        </nav>

        {/* Proactive Mode */}
        <div className="px-3 py-3 border-t border-sidebar-border">
          {sidebarCollapsed ? (
            <Tooltip>
              <TooltipTrigger asChild>
                <div className="flex justify-center">
                  <div
                    className={cn(
                      'w-2 h-2 rounded-full',
                      proactiveMode ? 'bg-green-500' : 'bg-muted-foreground'
                    )}
                  />
                </div>
              </TooltipTrigger>
              <TooltipContent side="right">Proactive Mode {proactiveMode ? 'On' : 'Off'}</TooltipContent>
            </Tooltip>
          ) : (
            <div className="bg-sidebar-accent rounded-xl p-3 space-y-2">
              <div className="flex items-center gap-2">
                <Zap className="w-4 h-4 text-primary shrink-0" />
                <span className="text-sm font-medium text-sidebar-foreground">Proactive mode</span>
              </div>
              <div className="flex items-center justify-between">
                <div className="flex items-center gap-2">
                  <Switch
                    checked={proactiveMode}
                    onCheckedChange={toggleProactiveMode}
                    className="scale-90"
                  />
                  <span className="text-xs text-muted-foreground">
                    {proactiveMode ? 'On' : 'Off'} · GPT will update and act
                  </span>
                </div>
              </div>
              <button className="flex items-center gap-1 text-xs text-muted-foreground hover:text-sidebar-foreground transition-colors">
                <Settings className="w-3 h-3" />
                Settings
              </button>
            </div>
          )}
        </div>

        {/* User */}
        <div className="border-t border-sidebar-border">
          <DropdownMenu>
            <DropdownMenuTrigger asChild>
              <button
                className={cn(
                  'w-full flex items-center gap-3 px-3 py-3 hover:bg-sidebar-accent/60 transition-colors',
                  sidebarCollapsed && 'justify-center'
                )}
              >
                <Avatar className="h-8 w-8 shrink-0">
                  <AvatarImage src={`https://api.dicebear.com/7.x/initials/svg?seed=${displayName}`} />
                  <AvatarFallback className="bg-primary text-primary-foreground text-xs">{initials}</AvatarFallback>
                </Avatar>
                {!sidebarCollapsed && (
                  <>
                    <div className="flex-1 min-w-0 text-left">
                      <p className="text-sm font-medium text-sidebar-foreground truncate">{displayName}</p>
                      <p className="text-xs text-muted-foreground truncate">{displayEmail}</p>
                    </div>
                    <MoreHorizontal className="w-4 h-4 text-muted-foreground shrink-0" />
                  </>
                )}
              </button>
            </DropdownMenuTrigger>
            <DropdownMenuContent side="top" align="start" className="w-52">
              <div className="px-2 py-1.5">
                <p className="text-sm font-medium truncate">{displayName}</p>
                <p className="text-xs text-muted-foreground truncate">{displayEmail}</p>
              </div>
              <DropdownMenuSeparator />
              <DropdownMenuItem asChild>
                <form action={signOut}>
                  <button type="submit" className="flex items-center gap-2 w-full text-destructive">
                    <LogOut className="w-4 h-4" />
                    Sign out
                  </button>
                </form>
              </DropdownMenuItem>
            </DropdownMenuContent>
          </DropdownMenu>
        </div>
      </aside>
    </TooltipProvider>
  )
}
