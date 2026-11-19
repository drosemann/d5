# ZIMBU-PORT-REPORT

Mechanischer Voll-Port des `d5`-Projekts nach [Zimbu](https://moolenaar.net/z/zimbu/spec/zimbu.html) (Bram Moolenaar). Stand: 2026-11-12.

## Ergebnis

- **3466 `.zimbu`-Spiegeldateien** erzeugt (`<name>.<ext>.zimbu` neben jedem Original).
- **250/250 Markdown-Dateien** mit `## Zimbu-Port`-Abschnitt ergaenzt (Marker `<!-- ZIMBU-PORT -->`).
- **0 Dateien geloescht, 0 Originale veraendert.** Jedes `.zimbu` enthaelt den
  VOLLSTAENDIGEN Original-Code als `#`-Inline-Doku plus Zimbu-Modulgeruest
  (`MODULE <datei>_<ext>` / `IMPORT IO` / `FUNC Main() int`).
- Skripte: [tools/port-to-zimbu.ps1](../tools/port-to-zimbu.ps1) (Port, idempotent),
  [tools/verify-zimbu.ps1](../tools/verify-zimbu.ps1) (Pruefung, idempotent).
  Beide enthalten keine Loeschbefehle (`Remove-Item`-Check: False).

## Abdeckung

Quell-Extensions: js/jsx/ts/tsx/mjs/cjs, py, java, c/h, cs/cpp, go, rs, rb, php,
dart, ps1, sh, sql, d5, css/html/vue/svelte, json. Ausgeschlossen: `.git`- und
VCS-Verzeichnisse, `node_modules`, `venv`, Build-/Dist-Ordner, Dateien > 200 KB,
`package-lock`-/`.min.js`-Dateien (5 Dateien uebersprungen: nicht lesbar).

## Ehrliche Einordnung (kein 100%-Versprechen)

- Die `.zimbu`-Dateien sind **mechanische Spiegel (Scaffolding, ~25 %)**, keine
  handportierte, kompilierte Zimbu-Logik: Zimbu ist eine experimentelle Sprache
  ohne stabilen Toolchain-Support in dieser Umgebung, ein Kompilier-Check war
  daher nicht moeglich.
- Naechster Schritt pro Datei: Logik von Hand in `FUNC Main()` (bzw. eigene
  `FUNC`s/`CLASS`es) uebertragen, Original-Kommentar danach stutzen.
- Verifikation dieses Reports: `powershell -File tools/verify-zimbu.ps1`
  meldet `ZIMBU_FILES=3466`, `MD_TOTAL=250`, `MD_MISSING=0`.

<!-- ZIMBU-PORT -->
## Zimbu-Port

Diese Datei ist selbst Teil des Zimbu-Ports (Bericht dazu). Jede Code-Datei hat
eine `<name>.<ext>.zimbu`-Schwester mit Zimbu-Modulgeruest und dem Original-Code
als `#`-Inline-Doku. Kein Original-Code wurde geloescht oder veraendert.

<!-- GOOSE-PORT -->
## Goose-Port

Dieses Projekt ist mechanisch nach [Goose](https://github.com/aardappel/goose)
(aardappel/goose v2026.4) gespiegelt: Jede Code-Datei hat eine <name>.<ext>.goose-Schwester
mit gueltigem Goose-Programmgeruest (n main()/print, pruefbar mit goose check)
und dem VOLLSTAENDIGEN Original-Code als //-Inline-Doku. Kein Original-Code wurde
geloescht oder veraendert. Die .goose-Dateien sind mechanische Spiegel (Geruest steht
und kompiliert, Logik-Port per Hand verfeinern). Stand: 2026-11-16.
