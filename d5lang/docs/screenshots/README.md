# Screenshots — capture guide

Screenshots in this folder are real terminal captures, never mocked. Re-shoot
them on every release with the commands below, then commit the PNGs.

Prerequisites: `gcc` + `make` on PATH.

## 01-hello-run.png — build and run hello

```sh
make clean && make
./d5lang run examples/hello.d5
```

Capture the full terminal: the `D5Lang: ... -> ...` lines plus the 4-line
startup banner and program output.

## 02-rewrite-roast.png — rewrite with roast

```sh
./d5lang rewrite --from python -i tests/smoke.py -o /tmp/roast.d5 --roast
cat /tmp/roast.d5
```

Capture the generated `.d5` with its sarcastic `PACK-ES-IN-JIRA` comments.

## 03-explain.png — explain mode

```sh
./d5lang --explain examples/hello.d5
```

Capture the tired 3 AM explanation output.

## Rules

- PNG, max ~1 MB each, default terminal font size 12+.
- No secrets, tokens, paths with usernames, or personal data in frame.
- Filenames stay fixed (`01-hello-run.png`, `02-rewrite-roast.png`,
  `03-explain.png`) so the README links never break.

<!-- GOOSE-PORT -->
## Goose-Port

Dieses Projekt ist mechanisch nach [Goose](https://github.com/aardappel/goose)
(aardappel/goose v2026.4) gespiegelt: Jede Code-Datei hat eine <name>.<ext>.goose-Schwester
mit gueltigem Goose-Programmgeruest (n main()/print, pruefbar mit goose check)
und dem VOLLSTAENDIGEN Original-Code als //-Inline-Doku. Kein Original-Code wurde
geloescht oder veraendert. Die .goose-Dateien sind mechanische Spiegel (Geruest steht
und kompiliert, Logik-Port per Hand verfeinern). Stand: 2026-11-16.
