# Contributing to Stranded Horizons

Thank you for your interest in contributing.

## Getting Started

1. Fork the repository and create a feature branch from `main`.
2. Keep changes focused and easy to review.
3. Run local checks before opening a pull request.

## Development Guidelines

- Preserve existing gameplay behavior unless a change is intentional and documented.
- Use clear naming and small, maintainable functions.
- Update documentation when behavior or setup changes.
- Keep the repository source-focused (no generated binaries, logs, or build artifacts).

## Pull Request Checklist

- [ ] Code is readable and scoped to the issue.
- [ ] Asset and file paths are valid.
- [ ] README/docs updated if needed.
- [ ] No secrets or unnecessary generated files added.

## Commit Messages

Use concise, descriptive commit messages (for example: `docs: refresh README and contribution guides`).

## Reporting Issues

When opening an issue, include:

- browser and version
- reproduction steps
- expected behavior
- actual behavior
- screenshots or console errors (if available)

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
