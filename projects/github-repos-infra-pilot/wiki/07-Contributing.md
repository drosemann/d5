# Contributing

## Development Setup

```bash
git clone https://github.com/drosemann/infra-pilot.git
cd infra-pilot
pip install -r requirements.txt
cd services/management-panel && npm install && cd ../..
cd services/discord-service && npm install && cd ../..
```

## Running Tests

```bash
pytest tests/
cd services/management-panel && npm test
```

### Test Markers

`unit` · `integration` · `e2e` · `smoke`

## Branch Naming

Use a prefix: `feat/`, `fix/`, `docs/`, `refactor/`, `test/`, `chore/` plus a short name.

## Commit Messages

Use [Conventional Commits](https://www.conventionalcommits.org/): `type(scope): description`

## Pull Request Workflow

1. Create a new branch from `main`
2. Commit and push
3. Open a pull request against `main`
4. CI runs tests, lint, and security checks
5. Merge after review and all checks pass

---

*See [CONTRIBUTING.md](https://github.com/drosemann/infra-pilot/blob/main/CONTRIBUTING.md) for full details.*

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
