# forum-for-nerds

> Forum #N — after `hosting-club.de` and nine blog attempts, everything finally
> lives in one repo. A nerd forum with a blog attached. Or a blog with a forum
> attached. Depends who you ask. (Okay, maybe a few excuses remain.)

**Stack:** Next.js 15 · TypeScript · Prisma · SQLite (dev) / MariaDB (prod) · Docker

---

## Table of contents

- [Why does this exist?](#why-does-this-exist)
- [What is this? / What is this not?](#what-is-this--what-is-this-not)
- [Features](#features)
- [Quickstart](#quickstart)
- [Project structure](#project-structure)
- [Data model](#data-model)
- [The 10 predecessors](#the-10-predecessors)
- [Sibling projects (not merged)](#sibling-projects-not-merged)
- [Roadmap for the implementing agent](#roadmap-for-the-implementing-agent)
- [FAQ](#faq)
- [License](#license)

---

## Why does this exist?

The author has been running game servers and hosting projects since 2018:
the ShadowUnity Minecraft server (`play.shadowunity.de`, no reset since 2022),
a stint running the DMH Network with friends, and — relevant here —
`hosting-club.de`, a former hosting forum.

The road to this repo went through Aternos, Ploudos, Minehub (closed),
DeinServerHost, Strato, Host-Unlimited, LuxVPS, Mine-Hoster, a one-month
ST-Hosting episode (their LXC setup didn't cut it), an HT-Hosting insolvency
that forced a migration under time pressure, and Index Hosting until their
AM EPYC range got discontinued. Along the way, Vercel and Kinsta were tested
(best developer experience, but self-hosting wins on price in the long run).
At times three or four servers ran in parallel as dev, failover, and main
systems.

Every one of those eras produced a forum or blog attempt. Ten of them ended
up in one folder. This repo merges all ten into a single codebase so the next
attempt starts from one place instead of ten. The long-term goal is an IT
company for hosting, infrastructure, and consulting built on the same
philosophy: pure Docker and KVM instead of generic root servers.

Self-hosting is the point. No heavyweight PaaS, no hosted-backend lock-in,
no WordPress with an Impressum-shaped sword hanging over it.

## What is this? / What is this not?

**Is:**

- One self-hosted forum plus blog in a single Next.js codebase.
- SQLite for zero-config local dev, MariaDB in production via `DATABASE_URL`.
- Pure Docker deployment (`docker-compose.yml` ships app + MariaDB 10.5).
- Threads with categories, pinned/locked/trending flags, nested comments,
  and per-user voting.
- Blog posts with a real editorial workflow:
  `draft → scheduled → published → archived`, plus slugs, tags, Markdown,
  and featured posts.
- Role-based auth (`user | mod | admin`) and an admin panel.

**Is not:**

- Not a Discourse or Discord replacement. It is smaller on purpose.
- Not a SaaS product. It runs on your own VPS.
- Not the 11th fresh start. (Technically it is. But this time there is an
  archive, so it counts as maintenance.)

## Features

### Forum

- Categories (e.g. Hosting, Minecraft/ShadowUnity, AI, Off-Topic).
- Threads with `pinned`, `locked`, and `trending` flags, view and vote
  counters, and a `lastReply` timestamp for sorting.
- Nested comments: every comment can reply to a thread, a post, or another
  comment (`parentId` self-relation).
- Voting with value `+1`/`-1`, unique per user and target, so nobody can
  upvote the same post twice.
- Locked threads reject new replies; pinned threads sort first.

### Blog

- Editorial workflow per post: `draft`, `scheduled` (with `publishDate`),
  `published`, `archived`. Unpublished posts stay invisible to readers.
- SEO-friendly slugs, excerpts, tags, categories, and `featured` posts.
- Markdown/MDX content rendering (pipeline inherited from `nextjs-blog`).
- View and vote counters shared with the forum logic.

### Accounts and admin

- Registration and login via NextAuth; roles `user`, `mod`, `admin`.
- Admin panel scope inherited from two legacy admin UIs: dashboard,
  create/edit post, pin/lock threads, manage users.
- Avatars and per-post images; uploads live under `public/uploads/`
  (git-ignored, see [.gitignore](./.gitignore)).

## Quickstart

You need Node 22+ and, for prod, Docker.

**Local dev (SQLite, no Docker needed):**

1. Copy `.env.example` to `.env` (defaults already point at `file:./dev.db`).
2. Install dependencies.
3. Push the Prisma schema to create `dev.db`.
4. Start the dev server and open `http://localhost:3000`.

**Production (MariaDB via Docker):**

1. Set `DATABASE_URL` to the MariaDB connection string
   (see [.env.example](./.env.example)).
2. Bring up `docker-compose.yml` — app plus MariaDB 10.5 with a persistent
   `mariadb-data` volume.
3. Run migrations and the seed script: demo users, the four categories,
   and sample threads and posts.

Details, including the porting order for the implementing agent, are in
[docs/DEVELOPMENT.md](./docs/DEVELOPMENT.md).

## Project structure

- [prisma/schema.prisma](./prisma/schema.prisma) — canonical data model:
  `User`, `Post`, `Thread`, `Comment`, `Tag`, `Vote`.
- [package.json](./package.json) — pruned Next.js 15 + Prisma + NextAuth
  dependency set (the ~70-dep scaffold list was cut down to what the forum
  actually uses).
- [docker-compose.yml](./docker-compose.yml) — app + MariaDB 10.5.
- [.env.example](./.env.example) — every required variable, no real secrets.
- [docs/ARCHIVE.md](./docs/ARCHIVE.md) — per-repo fate table: what was merged,
  repurposed, dropped, or kept, plus the secrets warning.
- [docs/DEVELOPMENT.md](./docs/DEVELOPMENT.md) — setup and porting order.
- `Blog, CMS & Community Platforms/` — the ten legacy donors, untouched.
  Read-only reference until the merge ports are done, then deleted.

## Data model

The schema is reused verbatim from `blog-forum-with-z.ai` and covers both
halves of the app:

- `User` — email (unique), name, avatar, bio, `role`, timestamps.
- `Post` — title, content, excerpt, `published`/`featured` flags, `status`
  workflow field, `publishDate` for scheduled posts, tags, category,
  vote/view counters.
- `Thread` — title, content, category, `pinned`/`locked`/`trending` flags,
  vote/view counters, `lastReply`, free-form `tags`.
- `Comment` — attaches to a post, a thread, or a parent comment, so one
  table serves forum replies, blog comments, and nested threads.
- `Tag` — unique names, related to posts.
- `Vote` — one row per user per target (`@@unique` on each target pair),
  value `1` or `-1`.

If threads outgrow the free-text `category` field, promote it to a real
`Category` model. That is the one sanctioned schema change; everything else
should be proven necessary first.

## The 10 predecessors

Every folder below lived in `Blog, CMS & Community Platforms/`. Full
provenance, including what exactly was salvaged from each, is in
[docs/ARCHIVE.md](./docs/ARCHIVE.md).

| # | Legacy folder | Stack | Fate |
|---|---|---|---|
| 1 | `blog-forum-with-z.ai` | Next.js 15, TS, Prisma 6, SQLite, NextAuth, Tailwind 4, shadcn/ui | **Base.** Schema and scaffold reused; deps pruned |
| 2 | `blog-forum-z.ai` | Same scaffold family | Duplicate — diff against #1, then delete |
| 3 | `Forumino` | Vite + React 19 + Convex (`patient-rat-995`) | **UX donor.** Thread/reply/vote behavior ported; Convex backend dropped |
| 4 | `BlogForge` | Flask 3, SQLAlchemy, MariaDB, Bootstrap | **Rules donor.** `draft → scheduled → published → archived`, slugs, Markdown, uploads |
| 5 | `nextjs-blog` | Next.js 14 SSG, MDX, gray-matter | **Content donor.** MDX rendering pipeline for posts |
| 6 | `blog-website-frontend---backend` | Raw PHP admin + API, Next.js frontend | **Scope donor.** Admin panel feature list only |
| 7 | `blog website (modern ui, admin panel)` | Python templates, admin dashboard | **UX donor.** Admin dashboard/create/edit flows |
| 8 | `blog` | Node `server.js` + embedded `nextjs-blog` copy | Duplicate — dropped |
| 9 | `blog html, css, javascript and php for backend` | Vanilla HTML/CSS/JS + PHP | Experiment — dropped |
| 10 | `modern-blog-website` | Static HTML prototype | Prototype — dropped |

Why the Convex backend (#3) was dropped: it ties the forum to a hosted
deployment (`patient-rat-995`), which contradicts the whole point of this
repo — self-hosted, pure Docker, your own database. The forum *behavior*
was worth porting; the backend was not.

Why Flask and PHP (#4, #6, #7) were not kept as stacks: they are superseded
attempts at the same app, each with its own half-finished auth and admin.
Their editorial and admin *ideas* survived; their runtimes did not.

## Sibling projects (not merged)

Separate repos, separate domains, deliberately untouched:

- `forgecms` — Flask blog/CMS with MariaDB. A cousin of BlogForge with its
  own history; stays independent.
- `infra-pilot` — Docker-native infrastructure control plane (fleet
  management, monitoring, remediation). Different domain entirely, and the
  vehicle for the long-term company plan.
- `streuland` — Paper Minecraft plugin for natural plots. Different domain.
- `aktienwerk` — SEC filings + prices + plain-German explanations, stdlib
  Python + SQLite. Different domain; also the role model for the
  keep-it-simple dependency policy applied here.
- `drosemann` — profile repo holding the hosting history this README's
  backstory comes from, including the `hosting-club.de` era.

## Roadmap for the implementing agent

In order, each a committable unit:

1. **Boot the base.** Scaffold from #1 installs, `prisma db push` creates
   SQLite, seed script inserts demo content, app renders.
2. **Forum core.** Categories, threads (pin/lock/trending), nested comments,
   votes with uniqueness enforced.
3. **Blog.** Workflow states, slugs, Markdown/MDX rendering, featured posts.
4. **Admin.** Dashboard, post create/edit, pin/lock, user roles.
5. **Auth hardening.** NextAuth roles `user | mod | admin`; anonymous-auth
   concepts from the Convex era stay dead.
6. **Prune and clean.** Drop unused scaffold deps, verify no secrets, no
   nested `.git` dirs, no `venv`/`node_modules` in the tree.
7. **Delete the donors.** Remove `Blog, CMS & Community Platforms/` only
   after steps 1–6 are verified working.

## FAQ

**Why not WordPress/Discourse?**
Same answer as ever: too heavy for one nerd's forum, and in Germany a blog
without an Impressum is a legal incident waiting to happen. Small,
self-hosted, no overhead.

**Why SQLite *and* MariaDB?**
SQLite means a contributor is one file away from a running dev setup.
MariaDB is what actually runs in production — the author has years of
productive MariaDB experience. Prisma makes the switch a `DATABASE_URL`.

**Where did `hosting-club.de` go?**
It was a former hosting forum from an earlier era. Its spirit lives on as
the default Off-Topic category.

**Can I contribute?**
Yes — once the base boots (roadmap step 1). Until then, read
[docs/DEVELOPMENT.md](./docs/DEVELOPMENT.md) and pick a roadmap step.

## License

MIT, effective 2026-10-24 for this and all future releases
(see [LICENSE](./LICENSE), copyright Daniel Rosemann).
Before that date no license was granted.

Two legacy `LICENSE` files (MIT, 2024) still sit inside the legacy folders
and are untouched. The `nextjs-blog` reference was removed on 2026-10-24:
it pointed at a third-party repository, was added by accident, contributed
no files to this tree, and is therefore not covered by this license.

<!-- ZIMBU-PORT -->
## Zimbu-Port

Dieses Projekt ist mechanisch nach [Zimbu](https://moolenaar.net/z/zimbu/spec/zimbu.html)
(Bram Moolenaar) gespiegelt: Jede Code-Datei hat eine <name>.<ext>.zimbu-Schwester
mit Zimbu-Modulgeruest (MODULE/FUNC Main) und dem VOLLSTAENDIGEN Original-Code
als #-Inline-Doku. Kein Original-Code wurde geloescht oder veraendert.
Die .zimbu-Dateien sind mechanische Spiegel (80/20: Geruest steht, Logik-Port
per Hand verfeinern). Stand: 2026-11-12.

<!-- GOOSE-PORT -->
## Goose-Port

Dieses Projekt ist mechanisch nach [Goose](https://github.com/aardappel/goose)
(aardappel/goose v2026.4) gespiegelt: Jede Code-Datei hat eine <name>.<ext>.goose-Schwester
mit gueltigem Goose-Programmgeruest (n main()/print, pruefbar mit goose check)
und dem VOLLSTAENDIGEN Original-Code als //-Inline-Doku. Kein Original-Code wurde
geloescht oder veraendert. Die .goose-Dateien sind mechanische Spiegel (Geruest steht
und kompiliert, Logik-Port per Hand verfeinern). Stand: 2026-11-16.
