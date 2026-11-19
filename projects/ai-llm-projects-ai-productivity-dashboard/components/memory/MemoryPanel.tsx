'use client'

import { useState, useEffect } from 'react'
import { Brain, Tag, Trash2, Pencil, Plus, Check, X, Loader2 } from 'lucide-react'
import { Badge } from '@/components/ui/badge'
import { Button } from '@/components/ui/button'
import { Input } from '@/components/ui/input'
import type { MemoryCategory } from '@/types'
import type { Memory } from '@/types'
import { cn } from '@/lib/utils'
import { useDashboardData } from '@/hooks/useDashboardData'

const categoryConfig: Record<MemoryCategory, { label: string; color: string }> = {
  preference: { label: 'Preference', color: 'bg-blue-500/10 text-blue-600 dark:text-blue-400' },
  fact: { label: 'Fact', color: 'bg-amber-500/10 text-amber-600 dark:text-amber-400' },
  project: { label: 'Project', color: 'bg-purple-500/10 text-purple-600 dark:text-purple-400' },
}

export function MemoryPanel() {
  const { memories: serverMemories, isLoading } = useDashboardData()
  const [memories, setMemories] = useState<Memory[]>([])
  const [editingId, setEditingId] = useState<string | null>(null)
  const [editValue, setEditValue] = useState('')
  const [filter, setFilter] = useState<MemoryCategory | 'all'>('all')

  // Sync server memories to local state
  useEffect(() => {
    if (serverMemories.length > 0) {
      setMemories(serverMemories)
    }
  }, [serverMemories])

  const filtered = filter === 'all' ? memories : memories.filter((m) => m.category === filter)

  const deleteMemory = (id: string) => setMemories((prev) => prev.filter((m) => m.id !== id))

  const startEdit = (memory: Memory) => {
    setEditingId(memory.id)
    setEditValue(memory.value)
  }

  const saveEdit = (id: string) => {
    setMemories((prev) =>
      prev.map((m) => (m.id === id ? { ...m, value: editValue, updated_at: new Date().toISOString() } : m))
    )
    setEditingId(null)
  }

  return (
    <div className="space-y-5">
      {/* Header */}
      <div className="flex items-center justify-between">
        <div className="flex items-center gap-2">
          <Brain className="w-5 h-5 text-primary" />
          <h2 className="text-lg font-semibold text-foreground">Memory</h2>
          <Badge variant="secondary" className="text-xs">{memories.length} entries</Badge>
        </div>
        <Button size="sm" variant="outline" className="h-8 text-xs gap-1.5">
          <Plus className="w-3.5 h-3.5" />
          Add memory
        </Button>
      </div>

      {/* Filter tabs */}
      <div className="flex items-center gap-1.5 flex-wrap">
        {(['all', 'preference', 'fact', 'project'] as const).map((cat) => (
          <button
            key={cat}
            onClick={() => setFilter(cat)}
            className={cn(
              'text-xs px-3 py-1.5 rounded-full transition-colors capitalize',
              filter === cat
                ? 'bg-foreground text-background'
                : 'bg-muted text-muted-foreground hover:text-foreground hover:bg-muted/80'
            )}
          >
            {cat === 'all' ? 'All' : categoryConfig[cat].label}
          </button>
        ))}
      </div>

      {/* Memories */}
      {isLoading ? (
        <div className="flex items-center justify-center py-10">
          <Loader2 className="w-6 h-6 animate-spin text-muted-foreground" />
        </div>
      ) : (
        <div className="space-y-2.5">
          {filtered.map((mem) => (
          <div
            key={mem.id}
            className="border border-border bg-card rounded-xl p-3.5 group hover:border-ring/40 transition-colors"
          >
            <div className="flex items-start justify-between gap-2">
              <div className="flex-1 min-w-0 space-y-1">
                <div className="flex items-center gap-2">
                  <Tag className="w-3 h-3 text-muted-foreground shrink-0" />
                  <span className="text-xs font-mono text-muted-foreground truncate">{mem.key}</span>
                  <Badge className={cn('text-[10px] border-0 px-1.5 py-0 rounded-full', categoryConfig[mem.category].color)}>
                    {categoryConfig[mem.category].label}
                  </Badge>
                </div>
                {editingId === mem.id ? (
                  <div className="flex items-center gap-2">
                    <Input
                      value={editValue}
                      onChange={(e) => setEditValue(e.target.value)}
                      className="h-7 text-sm"
                      onKeyDown={(e) => {
                        if (e.key === 'Enter') saveEdit(mem.id)
                        if (e.key === 'Escape') setEditingId(null)
                      }}
                      autoFocus
                    />
                    <Button size="icon" variant="ghost" className="h-7 w-7 text-green-500" onClick={() => saveEdit(mem.id)}>
                      <Check className="w-3.5 h-3.5" />
                    </Button>
                    <Button size="icon" variant="ghost" className="h-7 w-7 text-muted-foreground" onClick={() => setEditingId(null)}>
                      <X className="w-3.5 h-3.5" />
                    </Button>
                  </div>
                ) : (
                  <p className="text-sm text-foreground leading-relaxed">{mem.value}</p>
                )}
              </div>
              <div className="flex items-center gap-1 opacity-0 group-hover:opacity-100 transition-opacity shrink-0">
                <Button
                  size="icon"
                  variant="ghost"
                  className="h-7 w-7 text-muted-foreground hover:text-foreground"
                  onClick={() => startEdit(mem)}
                >
                  <Pencil className="w-3.5 h-3.5" />
                </Button>
                <Button
                  size="icon"
                  variant="ghost"
                  className="h-7 w-7 text-muted-foreground hover:text-destructive"
                  onClick={() => deleteMemory(mem.id)}
                >
                  <Trash2 className="w-3.5 h-3.5" />
                </Button>
              </div>
            </div>
          </div>
        ))}
        {filtered.length === 0 && !isLoading && (
          <p className="text-sm text-muted-foreground text-center py-8">No memories yet. Start a conversation to create some.</p>
        )}
      </div>
      )}
    </div>
  )
}
