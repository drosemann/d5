# aktienwerk

> Automatisiert SEC-Meldungen, Kurse und verständliche Erklärungen für 100 große US-Unternehmen. Nur Python Standardbibliothek + SQLite, serverseitig gerendert.

Kein Bloomberg Terminal Clone, keine Anlageberatung, kein Node.js Dependency Hell. Einfach SEC EDGAR + Kurse + optional KI-Erklärung auf Deutsch.

### Entstehung

Ursprünglich bin ich auf die Idee wegen Bloomberg Terminal gekommen – alles überall an einem Ort. Dann schnell realisiert: Macht keinen Sinn, weil nur Bloomberg wirklich alle Daten hat. Idee abgewandelt: Fokus auf das was öffentlich geht – SEC EDGAR + Kurse + Transkripte – und daraus was verständliches bauen ohne 20 Python Pakete.

Deshalb auch nur stdlib + SQLite, bewusst simpel.

### Was ist das? / Was ist das nicht?

**Ist:** Automatischer Worker der SEC + Yahoo Finance Chart + optional FMP Transkripte + optional Ollama für Erklärungen zieht, in `data/aktienwerk.sqlite3` speichert und als schnelle SSR Seiten + JSON API + Sitemap + Schema.org ausliefert.

**Ist nicht:** Keine Echtzeit-Börse, keine garantierten Kurse (Yahoo kann verzögert sein), keine Anlageberatung. Automatische Erklärungen können Fehler enthalten – Originalmeldung ist maßgeblich.

### Features / Zweck

- **Nur stdlib + SQLite** – kein pip install Wahnsinn, läuft überall mit Python 3.11+
- **SEC EDGAR** – Firmenzuordnung, Ticker-Resolve, neue Primärmeldungen mit Form, Datum, Originallink
- **Yahoo Finance Chart** – tägliche Schlusskurse, >3% Move = Event
- **FMP (optional)** – Earnings Call Transkripte wenn `FMP_API_KEY` gesetzt
- **Ollama (optional)** – lokal deutsche Erklärungen, Prompt fordert einfache Sprache, trennt Fakten/Vermutung, keine Empfehlung. Ohne Ollama: regelbasierte vorsichtige Zusammenfassung + Log
- **SSR + SEO** – `/` Übersicht mit Suche, `/aktie/AAPL` indexierbar mit FAQ-/Corporation Schema, `/api/stocks`, `/api/events`, `/sitemap.xml`, `/robots.txt`, `/health`
- **Resilient** – einzelner Quellen-Ausfall wird im Worker-Log geloggt, Rest läuft weiter

### Installation

**Voraussetzungen:**
- Python 3.11+
- Keine extra Pakete

```powershell
Copy-Item .env.example .env
python -m app init
python -m app serve
```

Öffne `http://localhost:8080`. In zweitem Terminal Worker starten:

```powershell
python -m app.worker
# einmalig:
python -m app.worker --once
```

### Konfiguration

In `.env`:

- `SITE_URL` – für korrekte Canonical + Sitemap auf deine Domain setzen
- `SEC_USER_AGENT` – Pflicht für SEC, identifizierbar mit Kontaktadresse (z.B. `Aktienwerk/1.0 contact@d5niel.de`)
- `AKTIENWERK_DATA_DIR` / `AKTIENWERK_DATABASE` – Speicherort, default `data/aktienwerk.sqlite3`
- `OLLAMA_URL` / `OLLAMA_MODEL` – wenn Ollama als separater Service im Docker Netzwerk läuft
- `FMP_API_KEY` – optional für Transkripte, ohne Key werden keine geladen

Auf Prod den Worker als dauerhaften Dienst laufen lassen.

### Datenquellen und Aktualisierung

- **SEC EDGAR:** öffentliche Zuordnung + aktuelle Filings. Textuell erfasst, in SQLite.
- **Yahoo Finance:** Schlusskurse, nicht garantiert/verzögert.
- **FMP:** nur mit Key.
- **Ollama:** lokal, deutsche Erklärung.

Nutzungsbedingungen + Aktualität jeder Quelle beachten.

### Seiten und API

- `/` – Übersicht + Suche + aktuelle Events
- `/aktie/AAPL` – Aktienseite mit Kurs, Meldungen, Quellen, Schema.org
- `/api/stocks`, `/api/stocks/AAPL`, `/api/events` – JSON
- `/sitemap.xml`, `/robots.txt`, `/health`

Aktienliste ist Momentaufnahme S&P 100 in `app/universe.py` – Zusammensetzung ändert sich.

### Docker und Proxmox

```sh
cp .env.example .env
# SEC_USER_AGENT setzen!
docker compose up -d --build
```

Compose startet Webserver + Worker, teilen sich Volume `aktienwerk-data`. Port default `8080`. Ollama optional als extra Service.

**Deploy via GitHub Actions:** Secrets `DEPLOY_HOST`, `DEPLOY_USER`, `DEPLOY_SSH_KEY`, `DEPLOY_KNOWN_HOSTS` + Variable `DEPLOY_PATH` setzen. Zielsystem braucht Checkout unter `DEPLOY_PATH` + Docker-Compose Rechte. Push auf `main` updated + restartet, PRs validieren Python Syntax + bauen Image.

### Troubleshooting

- **SEC blockt:** `SEC_USER_AGENT` ohne Kontaktadresse? SEC will identifizierbaren Agent.
- **Keine Transkripte:** `FMP_API_KEY` fehlt – ist optional, dann einfach keine.
- **Keine KI Erklärungen:** `OLLAMA_URL` falsch oder Ollama nicht erreichbar – fällt zurück auf regelbasiert + loggt es.
- **DB nicht gefunden:** `AKTIENWERK_DATA_DIR` prüfen, Volume in Compose gemounted?
- **Kurse alt:** Yahoo verzögert / Rate-Limit – im Worker Log schauen.

### Lizenz

GNU Affero General Public License v3 – siehe [LICENSE](LICENSE).

Ich habe AGPL genommen weil ich mal was anderes als GPL 3 probieren wollte – wegen SaaS Falle etc. Bei GPL kann jemand den Code als Service hosten ohne Source zu teilen, bei AGPL muss er. Passt hier besser als bei meinen anderen Repos.