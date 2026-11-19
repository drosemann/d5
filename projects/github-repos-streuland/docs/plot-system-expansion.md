# Ausbauplan Plot-System

Dieses Dokument beschreibt den geplanten Ausbau des Plot-Systems in funktionale Pakete.

## 1. Zielbild

- Stabiler Kern für Plot-Erstellung und Schutz
- Erweiterbare Module für Wirtschaft, Freigaben, Biome und Upgrades
- Gute Operabilität durch Dashboard, Backups und Wartungstools

## 2. Priorisierte Ausbaustufen

### Stufe A – Stabilität
- Build-Pipeline stabil halten (`mvn clean package`)
- Tests für kritische Flows priorisieren (Plot erstellen/beanspruchen/schützen)
- Konfigurationsvalidierung beim Start verbessern

### Stufe B – Spielerfunktionen
- Team- und Vertrauensfunktionen erweitern
- Portal-/Warp-UX vereinheitlichen
- Marktangebote besser filtern (Preis, Standort, Kategorie)

### Stufe C – Progression
- Plot-Level sauber modellieren
- Biomeffekte balancieren
- Upgrades über Kosten-/Nutzen-Kurven abstimmen

### Stufe D – Betrieb
- Dashboard-Metriken standardisieren
- Backup-/Restore-Prozesse härten
- Refactoring- und Migrationsleitfäden pflegen

## 3. Qualitätskriterien

- Keine regressiven Änderungen an Schutzlogik
- Persistenz rückwärtskompatibel halten
- Neue Features nur mit Tests und Doku zusammen mergen

## 4. Offene Fragen

1. Welche Features sind für die nächste Release-Version zwingend?
2. Wie werden Datenmigrationen versioniert?
3. Sollen experimentelle Features über Feature-Flags steuerbar sein?

## 5. Arbeitsweise

- Für größere Änderungen zuerst ein Issue mit Lösungsskizze anlegen
- Danach Implementierung über Pull Request mit Testnachweis
- Abschluss mit aktualisierter Dokumentation in `README.md` und `docs/`

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
