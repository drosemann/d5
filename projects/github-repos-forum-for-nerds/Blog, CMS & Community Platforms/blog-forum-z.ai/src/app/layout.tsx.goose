// Goose-Port-Spiegel von: projects/github-repos-forum-for-nerds/Blog, CMS & Community Platforms/blog-forum-z.ai/src/app/layout.tsx
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/github-repos-forum-for-nerds/Blog, CMS & Community Platforms/blog-forum-z.ai/src/app/layout.tsx");
}

// ---- Original-Code (projects/github-repos-forum-for-nerds/Blog, CMS & Community Platforms/blog-forum-z.ai/src/app/layout.tsx), unveraendert, als Inline-Doku ----
// import type { Metadata } from "next";
// import { Geist, Geist_Mono } from "next/font/google";
// import "./globals.css";
// import { Toaster } from "@/components/ui/toaster";
//
// const geistSans = Geist({
//   variable: "--font-geist-sans",
//   subsets: ["latin"],
// });
//
// const geistMono = Geist_Mono({
//   variable: "--font-geist-mono",
//   subsets: ["latin"],
// });
//
// export const metadata: Metadata = {
//   title: "Z.ai Code Scaffold - AI-Powered Development",
//   description: "Modern Next.js scaffold optimized for AI-powered development with Z.ai. Built with TypeScript, Tailwind CSS, and shadcn/ui.",
//   keywords: ["Z.ai", "Next.js", "TypeScript", "Tailwind CSS", "shadcn/ui", "AI development", "React"],
//   authors: [{ name: "Z.ai Team" }],
//   openGraph: {
//     title: "Z.ai Code Scaffold",
//     description: "AI-powered development with modern React stack",
//     url: "https://chat.z.ai",
//     siteName: "Z.ai",
//     type: "website",
//   },
//   twitter: {
//     card: "summary_large_image",
//     title: "Z.ai Code Scaffold",
//     description: "AI-powered development with modern React stack",
//   },
// };
//
// export default function RootLayout({
//   children,
// }: Readonly<{
//   children: React.ReactNode;
// }>) {
//   return (
//     <html lang="en" suppressHydrationWarning>
//       <body
//         className={`${geistSans.variable} ${geistMono.variable} antialiased bg-background text-foreground`}
//       >
//         {children}
//         <Toaster />
//       </body>
//     </html>
//   );
// }
//
