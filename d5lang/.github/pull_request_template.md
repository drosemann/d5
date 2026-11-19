# What this PR does

## Checklist

- [ ] One focused change, small diff.
- [ ] Compiles warning-free (`make` uses `-Wall`).
- [ ] `make test` passes locally.
- [ ] Spec updated (`spec/d5lang_spec.md`) if behavior changed.
- [ ] `CHANGELOG.md` updated if behavior changed.
- [ ] New keyword? It has a story, a spec entry, and example coverage.

<!-- GOOSE-PORT -->
## Goose-Port

Dieses Projekt ist mechanisch nach [Goose](https://github.com/aardappel/goose)
(aardappel/goose v2026.4) gespiegelt: Jede Code-Datei hat eine <name>.<ext>.goose-Schwester
mit gueltigem Goose-Programmgeruest (n main()/print, pruefbar mit goose check)
und dem VOLLSTAENDIGEN Original-Code als //-Inline-Doku. Kein Original-Code wurde
geloescht oder veraendert. Die .goose-Dateien sind mechanische Spiegel (Geruest steht
und kompiliert, Logik-Port per Hand verfeinern). Stand: 2026-11-16.
