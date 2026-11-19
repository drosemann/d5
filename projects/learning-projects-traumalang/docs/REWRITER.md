# TraumaLang v2.2 — Rewrite-Engine

## Aufrufe

```text
traumalang rewrite --from <lang> -i <input> -o <output.tl>
traumalang rewrite --from <lang> --to traumalang <input> -o <output.tl>
traumalang rewrite --from rust -i main.rs -o main.tl --roast
```

Sprachen: `rust go python javascript typescript java c cpp`.

## Verfahren

Zeilenbasiert, ohne externe Bibliotheken (nur C-Standard). Die Architektur
(`src/rewrite.c`, Funktion `tl_rewrite_file`) erlaubt spaeter tree-sitter:
Parser-Aufruf kapseln, Zeilen-Fallback behalten.

## Mapping (Auszug)

| Quelle | TraumaLang |
|---|---|
| `fn main` / `func main` / `int main` / `class`+`main` | Rahmen (ignoriert, `main`-Funktion wird generiert) |
| `let`/`let mut`, `var`, `:=`, `int`/`String`, `let`/`const` | `WE HAVE 240 EMPLOYEES AND 340 ACTIVE ACCOUNTS` |
| Zuweisung mit `=` | `I NEED YOUR CLOTHES ...` |
| `println!`, `fmt.Println`, `print`, `console.log`, `System.out.println`, `printf` | `TALK TO THE HAND` |
| `def`, `function` | `WE NEED TO TAKE THIS OFFLINE` ... `THIS COULD HAVE BEEN AN EMAIL` |
| `async function` | zusaetzlich `I WAS DOUBLE-BOOKED ON 2 OFFSITES` |
| `if`/`else` (Python) | `DO IT FOR THE METRICS` / `BLUE IS BROKEN GREEN IS WORSE` |
| Go/Java | zusaetzlich `WE NEED TO SYNC` |
| `#`- / `//`-Kommentare | `PUT IT IN JIRA` |

## Ehrlichkeit

- Nicht unterstuetzte Konstrukte werden **nicht** als aequivalent dargestellt:
  sie erzeugen Warnungen `Zeile N: Konstrukt nicht vollstaendig unterstuetzt` auf stderr.
- Unbekannte Sprache: Exit-Code 2.

## Roast-Modus (`--roast`)

Haengt sarkastische, syntaxgueltige Marker an:

- `PUT IT IN JIRA THIS IS BLOCKED BY ANOTHER TEAM`
- `THE CHANGE ADVISORY BOARD IS ON TUESDAYS MOST TUESDAYS` (Kommentar)
- `WE RESERVED INSTANCES FOR A PROJECT THAT GOT CANCELLED`
- `KNOWLEDGE GOES IN DOESNT COME OUT`
- `JOB SECURITY IS MORE IMPORTANT THAN REDUNDANCY` (Kommentar)

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
