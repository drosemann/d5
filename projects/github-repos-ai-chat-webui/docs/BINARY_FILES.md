# Binary Files in Pull Requests

This repository should contain source code and documentation only.

## Why this matters
Some PR tooling used in this project rejects binary diffs with the message:

`Binärdateien werden nicht unterstützt`.

To keep PR creation reliable, do not commit generated binaries or release artifacts.

## Do not commit
- Compiled binaries (`*.exe`, `*.dll`, `*.so`, `*.dylib`, `*.bin`)
- Build output folders (`dist/`, `build/`)
- Archive artifacts (`*.zip`, `*.tar`, `*.tar.gz`, `*.tgz`, `*.7z`)

## If a binary file was added by mistake
Remove it from Git history of your branch before opening a PR:

```bash
git rm --cached <path-to-binary>
```

Then commit and push again.

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
