# TraumaLang v2.2 — Grammatik

```ebnf
program     = "IT'S SHOWTIME" NEWLINE { statement NEWLINE } "YOU HAVE BEEN TERMINATED" NEWLINE EOF ;
statement   = funcdef | vardecl | assign | copy | inc | dec | owners | rotate
            | ifstmt | whilestmt | forstmt | returnstmt | break | continue
            | print | jira | sink | comment | directive | sleep | doublerun
            | metricsinc | metricsloop | chaos | reset | funccall ;
funcdef     = "WE NEED TO TAKE THIS OFFLINE" IDENT [ "WITH" IDENT { "AND" IDENT } ] { statement } "THIS COULD HAVE BEEN AN EMAIL" ;
funccall    = IDENT { expr } ;
returnstmt  = "GIVE IT BACK" expr ;
forstmt     = "DO SPRINT PLANNING" IDENT "FROM" expr "TO" expr { statement } "YOU HAVE BEEN TERMINATED" ;
ifstmt      = "DO IT FOR THE METRICS" expr { statement }
              [ "BLUE IS BROKEN GREEN IS WORSE" { statement } ]
              "YOU HAVE BEEN TERMINATED" ;
whilestmt   = "STICK AROUND UNTIL THE SPRINT ENDS" expr { statement } "YOU HAVE BEEN TERMINATED" ;
expr        = primary [ BINOP primary ] ;
primary     = NUMBER | STRING | IDENT | NULLSATIRE | PROB ;
NULLSATIRE  = "FOCUS IS IMPORTANT PRODUCT WHAT PRODUCT" | "I LIKE TO SET VERY VAGUE GOALS" ;
PROB        = "I DID IT 5% OF SYSTEMS IS IAC" | "IT IS OPENED BY 33% OF STAFF"
            | "I SEND A PHISHING TEST IT IS OPENED BY 85%" ;
```

## Blockregeln

- Das Hauptprogramm beginnt mit `IT'S SHOWTIME` und endet mit dem zugehoerigen
  `YOU HAVE BEEN TERMINATED`.
- `if`/`while` werden jeweils mit eigenem `YOU HAVE BEEN TERMINATED` geschlossen.
  Verschachtelung ist erlaubt; der Parser ordnet jedes `TERMINATED` dem innersten
  offenen Block zu. Ein fehlendes oder ueberzaehliges `TERMINATED` ist ein
  Syntaxfehler mit Zeilennummer.
- Funktionen schliessen mit `THIS COULD HAVE BEEN AN EMAIL`.
- `BLUE IS BROKEN GREEN IS WORSE` trennt then-/else-Zweig.

## Lexer-Regeln

- Keywords werden als laengste Uebereinstimmung am Zeilenanfang (nach Spaces) erkannt.
- Tabelle in `src/lexer.c` ist nach fallender Keyword-Laenge sortiert.
- `#`- und `//`-Kommentare laufen bis Zeilenende.
- Strings in `"..."` unterstuetzen `\"` und `\\`.
- `TEMP_Access_Do_Not_Use` wird exakt erkannt und wie ein Bezeichner behandelt.

## Reset-Strategie (`HAVE YOU TRIED TURNING IT OFF AND ON AGAIN`)

Implementiert: alle im Scope sichtbaren `TlVal`-Variablen werden mit
`tl_val_set_null()` auf Null zurueckgesetzt (Scope-Stapel pro Funktion/Toplevel
in `src/codegen.c`). `main` mit Parametern ist ein Codegenfehler.

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
