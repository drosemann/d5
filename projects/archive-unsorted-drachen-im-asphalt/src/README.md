# Technische Übersicht (`src/`)

Diese Datei beschreibt die interne Struktur des Spiels **Drachen im Asphalt**.

## Modulstruktur

- `src/main.py` – CLI-Einstiegspunkt und Hauptspielschleife
- `src/game/` – Rendering, Session-Steuerung, Kommandologik, Persistenz
- `src/characters/` – Protagonist und Dragon/Boss-Logik
- `src/missions/` – Missionen, Mission Manager, Mission-Giver
- `src/districts/` – Bezirksdaten und Bezirksverwaltung
- `src/story/` – Kapitel, Konsequenzen und Journal
- `src/effects/` – Drogeneffekte und Halluzinationssystem
- `src/items/` – Item-/Waffenmodelle
- `src/ui/` – Textdarstellung/Lesemodus

## Architekturprinzipien

- Möglichst klare Trennung zwischen Story-, Domänen- und Laufzeitlogik
- Datenpersistenz über JSON statt proprietärer Formate
- Keine Build-Artefakte im Repository

## Testbezug

Tests liegen unter `tests/` und prüfen insbesondere:

- Architektur-Integrität
- Save/Load-Flows

Ausführung aus Repo-Root:

```bash
PYTHONPATH=. pytest -q
```

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
