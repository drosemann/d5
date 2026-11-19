// Goose-Port-Spiegel von: projects/personal-&-client-websites-portfolio/app/layout.tsx
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/personal-&-client-websites-portfolio/app/layout.tsx");
}

// ---- Original-Code (projects/personal-&-client-websites-portfolio/app/layout.tsx), unveraendert, als Inline-Doku ----
// import { ThemeProvider } from "@/components/theme-provider"
// import { cn } from "@/lib/utils"
// import type { Metadata } from "next"
// import { Inter } from "next/font/google"
// import "./globals.css"
// import type React from "react" // Import React
//
// const inter = Inter({ subsets: ["latin"] })
//
// export const metadata: Metadata = {
//   title: "John.dev - Full Stack Developer",
//   description: "Full stack developer portfolio showcasing projects and skills",
//     generator: 'v0.app'
// }
//
// export default function RootLayout({
//   children,
// }: {
//   children: React.ReactNode
// }) {
//   return (
//     <html lang="en" suppressHydrationWarning>
//       <body className={cn("min-h-screen bg-background font-sans antialiased", inter.className)}>
//         <ThemeProvider attribute="class" defaultTheme="system" enableSystem disableTransitionOnChange>
//           {children}
//         </ThemeProvider>
//       </body>
//     </html>
//   )
// }
//
