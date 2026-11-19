// Goose-Port-Spiegel von: projects/github-repos-forum-for-nerds/Blog, CMS & Community Platforms/blog-forum-z.ai/src/lib/db.ts
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/github-repos-forum-for-nerds/Blog, CMS & Community Platforms/blog-forum-z.ai/src/lib/db.ts");
}

// ---- Original-Code (projects/github-repos-forum-for-nerds/Blog, CMS & Community Platforms/blog-forum-z.ai/src/lib/db.ts), unveraendert, als Inline-Doku ----
// import { PrismaClient } from '@prisma/client'
//
// const globalForPrisma = globalThis as unknown as {
//   prisma: PrismaClient | undefined
// }
//
// export const db =
//   globalForPrisma.prisma ??
//   new PrismaClient({
//     log: ['query'],
//   })
//
// if (process.env.NODE_ENV !== 'production') globalForPrisma.prisma = db
