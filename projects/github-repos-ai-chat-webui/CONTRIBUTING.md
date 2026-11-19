# Contributing Guidelines

Thanks for your interest in contributing to AI Chat WebUI.

## Getting started
1. Fork the repository.
2. Create a branch from `main` for your change.
3. Install dependencies with `npm install`.
4. Copy `.env.example` to `.env` and adjust values if needed.

## Development workflow
- Keep changes focused and minimal.
- Preserve existing behavior unless a fix/refactor explicitly requires change.
- Prefer configuration as the source of truth.
- Update documentation when changing behavior, setup, or configuration.

## Code style
- Follow the current JavaScript style in the repo.
- Avoid introducing unnecessary frameworks or tooling.
- Do not commit generated artifacts or `node_modules/`.

## Commit and pull requests
- Use clear, descriptive commit messages.
- In pull requests, include:
  - What changed
  - Why it changed
  - How it was tested
  - Any known limitations

## Reporting issues
When opening an issue, include:
- Steps to reproduce
- Expected vs actual behavior
- Relevant logs/screenshots
- Environment details (OS, Node version, Ollama version)


## Binary files
- Pull requests should not include generated binary files or release artifacts.
- Remove accidental binary additions before pushing:
  ```bash
  git rm --cached <path-to-binary>
  ```
- Keep the repository focused on source code, configuration, and documentation.
- See `docs/BINARY_FILES.md` for the PR binary-file policy used by this project.

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
