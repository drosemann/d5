# Installation (Ubuntu Server LTS, bewusst durch Besitzer)
1. `.env.example` nach `.env` kopieren, Secrets setzen.
2. `docker compose up --build -d`
3. PWA: `http://SERVER/`; API: `/docs` (nur intern/dev).
4. HTTPS: Domain in `infra/caddy/Caddyfile` eintragen, Ports 80/443 nur für Caddy.
5. Backup: `infra/backup/backup.sh` nach Restic-Konfiguration einplanen.
# API (Auszug)
- `GET /health/live`, `GET /health/ready`, `POST /api/v1/auth/login`
- `GET/POST /api/v1/tasks`, `GET /api/v1/agents`, `GET /api/v1/events`
- `GET/POST /api/v1/providers` (Schlüssel nie im Klartext zurück), `POST /api/v1/location`, `POST /api/v1/safety/sos` (idempotent, Testmodus)
- Fassade `GET /v1/models` nur mit eigenem Key, Standard: aus.
# Modell-Provider & E-Mail & Betrieb
- Provider: Ollama (`http://ollama:11434/v1`), OpenAI, kompatibel – mit Capabilities, Timeout/Retry, Verbindungstest.
- E-Mail: ein Postfach, strikte Absenderprüfung, Präfixe `@finance/@youtube/@planner`, Anhangslimits, kein Versand ohne Freigabe.
- Betrieb: JSON-Logs, Korrelations-IDs, Worker-Heartbeat, Backup-Status; Fehler nie als Erfolg ausgeben.

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
