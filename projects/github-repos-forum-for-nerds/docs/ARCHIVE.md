# Archive: what happened to each legacy project

All paths below are relative to the repo root, inside `Blog, CMS & Community Platforms/`.

## Merged into the new codebase

- `blog-forum-with-z.ai/` — **Base.** Next.js 15 + Prisma + NextAuth scaffold.
  Its `prisma/schema.prisma` is now [prisma/schema.prisma](../prisma/schema.prisma).
  Its dependency list was pruned into [package.json](../package.json).
- `BlogForge/` — **Feature donor.** Flask/MariaDB blog.
  Ported as rules, not code: post workflow (`draft → scheduled → published → archived`),
  slug/SEO conventions, Markdown posts, image uploads. See `Post.status` in the schema.
- `Forumino/` — **UX donor.** Vite + Convex forum (`ForumView.tsx`, `convex/forum.ts`).
  Ported as behavior: threads with pinned/locked flags, nested replies, votes.
  The Convex backend (`patient-rat-995`) was intentionally dropped for self-hosted Prisma.
- `nextjs-blog/` — **Content donor.** MDX blog pipeline (gray-matter, remark-gfm).
  Reuse for rendering `Post.content` as Markdown/MDX.
- `blog-website-frontend---backend/` — **Admin checklist donor.**
  PHP admin (`admin.php`, `api/articles.php`) informs the admin panel scope only.
- `blog website (modern ui, admin panel)/` — **Admin UX donor.**
  Its admin templates (`dashboard`, `create_post`, `edit_post`) inform the admin UI only.

## Deleted or dropped

- `blog-forum-z.ai/` — Near-duplicate of `blog-forum-with-z.ai`. Diff before deleting.
- `blog/` — Duplicate Node blog plus an embedded `nextjs-blog/` copy. Dropped.
- `blog html, css, javascript and php for backend/` — Vanilla PHP experiment. Dropped.
- `modern-blog-website/` — Static HTML prototype. Dropped.
- `LICENSE` files (`blog/`, `blog html, .../`) — still present on disk.
  The author was the sole contributor; deletion is pending his approval.

## Explicitly NOT merged (sibling projects, separate repos)

- `forgecms` — Flask blog/CMS with MariaDB. Cousin of BlogForge, stays independent.
- `infra-pilot` — Docker-native infrastructure control plane. Unrelated domain.
- `streuland` — Minecraft Paper plugin. Unrelated domain.
- `aktienwerk` — SEC data + SQLite SSR app. Unrelated domain.
- `drosemann` — Profile repo with the author's hosting history (`hosting-club.de` context).

## Secrets note for maintainers

`BlogForge/.env` and `Forumino/.env.local` exist in the legacy tree.
Never copy them into the new app. Never commit a real `.env`.
Use [.env.example](../.env.example) instead.
