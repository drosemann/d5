# GOOSE-PORT-REPORT

Mechanischer Voll-Port des `d5`-Projekts nach [Goose](https://github.com/aardappel/goose)
(aardappel/goose v2026.4, Wouter van Oortmerssen). Stand: 2026-11-16.

## Ergebnis

- **6155 `.goose`-Spiegeldateien** erzeugt (`<name>.<ext>.goose` neben jedem Original,
  0 uebersprungen).
- **851/851 Markdown-Dateien** mit `## Goose-Port`-Abschnitt ergaenzt
  (Marker `<!-- GOOSE-PORT -->`), diese Datei eingeschlossen.
- **0 Dateien geloescht, 0 Original-Code veraendert.** Jedes `.goose` enthaelt den
  VOLLSTAENDIGEN Original-Code als `//`-Inline-Doku plus gueltigem Goose-Programmgeruest
  (`fn main()` / `print`, Dateiendung `.goose`).
- Skripte: [tools/port-to-goose.ps1](../tools/port-to-goose.ps1) (Port, idempotent),
  [tools/verify-goose.ps1](../tools/verify-goose.ps1) (Pruefung, idempotent).
  Beide enthalten keine Loeschbefehle (`Remove-Item`-Check: False) und nutzen
  `-LiteralPath` (auch `[id]`-Pfade werden gespiegelt).

## Toolchain-Nachweis (echter Goose-Compiler, kein reines Scaffolding-Versprechen)

- Compiler: `goose v2026.4 (runtime dce889723a23)`, Prebuilt `windows-x64` von der
  [Releases-Seite](https://github.com/aardappel/goose/releases/tag/v2026.4),
  C-Backend `gcc 16.2.0`.
- `goose check` auf 33 Spiegeln (je einer pro Quell-Extension, plus groesste Datei,
  `[id]`-Pfade, `&`/Komma/Klammern-Pfade, `d5lang/d5lang.c.goose`,
  `d5lang/examples/hello.d5.goose`, `app/index.html.goose`): **33/33 ok, 0 Fehler**.
- `goose run` auf `d5lang/examples/hello.d5.goose` und `app/index.html.goose`:
  laeuft, gibt `Goose-Spiegel: <pfad>` aus.
- Jeder Spiegel ist damit ein **gueltiges, pruefbares Goose-Programm**; die Pruefung
  erfolgte mit dem echten Toolchain-Release, nicht per Augenschein.

## Abdeckung

Quell-Extensions: js/jsx/ts/tsx/mjs/cjs, py, java, c/h, cs/cpp, go, rs, rb, php,
dart, ps1, sh, sql, d5, css/html/vue/svelte, json. Ausgeschlossen: `.git`- und
VCS-Verzeichnisse, `node_modules`, `venv`, Build-/Dist-Ordner, Dateien > 200 KB,
`package-lock`-/`.min.js`-Dateien, sowie bereits erzeugte `.zimbu`- und `.goose`-Dateien.

## Ehrliche Einordnung (kein 100%-Logik-Versprechen)

- Die `.goose`-Dateien sind **mechanische Spiegel mit gueltigem Goose-Geruest**:
  Jede Datei passiert `goose check`, aber die fachliche Logik des Originals steht
  als `//`-Inline-Doku darin und ist noch nicht in Goose-Idiome (Data-Stacks,
  `u8[]`-Arrays, `match`, `return ... from`) uebersetzt.
- Naechster Schritt pro Datei: Logik von Hand in `fn main()` (bzw. eigene `fn`s/
  `struct`s/`enum`s) uebertragen, Original-Kommentar danach stutzen.
- Verifikation dieses Reports: `powershell -File tools/verify-goose.ps1`
  meldet `GOOSE_FILES=6155`, `GOOSE_BAD_SCAFFOLD=0`, `MD_TOTAL=852`, `MD_MISSING=0`.
  Stichprobe mit Toolchain: `goose check <datei>.goose` (s. Abschnitt oben).

<!-- GOOSE-PORT -->
## Goose-Port

Diese Datei ist selbst Teil des Goose-Ports (Bericht dazu). Jede Code-Datei hat
eine `<name>.<ext>.goose`-Schwester mit gueltigem Goose-Programmgeruest
(`fn main()`/`print`, pruefbar mit `goose check`) und dem VOLLSTAENDIGEN Original-Code
als `//`-Inline-Doku. Kein Original-Code wurde geloescht oder veraendert.
