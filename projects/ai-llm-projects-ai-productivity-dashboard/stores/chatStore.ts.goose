// Goose-Port-Spiegel von: projects/ai-llm-projects-ai-productivity-dashboard/stores/chatStore.ts
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/ai-llm-projects-ai-productivity-dashboard/stores/chatStore.ts");
}

// ---- Original-Code (projects/ai-llm-projects-ai-productivity-dashboard/stores/chatStore.ts), unveraendert, als Inline-Doku ----
// import { create } from 'zustand'
// import type { Message } from '@/types'
// import { DEFAULT_MODEL } from '@/lib/ollamaClient'
//
// interface ChatStore {
//   activeConversationId: string | null
//   isStreaming: boolean
//   currentModel: string
//   abortController: AbortController | null
//   messages: Message[]
//   streamingContent: string
//   setActiveConversationId: (id: string | null) => void
//   setIsStreaming: (v: boolean) => void
//   setCurrentModel: (model: string) => void
//   setAbortController: (ctrl: AbortController | null) => void
//   setMessages: (msgs: Message[]) => void
//   appendMessage: (msg: Message) => void
//   setStreamingContent: (content: string) => void
//   appendStreamingContent: (chunk: string) => void
//   clearStreamingContent: () => void
//   stopStream: () => void
// }
//
// export const useChatStore = create<ChatStore>((set, get) => ({
//   activeConversationId: null,
//   isStreaming: false,
//   currentModel: DEFAULT_MODEL,
//   abortController: null,
//   messages: [],
//   streamingContent: '',
//
//   setActiveConversationId: (id) => set({ activeConversationId: id }),
//   setIsStreaming: (v) => set({ isStreaming: v }),
//   setCurrentModel: (model) => set({ currentModel: model }),
//   setAbortController: (ctrl) => set({ abortController: ctrl }),
//   setMessages: (msgs) => set({ messages: msgs }),
//   appendMessage: (msg) => set((s) => ({ messages: [...s.messages, msg] })),
//   setStreamingContent: (content) => set({ streamingContent: content }),
//   appendStreamingContent: (chunk) =>
//     set((s) => ({ streamingContent: s.streamingContent + chunk })),
//   clearStreamingContent: () => set({ streamingContent: '' }),
//   stopStream: () => {
//     const ctrl = get().abortController
//     if (ctrl) ctrl.abort()
//     set({ isStreaming: false, abortController: null })
//   },
// }))
//
