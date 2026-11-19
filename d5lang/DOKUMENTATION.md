# D5Lang v1 – Dokumentation (Stand: 09.11.2026)

Alles an einem Ort: Was gebaut wurde, wie es funktioniert, was noch offen ist.

## 1. Was ist D5Lang?

D5Lang ist Daniels eigene Sprache für das D5-Superapp-Projekt. Jedes Keyword
ist eine Story aus Daniels Leben (ShadowUnity seit 2018, Bank-Berater,
KI-Verbot, Edge-Goblin, OneDrive-2-Euro, Muse Code 4,29 Euro). Ohne das
README kann kein LLM sie parsen – das ist ein Feature, kein Bug.

Technik: Zeilenbasierter Transpiler in **purem C** (C99, nur
stdio/stdlib/string). `.d5` → `.c` → `gcc` → Binary. Keine Dependencies
außer gcc.

## 2. Datei-Inventar

```
D5/d5lang/                    – der Transpiler + alles drumherum
  d5lang.c                    – Lexer + Parser + Codegen + CLI (ein File, ~600 Zeilen)
  Makefile                    – nur: make, make install, make hello, make build
  README.md                   – deutsche Doku mit Daniels Story
  spec/d5lang_spec.md         – komplette Syntax, alle Keywords, Rewrite-Mapping
  examples/hello.d5           – Hello World Enterprise (MUSS laufen)
  examples/shine.d5           – Shine-Week-Beispiel
  examples/hosting.d5         – Hosting-Trauma (Aternos bis Index)

D5/tools/
  port-to-d5lang.ps1          – Port-Skript: D5 → D5/d5lang-port/
```

`D5/d5lang-port/` existiert noch NICHT – wird vom Port-Skript erzeugt
(siehe Abschnitt 6, Blocker).

## 3. CLI

```
d5lang build <file.d5>                  .d5 → .c → gcc → Binary
d5lang run <file.d5>                    bauen + laufen
d5lang <file.d5>                        Kurzform für run
d5lang rewrite --from <lang> -i <in> -o <out.d5> [--roast]
d5lang --explain <file.d5>              Erklärung auf Deutsch, müde, 3 Uhr nachts
```

`rewrite` versteht `--from python|js|ts|jsx|tsx|java|rust|go|c|cpp`.
Mit `--roast` kommen sarkastische PACK-ES-IN-JIRA-Kommentare dazu.

## 4. Bauen & Laufen

```powershell
cd D5/d5lang
gcc d5lang.c -o d5lang        # nur gcc nötig, sonst nichts
make hello                    # baut + führt examples/hello.d5 aus
```

Jedes erzeugte Binary druckt beim Start den Banner und wartet 8 Sekunden:

```
LOADING D5... CHECKING 340 ACCOUNTS FOR 240 EMPLOYEES...
FRÜHER WAR ICH BANK BERATER UND MUSSTE UM 8 DA SEIN...
IT'S PROBABLY DNS...
SHINE, LITTLE BOY, SHINE...
```

(8s-Wartezeit ist Absicht: Bank-Berater-Gleitzeit-Gag. Wer sie hasst, hat
Gleitzeit nie verdient.)

## 5. Port-Skript (tools/port-to-d5lang.ps1)

```powershell
.\tools\port-to-d5lang.ps1 -Source "D:\D5" -Dest "D:\D5\d5lang-port" -Roast
.\tools\port-to-d5lang.ps1 -Source "D:\D5" -Dest "D:\D5\d5lang-port" -DryRun
```

Ablauf: scannt `-Source` rekursiv, fasst das Original **nie** an, schreibt
alles nach `-Dest` mit identischer Ordnerstruktur.

| Datei-Typ                          | Aktion                                              |
|------------------------------------|-----------------------------------------------------|
| `.py .js .ts .jsx .tsx .java .rs .go .c .cpp` | `d5lang rewrite --from <lang> -i <in> -o <out.d5>` (+ `--roast` wenn `-Roast`) |
| `.md .txt`                         | Inhalt → `PACK-ES-IN-JIRA`-Kommentarzeilen in `.d5` |
| alles andere                       | 1:1-Kopie + Notiz `NOCH NICHT IN D5LANG - EDGE-GOBLIN WAR HIER` |

Ausgeschlossen: `.git node_modules .next dist build d5lang d5lang-port
.hg .sl .eden .muse .agents venv .venv site-packages __pycache__`.

Am Ende schreibt das Skript `d5lang-port/PORT-REPORT.md`: Anzahl gescannt /
erfolgreich / fehlgeschlagen (+Dateiname + Fehler), Gesamtzeilen D5Lang-Code,
Liste aller `DANIEL-DU-HAST-KI-VERBOT`-Stellen zur manuellen Nacharbeit.

## 6. Status & Blocker (09.11.2026)

**Fertig:** d5lang.c, Makefile, README, Spec, 3 Beispiele, Port-Skript.
Das Skript parst fehlerfrei, der **DryRun läuft sauber** durch.

**Entschiedene Fixes am Skript:**
1. Umlaute in String-Literalen → ASCII (`HAETTE`, `MUESSEN`, `unberuehrt`),
   weil Windows PowerShell 5.1 UTF-8 ohne BOM falsch liest (Parse-Fehler).
2. `[System.IO.Path]::GetRelativePath` (gibt es in PS 5.1 nicht) → eigene
   `Get-RelPath`-Funktion via `Substring`.
3. `venv/.venv/site-packages/__pycache__` zur Skip-Liste (sonst würden
   tausende pip-interne Dateien geportet).

**Offener Blocker:** Kein `gcc` auf PATH. `winget install -e --id
BrechtSanders.WinLibs.POSIX.UCRT` (WinLibs 16.2.0) lief erfolgreich, aber das
Paket landet nicht im PATH (Registry-PATH unverändert, keine Aliase). Jeder
Build (`gcc d5lang.c -o d5lang`) scheitert mit „Benennung nicht erkannt“.
**Nächster Schritt:** frisches Terminal öffnen (PATH neu laden) und bauen +
porten (Befehle siehe Abschnitt 4 und 5). Erst danach existiert
`D5/d5lang-port/` inkl. `PORT-REPORT.md`.

## 7. Offene Punkte (nach Blocker-Fix)

- [ ] `d5lang.exe` bauen, `make hello` laufen lassen (dauert 8s+ pro Binary)
- [ ] Echten Port ausführen: `port-to-d5lang.ps1 ... -Roast`
- [ ] `PORT-REPORT.md` prüfen, `DANIEL-DU-HAST-KI-VERBOT`-Stellen nacharbeiten
- [ ] Optional: 8s-Banner-Wartezeit per Flag abschaltbar machen

SHINE, LITTLE BOY, SHINE.

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
