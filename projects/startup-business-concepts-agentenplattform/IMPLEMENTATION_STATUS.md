# IMPLEMENTATION_STATUS – Bestandsaufnahme & Lieferstand
- **Bestand zu Beginn**: leeres Repo (nur `plan.md`, `Agentenplattform.png`). Keine Technik zu übernehmen.
- **Umgesetzt**: FastAPI-Backend (`apps/backend/app/*`: Config, Logging, DB-Modelle alle Bereiche, Auth+Rate-Limit, Modell-Gateway Ollama/OpenAI/kompatibel+Mock, Agent-Registry 21 Agenten, Orchestrator-Routing/Status/Delegationsgrenze, Tools+SSRF, Mail-Prüfung, Markt-Ranking/Dedup, Safety-Validierung, API-Routen, Worker-Stub, Alembic-Init, Kerntests); PWA (React/TS, deutsch, 7 Bereiche, Leitstand-Look, PWA-Manifest); `compose.yaml`, Caddy, Backup-Skript, Android-Stub; Docs (Architektur, Sicherheit, Deployment/API/Provider/Mail/Betrieb).
- **Tests/Prüfungen**: nicht ausgeführt (Vorgabe: keine Ausführung ohne Freigabe; Tests unter `apps/backend/tests/`, Frontend-Build via `npm run build` vom Besitzer auszuführen).
- **Nicht konfiguriert**: echte Provider-Keys, Mailbox, Restic-Ziel, Domain/HTTPS, Android-Build.
- **Tests/Builds**: vom Besitzer explizit abgelehnt („nur Code") – daher bewusst unverifiziert; vor Inbetriebnahme `pytest`, `tsc --noEmit`/`vite build` ausführen.
- **Ausbau „alle" (code-only, unverifiziert)**: Worker führt queued Tasks via Gateway aus (Retry max. 3, Orphan-Erkennung, Run-Protokoll); Markt-Adapter (Demo + RSS mit SSRF-Schutz, idempotenter Import, Ranking) mit API `/api/v1/search-profiles`, `/api/v1/listings`, `/api/v1/listings/import`; Tagesplaner (harte Grenzen, Lücken, Puffer, Konflikte) mit API `/api/v1/plan/tagesplan`; PWA zeigt Tagesplan und Angebotsimport.
- **Vierer-Paket (code-only, unverifiziert)**: (1) alle 21 Agenten mit deutschem Systemprompt + erlaubten Tools; Runner schickt Systemprompt + Tool-Schemas ans Gateway, führt Tool-Calls serverseitig aus (`tools/executor.py`, max. 10, Freigabe-Ablauf für extern/kritisch); (2) Gateway mit Tool-Calls/JSON-Modus/Modellliste, Modellprofile pro Agent, Provider-Test; (3) API: Approvals, Notifications, Datei-Upload, Finance-CSV, Health, Standort-Verlauf, Runs, Settings, API-Keys, Systemstatus, OpenAI-Fassade `agent-<id>`; (4) System: Scheduler (Orphans, Backup-Check, Aufbewahrung, Demo-Import), Worker-Heartbeat, Systemstatus-Seite in PWA.
- **Achter-Paket (code-only, unverifiziert)**: IMAP-Eingang mit Routing; Versand (Mail-Allowlist/SMTP, Push/VAPID, Scheduler); Android-Kotlin-Gerüst; Adapter (Verkehr Demo/JSON, Stundenplan-CSV, Tech-News-RSS) + API; Coding-Workspace (Branch/Patch/pytest-Bericht, Freigabe, kein Auto-Merge); Kalender-API + `kalender.eintragen`-Tool; restic-Backup + Restore-Skript; Monitoring-Profil + echte Prometheus-Metriken; PWA: Kalender-Seite, echte Freigaben, Diagnose.
- **Bekannt**: Worker/Redis absichtlich schlank; Fassade standardmäßig aus; SOS/Mail im Testmodus.
- **Start (Besitzer)**: `.env` anlegen → `docker compose up --build -d` → PWA öffnen.

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
