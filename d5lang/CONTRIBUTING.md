# Contributing to D5Lang

Thanks for stopping by. SHINE, LITTLE BOY, SHINE.

## Ground rules

- One focused PR per change. Small diffs beat big rewrites.
- C99 only, zero dependencies besides `gcc` + `make`. Keep it that way.
- New code must compile warning-free: `make` uses `-Wall`; don't add new
  warnings.
- Every new keyword needs a story: add it to `spec/d5lang_spec.md`, wire it in
  `d5lang.c`, and cover it in an example or the smoke test.
- Unknown lines must stay harmless comments. D5Lang compiles always.

## Workflow

```sh
git clone https://github.com/drosemann/d5lang.git
cd d5lang
make          # builds ./d5lang
make test     # rewrite smoke test + builds examples/hello.d5
make hello    # builds and runs the hello example (takes ~10s, 8s are lore)
```

`make test` and `make hello` need `gcc` on PATH. On Windows use
git-bash/MSYS2 or WSL.

## Pull requests

1. Fork, branch from `main`, keep the diff tight.
2. Update the spec and `CHANGELOG.md` when behavior changes.
3. Fill in the PR template. CI must be green.

## Bug reports

Use the bug template and include: OS, `gcc --version`, exact command, the
`.d5` input (or minimal reproducer), and full output. "Bei mir geht es" is
not a reproducer.

<!-- GOOSE-PORT -->
## Goose-Port

Dieses Projekt ist mechanisch nach [Goose](https://github.com/aardappel/goose)
(aardappel/goose v2026.4) gespiegelt: Jede Code-Datei hat eine <name>.<ext>.goose-Schwester
mit gueltigem Goose-Programmgeruest (n main()/print, pruefbar mit goose check)
und dem VOLLSTAENDIGEN Original-Code als //-Inline-Doku. Kein Original-Code wurde
geloescht oder veraendert. Die .goose-Dateien sind mechanische Spiegel (Geruest steht
und kompiliert, Logik-Port per Hand verfeinern). Stand: 2026-11-16.
