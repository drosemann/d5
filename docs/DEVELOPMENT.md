# Development

No installs or builds were run while creating this layout.
An implementer picks up here.

## Local dev (SQLite)

1. Copy `.env.example` to `.env`.
2. Install deps and push the schema.
3. Start the dev server and open `http://localhost:3000`.

## Prod (MariaDB)

1. Start `docker-compose.yml` (app + MariaDB 10.5).
2. Set `DATABASE_URL` to the MariaDB connection string.
3. Run migrations and seed demo content:
   users, categories (Hosting, Minecraft/ShadowUnity, AI, Off-Topic),
   sample threads and posts.

## Where ported logic lives

- Data model: [prisma/schema.prisma](../prisma/schema.prisma).
- Donor checklist: [docs/ARCHIVE.md](./ARCHIVE.md).
- Next ports, in order: forum core (threads, nested comments, votes),
  blog workflow (`draft → scheduled → published → archived`),
  admin panel, auth hardening (NextAuth roles `user | mod | admin`).
