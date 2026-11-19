# Support

## Self-service first

1. Read the [README](./README.md) quickstart.
2. Check [FAQ](./wiki/09-FAQ.md).
3. Check [Troubleshooting](./wiki/10-Troubleshooting.md).
4. Search existing issues before filing a new one.

## Filing issues

- Bugs: use the bug report template. Include version,
  component, reproduction steps, and redacted logs.
- Features: use the feature request template. Lead with
  the problem, not the solution.
- Never include secrets, tokens, `.env` contents, or
  private keys in issues, logs, or screenshots.

## Security issues

Do not file public issues. Follow [SECURITY](./SECURITY.md).
Expect acknowledgement within 48 hours.

## Response expectations

Pre-1.0 project maintained alongside training and operations.
Triage targets: bugs within one week, features as capacity
allows. Pull requests with tests and docs move fastest.

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
