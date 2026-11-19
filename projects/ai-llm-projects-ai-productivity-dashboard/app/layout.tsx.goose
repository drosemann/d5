// Goose-Port-Spiegel von: projects/ai-llm-projects-ai-productivity-dashboard/app/layout.tsx
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/ai-llm-projects-ai-productivity-dashboard/app/layout.tsx");
}

// ---- Original-Code (projects/ai-llm-projects-ai-productivity-dashboard/app/layout.tsx), unveraendert, als Inline-Doku ----
// import type { Metadata } from 'next'
// import { Geist, Geist_Mono } from 'next/font/google'
// import { Analytics } from '@vercel/analytics/next'
// import { Providers } from '@/components/providers'
// import './globals.css'
//
// const geist = Geist({
//   subsets: ['latin'],
//   variable: '--font-geist',
// })
// const geistMono = Geist_Mono({
//   subsets: ['latin'],
//   variable: '--font-geist-mono',
// })
//
// export const metadata: Metadata = {
//   title: 'ChiefOS — AI Productivity Dashboard',
//   description: 'A proactive AI chief of staff that works autonomously, surfaces decisions, and keeps your day moving.',
//   generator: 'v0.app',
// }
//
// export default function RootLayout({
//   children,
// }: Readonly<{
//   children: React.ReactNode
// }>) {
//   return (
//     <html lang="en" className={`${geist.variable} ${geistMono.variable} bg-background`}>
//       <body className="font-sans antialiased">
//         <Providers>
//           {children}
//         </Providers>
//         {process.env.NODE_ENV === 'production' && <Analytics />}
//       </body>
//     </html>
//   )
// }
//
