# Contributing to Cooperating Screen

Thanks for your interest in contributing.

## Getting Started

1. Fork the repository and create a feature branch.
2. Keep changes focused and minimal.
3. Add or update documentation for behavior/configuration changes.
4. Run relevant checks before submitting.

## Development Checks

- Flutter app:
  - `cd cosc && flutter analyze`
  - `cd cosc && flutter test`
- Signaling server:
  - `cd signaling_server && npm run test` (placeholder script in current scaffold)

## Pull Request Guidelines

- Use clear commit messages.
- Describe what changed and why.
- Include testing notes and any known limitations.
- Avoid committing generated files, caches, logs, or secrets.

## Reporting Issues

When filing issues, include:
- environment details
- reproduction steps
- expected vs actual behavior
- relevant logs/errors

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
