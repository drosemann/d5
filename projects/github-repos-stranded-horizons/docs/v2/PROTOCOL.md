# v2 socket protocol (v1)

Auth: Supabase JWT in handshake `auth.token`. Server rejects unauthenticated sockets.
Client -> server intents only; server never trusts client-computed resources/positions.

- `chunk:get` -> `{ ok, base } | { ok:false, error }`
- `place { grid_x 0-19, grid_y 0-19, type }` -> `{ ok } | insufficient_resources | occupied | out_of_bounds | unknown_building`
- `booster:activate` -> `{ ok, expires_at } | insufficient_credits | already_active | on_cooldown`
- `link:request { targetBaseId }` -> `{ ok } | self_link | unknown_base`
- `link:confirm { otherBaseId, accept }` -> `{ ok } | no_pending_link`
- `admin:cmd { line }` (admin allowlist only) -> `{ ok, ran, args } | forbidden`
  - `:tp x y`, `:give <resource> <amount>`, `:place <type>`; every call -> admin_audit.
- Server fan-out: Redis `chunk:update` (reload hint; MariaDB is the truth).

Versions: every message carries protocol v1; unknown versions are rejected.

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
