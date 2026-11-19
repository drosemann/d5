# Android-Begleit-App (Kotlin, Foreground-Service, 10-Min-Intervall)
Quellen: `app/StandortService.kt`, `app/StandortQueue.kt`, `app/AndroidManifest.xml`, `app/build.gradle`.
- Registrierung + Geräte-Token an `/api/v1/location`; SOS an `/api/v1/safety/sos` (idempotent)
- Offline-Queue, Sync-Status („letzte Sync"), manueller SOS-Button (UI folgt im App-Modul)
- Registrierung + Gerätebindung an `/api/v1/location`
- SOS-Button → `POST /api/v1/safety/sos` mit Idempotenzschlüssel
- Lokale Warteschlange bei Offline, spätere Synchronisation
- Kein Tracking anderer Personen; nur eigenes, registriertes Gerät
- Build: Android Studio öffnen, `apps/android-safety` als Projekt laden

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
