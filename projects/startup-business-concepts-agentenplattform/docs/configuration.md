# Konfiguration & Agenten & Fehlersuche
- **Agenten**: 21 Registry-Einträge mit deutschem Systemprompt und erlaubten Tools; Ausführung läuft über Ollama/OpenAI-kompatible Provider via Gateway (Systemprompt + Tool-Calls, serverseitig geprüft, max. 10/Auftrag).
- **Modell-Gateway**: Profile pro Agent (`PUT /api/v1/model-profiles/{id}`), Modellliste (`GET /api/v1/providers/{id}/models`), Verbindungstest (`POST .../test`).
- **API**: Freigaben anlegen/entscheiden, Benachrichtigungen, Datei-Upload (typ-/größengeprüft), Finance-CSV-Import, Health-Messwerte, Standort-Verlauf, Runs, Einstellungen, eigene API-Keys, Systemstatus (`/api/v1/system/status`), OpenAI-Fassade (`agent-<id>`, Standard aus).
- **Konfiguration**: `.env` (siehe `.env.example`); Secrets als Dateien; Aufbewahrungsfristen und Kontakte in Einstellungen.
- **Agenten**: 21 Registry-Einträge (`registry.py`), Details in `config/agents/`; Deaktivieren stoppt neue Jobs; Safety/SOS deterministisch.
- **Modell-Provider**: Ollama/OpenAI/kompatibel mit Capabilities; Schlüssel nur als „gesetzt"-Flag; Verbindungstest in Einstellungen.
- **E-Mail**: ein Postfach, Absender-Allowlist, Präfixe, 15-MB-Limit; Versand standardmäßig aus.
- **E-Mail-Eingang**: IMAP-Abruf (`MAIL_IMAP_*`, alle 5 Min via Scheduler oder `POST /api/v1/mail/fetch`); Idempotenz per UID-Merker; Unbekannte werden als gesehen markiert + Event.
- **Versand**: `POST /api/v1/notifications/dispatch` bzw. Scheduler alle 2 Min; Mail nur an `MAIL_ALLOWLIST` mit SMTP + Aktivierung; Push nur mit `VAPID_PRIVAT`; Rest „suppressed" mit Grund.
- **Schule/Verkehr/News**: Stundenplan-CSV (`POST /api/v1/school/stundenplan`), Störungscheck (`POST /api/v1/mobility/check`, Demo/JSON), RSS-Import (`POST /api/v1/technews/import`).
- **Coding**: Workspace via `CODING_REPO_PFAD`, Branch + Patch + pytest/ruff-Bericht, nur mit Freigabe, kein Auto-Merge (`POST /api/v1/coding/prepare`).
- **Kalender**: `GET/POST/DELETE /api/v1/calendar`; Agenten-Tool `kalender.eintragen` nur mit Freigabe (planner/school).
- **Backups**: `infra/backup/backup.sh` (restic: DB-Dump + uploads + config, 7-Tage/4-Wochen), `restore.sh` (Snapshots/Restore nach /tmp + manuelle DB-Prüfung); ohne Ziel Status „nicht konfiguriert".
- **Monitoring**: `compose.monitoring.yaml` (Profil `monitoring`), Prometheus scrapt `/api/v1/system/metrics`.
- **Android**: Quellen in `apps/android-safety/app/` (Service, Queue, Manifest, Gradle); Build in Android Studio, kein Versprechen ohne SDK-Build.
- **Fehlersuche**: `/health/live`, `/health/ready`; JSON-Logs; Providerstatus in Einstellungen; verwaiste Jobs als `failed` markiert.

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
