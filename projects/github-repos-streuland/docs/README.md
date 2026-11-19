# Documentation

This directory contains the technical documentation for the Streuland Plot Plugin.

## Contents

- `features/one-chunk-civilization.md` - clan system, chunk wars, wegpass, market stands, shafts
- `architecture/system-overview.md` - high-level runtime architecture and module map
- `architecture/code-walkthrough.md` - source-tree orientation and implementation notes
- `api/core-components.md` - core components and responsibilities
- `examples/command-flows.md` - end-user and admin command examples
- `plot-system-expansion.md` - feature expansion ideas and planning notes
- `maintenance/refactoring-notes-2026-02.md` - maintenance and refactoring notes

## Audience

- plugin maintainers
- contributors
- server administrators

## Documentation Contributions

Please submit documentation updates through pull requests. For major structural changes, open an issue first to discuss scope.

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
