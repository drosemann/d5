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
