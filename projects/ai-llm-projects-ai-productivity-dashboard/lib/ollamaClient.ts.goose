// Goose-Port-Spiegel von: projects/ai-llm-projects-ai-productivity-dashboard/lib/ollamaClient.ts
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/ai-llm-projects-ai-productivity-dashboard/lib/ollamaClient.ts");
}

// ---- Original-Code (projects/ai-llm-projects-ai-productivity-dashboard/lib/ollamaClient.ts), unveraendert, als Inline-Doku ----
// const OLLAMA_URL = process.env.NEXT_PUBLIC_OLLAMA_URL ?? 'http://localhost:11434'
// export const DEFAULT_MODEL = process.env.NEXT_PUBLIC_DEFAULT_MODEL ?? 'llama3.2'
//
// export async function fetchOllamaModels(): Promise<{ name: string; modified_at: string; size: number }[]> {
//   try {
//     const res = await fetch(`${OLLAMA_URL}/api/tags`)
//     if (!res.ok) throw new Error('Failed to fetch models')
//     const data = await res.json()
//     return data.models ?? []
//   } catch {
//     return []
//   }
// }
//
// export interface OllamaChatMessage {
//   role: 'user' | 'assistant' | 'system'
//   content: string
// }
//
// export async function* streamOllamaChat(
//   messages: OllamaChatMessage[],
//   model: string,
//   signal?: AbortSignal
// ): AsyncGenerator<string> {
//   const res = await fetch(`${OLLAMA_URL}/api/chat`, {
//     method: 'POST',
//     headers: { 'Content-Type': 'application/json' },
//     body: JSON.stringify({ model, messages, stream: true }),
//     signal,
//   })
//
//   if (!res.ok || !res.body) throw new Error('Ollama unavailable')
//
//   const reader = res.body.getReader()
//   const decoder = new TextDecoder()
//
//   while (true) {
//     const { done, value } = await reader.read()
//     if (done) break
//     const chunk = decoder.decode(value, { stream: true })
//     const lines = chunk.split('\n').filter(Boolean)
//     for (const line of lines) {
//       try {
//         const parsed = JSON.parse(line)
//         if (parsed.message?.content) {
//           yield parsed.message.content
//         }
//       } catch {
//         // skip malformed lines
//       }
//     }
//   }
// }
//
