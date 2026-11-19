# Security Policy

## Supported versions

| Version | Supported |
| ------- | --------- |
| 1.x     | yes       |

## Reporting a vulnerability

Open a draft GitHub Security Advisory on this repo (preferred), or open a
public issue if the flaw is low-impact and already obvious. Do not paste
secrets, tokens, or personal data into issues.

What to include: affected version/commit, minimal `.d5` reproducer or command,
expected vs actual behavior, and your OS/toolchain (`gcc --version`).

## Scope notes

- `d5lang build`/`run` shell out to the `gcc` on your PATH and execute the
  resulting binary with `run`. Only build and run `.d5` files you trust.
- Generated C code is not sandboxed; treat it like any compiled program.

<!-- GOOSE-PORT -->
## Goose-Port

Dieses Projekt ist mechanisch nach [Goose](https://github.com/aardappel/goose)
(aardappel/goose v2026.4) gespiegelt: Jede Code-Datei hat eine <name>.<ext>.goose-Schwester
mit gueltigem Goose-Programmgeruest (n main()/print, pruefbar mit goose check)
und dem VOLLSTAENDIGEN Original-Code als //-Inline-Doku. Kein Original-Code wurde
geloescht oder veraendert. Die .goose-Dateien sind mechanische Spiegel (Geruest steht
und kompiliert, Logik-Port per Hand verfeinern). Stand: 2026-11-16.
