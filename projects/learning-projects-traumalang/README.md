# TraumaLang v2.2 — The Unbenchmarkable IT Satire Language

Satirische Programmiersprache in C (Linux-Ziel, GCC). `.tl` -> C.

## Schnellstart (fuer den Anwender, hier nicht ausgefuehrt)

```sh
make
./traumalang build examples/hello_world_enterprise.tl
./traumalang --explain examples/hello_world_enterprise.tl
./traumalang rewrite --from python -i examples/hello.py -o /tmp/hello.tl
```

Alle Build-/Run-/Test-Schritte sind **nicht ausgefuehrt, nicht verifiziert**;
sie sind als Anweisungen fuer den Anwender gedacht.

## Struktur

- `src/`: Compiler (lexer, parser, ast, codegen, runtime, cli, rewrite, explain, main).
- `examples/`: Pflichtbeispiele + `hello.py`.
- `tests/`: C-Modultests + `cli_tests.sh` (Ablage, manuell auszufuehren).
- `docs/`: LANGUAGE.md, GRAMMAR.md, KEYWORDS.md, REWRITER.md.

## Hinweise

- Kein Rust/Go/Python/JS im Compiler; keine Pflichtabhaengigkeiten (nur libc + GCC).
- Absichtlich endlose Konstrukte sind dokumentiert (LANGUAGE.md).
- Satire-Allokationen sind begrenzt (4 KiB Leak einmalig, 64 KiB Datadog temporaer).
- `build` generiert `.tl.gen.c` und zeigt den GCC-Befehl; der Anwender fuehrt ihn selbst aus.

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
