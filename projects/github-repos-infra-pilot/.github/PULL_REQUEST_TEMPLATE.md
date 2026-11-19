# Pull request template

## Summary

<!-- What changes and why. Link issues with Closes #id. -->

## Changes

- [ ] ...
- [ ] ...

## Screenshots or API output

<!-- UI: attach before/after. API/CLI: paste command output. -->

## Verification

- [ ] `git diff --check` clean
- [ ] `pytest tests/ -q` passes
- [ ] Panel `npm run lint` and `npm test` pass (if touched)
- [ ] Docs updated (`README`, `wiki/`, service README as needed)
- [ ] No secrets, tokens, `.env`, or private keys committed
- [ ] Help, schema, or contract output recorded (if API/CLI changed)

```text
# Paste relevant command output here
```

## Risk and rollback

<!-- Impact, feature flags, migration notes, rollback steps. -->

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
