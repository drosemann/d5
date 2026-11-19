# Changelog

All notable changes to D5Lang are documented here. Format follows
[Keep a Changelog](https://keepachangelog.com/en/1.1.0/); versioning follows
[SemVer](https://semver.org/).

## [1.0.0] - 2026-11-15

### Added
- Single-file C99 transpiler (`d5lang.c`): `.d5` -> `.c` -> `gcc` -> binary.
- CLI: `build`, `run`, bare-file shorthand, `rewrite --from ...` (Python, JS/TS,
  JSX/TSX, Java, Rust, Go, C, C++) with `--roast`, and `--explain`.
- 3 examples: `hello.d5`, `shine.d5`, `hosting.d5`.
- Full keyword spec (`spec/d5lang_spec.md`) and German docs (`DOKUMENTATION.md`).
- Open-source release prep: MIT license, CI matrix (Linux/macOS/Windows),
  contributing/security/conduct docs, issue and PR templates.

### Fixed
- `run` failed on Windows for paths with directories (`examples/hello.d5`):
  `cmd.exe` read `/` as a switch. Path separators are now flipped to `\`
  before executing the built binary.
- Removed unused `d5_sleep`/`d5_is_win` statics; the build is `-Wall`-clean.

[1.0.0]: https://github.com/drosemann/d5lang/releases/tag/v1.0.0

<!-- GOOSE-PORT -->
## Goose-Port

Dieses Projekt ist mechanisch nach [Goose](https://github.com/aardappel/goose)
(aardappel/goose v2026.4) gespiegelt: Jede Code-Datei hat eine <name>.<ext>.goose-Schwester
mit gueltigem Goose-Programmgeruest (n main()/print, pruefbar mit goose check)
und dem VOLLSTAENDIGEN Original-Code als //-Inline-Doku. Kein Original-Code wurde
geloescht oder veraendert. Die .goose-Dateien sind mechanische Spiegel (Geruest steht
und kompiliert, Logik-Port per Hand verfeinern). Stand: 2026-11-16.
