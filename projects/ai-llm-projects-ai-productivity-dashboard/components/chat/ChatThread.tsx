'use client'

import { useChatStore } from '@/stores/chatStore'
import { cn } from '@/lib/utils'
import { Bot, User, Loader2 } from 'lucide-react'
import { format } from 'date-fns'

export function ChatThread() {
  const { messages, isStreaming, streamingContent } = useChatStore()

  if (messages.length === 0 && !isStreaming) return null

  return (
    <div className="space-y-4 py-2">
      {messages.map((msg) => (
        <div
          key={msg.id}
          className={cn(
            'flex gap-3',
            msg.role === 'user' ? 'justify-end' : 'justify-start'
          )}
        >
          {msg.role !== 'user' && (
            <div className="w-7 h-7 rounded-full bg-primary/10 flex items-center justify-center shrink-0 mt-0.5">
              <Bot className="w-4 h-4 text-primary" />
            </div>
          )}
          <div
            className={cn(
              'max-w-[85%] rounded-2xl px-4 py-2.5 text-sm leading-relaxed',
              msg.role === 'user'
                ? 'bg-foreground text-background rounded-br-sm'
                : 'bg-muted text-foreground rounded-bl-sm'
            )}
          >
            <p className="whitespace-pre-wrap">{msg.content}</p>
            <p className="text-[10px] opacity-40 mt-1 text-right">
              {format(new Date(msg.created_at), 'h:mm a')}
            </p>
          </div>
          {msg.role === 'user' && (
            <div className="w-7 h-7 rounded-full bg-foreground flex items-center justify-center shrink-0 mt-0.5">
              <User className="w-4 h-4 text-background" />
            </div>
          )}
        </div>
      ))}

      {/* Streaming bubble */}
      {isStreaming && (
        <div className="flex gap-3 justify-start">
          <div className="w-7 h-7 rounded-full bg-primary/10 flex items-center justify-center shrink-0 mt-0.5">
            <Bot className="w-4 h-4 text-primary" />
          </div>
          <div className="max-w-[85%] rounded-2xl rounded-bl-sm px-4 py-2.5 text-sm leading-relaxed bg-muted text-foreground">
            {streamingContent ? (
              <p className="whitespace-pre-wrap">{streamingContent}</p>
            ) : (
              <div className="flex items-center gap-1.5 py-0.5">
                <Loader2 className="w-3.5 h-3.5 animate-spin text-muted-foreground" />
                <span className="text-muted-foreground text-xs">Thinking...</span>
              </div>
            )}
          </div>
        </div>
      )}
    </div>
  )
}
