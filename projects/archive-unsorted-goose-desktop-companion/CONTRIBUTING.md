# Contributing to Goose Desktop Companion

Thanks for your interest in contributing.

## Ground rules

- Keep changes focused and minimal.
- Preserve existing behavior unless a change is required for consistency, safety, or maintainability.
- Update documentation with any user-facing or workflow changes.
- Follow `CODE_OF_CONDUCT.md`.

## Development setup

1. Fork and clone the repository.
2. Create a branch from `main`.
3. Set up Python UI dependencies:
   ```bash
   cd goose-ui-python
   python -m venv .venv
   # Windows: .venv\Scripts\activate
   # macOS/Linux: source .venv/bin/activate
   pip install -r requirements.txt
   ```
4. Return to repository root for PowerShell module work.

## Project structure

- `Core/` - core systems
- `Features/`, `Productivity/`, `System/`, `UI/`, `Fun/`, `Health/`, etc. - modular PowerShell capabilities
- `goose-ui-python/` - cross-platform Python/PyQt UI
- `docs/` - architecture and feature documentation

## Coding standards

- Follow existing naming and style in each folder.
- Prefer clear function/module names and small, testable changes.
- Avoid unrelated refactors in feature PRs.

## Testing checklist

Before submitting a PR, run what applies:

```powershell
./test-goose-features.ps1
```

```bash
cd goose-ui-python
python -m compileall src
```

## Pull requests

Please include:

- What changed
- Why it changed
- How it was tested
- Any follow-up work or known limitations

## Security

If you discover a security issue, avoid public disclosure in issues. Share reproduction details privately with maintainers.

## License

By contributing, you agree that your contributions are licensed under the GNU GPLv3 (`LICENSE`).

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
