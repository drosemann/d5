# Contributing to Drachen im Asphalt

Vielen Dank für dein Interesse am Projekt.

## Grundsätze

- Halte Änderungen klein, nachvollziehbar und fokussiert.
- Verändere keine Kernlogik ohne klaren Grund (Bugfix, Konsistenz, Wartbarkeit).
- Dokumentiere sichtbare Verhaltensänderungen im Pull Request.

## Entwicklungsablauf

1. Repository forken und Branch erstellen.
2. Entwicklungsumgebung einrichten (siehe `README.md`).
3. Änderungen umsetzen.
4. Tests lokal ausführen:
   ```bash
   PYTHONPATH=. pytest -q
   ```
5. Commit mit klarer Message erstellen.
6. Pull Request mit Motivation, Änderungen und Testnachweis öffnen.

## Code-Stil

- Folge dem bestehenden Python-Stil im Projekt.
- Nutze sprechende Namen und kleine Funktionen.
- Vermeide unnötige Abhängigkeiten.

## Tests

- Neue Funktionalität sollte durch Tests begleitet werden.
- Bestehende Tests dürfen nicht ohne Begründung entfernt werden.

## Dokumentation

Bei relevanten Änderungen bitte auch Dokumentation aktualisieren:

- `README.md` für Nutzerdokumentation
- `src/README.md` für Architektur-/Modulhinweise

## Melden von Fehlern

Bitte öffne ein Issue mit:

- erwartetes Verhalten
- tatsächliches Verhalten
- Reproduktionsschritten
- Umgebung (OS, Python-Version)

## Verhaltenskodex

Mit dem Beitragen stimmst du dem [`CODE_OF_CONDUCT.md`](CODE_OF_CONDUCT.md) zu.

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
