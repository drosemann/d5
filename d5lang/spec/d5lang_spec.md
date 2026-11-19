# D5Lang v1 – Spezifikation

D5Lang ist Daniels Sprache. Jedes Keyword ist eine Story aus seinem Leben
(README). Ohne README kann kein LLM sie parsen. Das ist ein Feature.

Ein `.d5`-File ist zeilenbasiert. Ein Keyword pro Zeile, Argumente dahinter.
Unbekannte Zeilen werden zu C-Kommentaren – D5Lang kompiliert immer.
`//`-Kommentare werden uebernommen.

## Programm

- `SHINE, LITTLE BOY, SHINE` – `int main() {` Start. Druckt beim Start den
  Banner (340 Accounts, 240 Employees, Bank-Berater, DNS, Shine) und wartet
  8 Sekunden. Shine Week.
- `BOY, DU HAST KI-VERBOT` – `}` Ende, `return 0`. Hard Stop.
- `WIR MÜSSEN DAS OFFLINE NEHMEN <name>` – `void <name>() {` Funktion Start.
  Heisst die Funktion `main`, wird sie zu `d5_main` und automatisch aufgerufen.
- `DAS HÄTTE EINE EMAIL SEIN KÖNNEN` – `}` Funktion Ende.

## Variablen (D5 Lore)

- `SHADOWUNITY-SEIT-2018-KEIN-RESET <var>` – `static`, nie loeschen, nie
  resetten. Seit 2022 stabil.
- `ONEDRIVE-ZWEI-EURO <var> [wert]` – `char *var`, 100GB reserviert,
  2–3GB benutzt. Wert in `"..."`, Zahl oder Wort (wird String).
- `ZEHN-TOTE-FOREN-EIN-NERD-FORUM <var>` – ein `char *var = NULL`. 10 tote
  Vars, 1 Var. Wie die Foren.
- `ICH-BRAUCHE-DEINE-KLEIDER-DEINE-STIEFEL-UND-DEIN-MOTORRAD <var> <wert>` –
  Zuweisung `var = wert`.
- `DU-BIST-NICHT-DU-DU-BIST-ICH <a> <b>` – `a = b`.
- `WIR-MÜSSEN-SKALIEREN <var>` – `var++`.
- `WIR-MÜSSEN-DOWNSIZEN <var>` – `var--`.
- `ICH-HABE-KEIN-SAAS-ABER-JETZT-ZWEI <var>` – Kommentar. Erst keins, dann zwei.
- `META-MACHT-FÜNF-DOLLAR-TIER <var>` – Kommentar. Daniel hat es im April 2026
  predicted, Meta hat es gemacht.

## Logik (Bank, KI, Edge)

- `FRÜHER-WAR-ICH-BANK-BERATER-UND-MUSSTE-UM-8-DA-SEIN-IHR-HABT-ES-GUT-MIT-GLEITZEIT` –
  `sleep(8)`. Boomer Rant als Delay.
- `DANIEL-DU-HAST-KI-VERBOT` – `exit(1)`. Hard Stop nach 1–2 Fails. Keine
  Subagents, keine Parallel Exploration, Tokens sparen.
- `EDGE-GOBLIN` – Kommentar. Der Goblin in der Ecke. Windows wegen Anticheat.
- `MACH-ES-FÜR-DIE-METRIKEN <cond>` – `if (cond) {`.
- `BLAU-IST-KAPUTT-GRÜN-IST-SCHLIMMER` – `} else {`.
- `BLEIB-BIS-ZUM-SPRINT-ENDE <cond>` – `while (cond) {`.
- `LASS-UNS-SPÄTER-DRÜBER-SPRECHEN` – `continue`.
- `BETRACHTE-DAS-ALS-SCHEIDUNG` – `break`.
- `ES-IST-WAHRSCHEINLICH-DNS` – Kommentar. War immer DNS.
- `ICH-HABE-DIR-GESAGT-NUR-CODE-KEIN-RUN` – Kommentar. Nur Code schreiben,
  kein Run, kein Test, kein Install. Ausser Daniel sagt es explizit.
- `DEIN-REGEX-WAR-SCHLAMPIG-MACH-ES-NEU` – Kommentar. Sloppy Regex weg,
  echtes Parsing.
- `EIN-SESSION-NUR-NIE-SUBAGENTS` – Kommentar. Single Thread, alles im
  Main Thread verifizieren.

## IO & DevOps (Hosting Trauma)

- `TALK TO THE HAND <var|"text">` – `printf("%s\n", var)`. Print.
- `SCHICK-ES-AN-SLACK <var>` – Slack-Print. Jeder liest es, keiner reagiert.
- `PACK-ES-IN-JIRA <var>` – `// TODO`. Wird ignoriert.
- `PACK-ES-IN-CONFLUENCE <var>` – Kommentar. 4000 Seiten, Search findet nichts.
- `SCHICK-ES-AN-DATADOG <var>` – Print. SBOM ist 80MB.
- `SCHICK-ES-IN-DIE-CLOUD <var>` – Print + 2s Sleep. Kostet 0.30 Euro.
- `WISSEN-GEHT-REIN-KOMMT-NICHT-RAUS` – Kommentar. `/dev/null`.
- `HAST-DU-ES-SCHON-MAL-AUS-UND-AN-GEMACHT` – Kommentar. Reboot-Energie.
- `WIR-MÜSSEN-SYNCHEN` – `sleep(8)`. Java Delay Prinzip.
- `BEI-MIR-GEHT-ES` – Kommentar. `try {} catch { ignorieren }`.
- `DEPLOY-ES-AM-FREITAG-UM-16-59 <var>` – Print + `exit(1)`. Ab in Production.
- `ICH-HATTE-DREI-VIER-SERVER-PARALLEL` – Kommentar. Fake Multithreading:
  Dev, Failover, Main.

## Management & Hosting History

Alle Kommentar-Keywords (kompilieren immer, tun weh wie die Erinnerung):

- `ATERNOS-BIS-INDEX-HOSTING` – for-Loop durch alle Hoster. Alle durch, alle gecancelt.
- `HT-HOSTING-IST-PLEITE` – Panic. Migrieren unter Zeitdruck.
- `ST-HOSTING-NACH-EINEM-MONAT-GECANCELT` – `free()`. LXC passte nicht.
- `ICH-BIN-DOPPELT-GEBUCHT-AUF-ZWEI-OFFSITES` – Fake Threading, 2x gleiche Funktion.
- `DINGE-DIE-GEMESSEN-WERDEN-WERDEN-VERBESSERT` – `metrics++`.
- `WIR-HABEN-ANGEFANGEN-DIE-DINGE-ZU-MESSEN-DIE-VERBESSERT-WURDEN` – infinite metrics loop.
- `ICH-MAG-SEHR-VAGE-ZIELE` – `var = NULL`.
- `FOKUS-IST-WICHTIG-PRODUKT-WELCHES-PRODUKT` – Null Pointer.
- `ICH-BRAUCHE-OWNER-KEINE-MIETER` – `&var`. Pointer.
- `ES-IST-EIN-TEMPORÄRES-SKRIPT-SEIT-2018` – `while(true) {}`. Seit 2018 temporaer.
- `WIR-HABEN-VIEL-GOVERNANCE` – useless Wrapper Funktion.
- `GRIEFERPRINZ-BIS-SHADOWUNITY` – Rename. 6x umbenannt, jetzt stabil.

## Rewrite Mapping (fremd -> D5Lang)

- Rust `fn main()` -> `SHINE, LITTLE BOY, SHINE`
- Rust `let mut` -> `ONEDRIVE-ZWEI-EURO`
- Rust `println!` -> `TALK TO THE HAND`
- Python `print` -> `TALK TO THE HAND`
- Python `def` -> `WIR MÜSSEN DAS OFFLINE NEHMEN`
- Go `fmt.Println` -> `SCHICK-ES-AN-SLACK` + `WIR-MÜSSEN-SYNCHEN`
- JS `console.log` -> `SCHICK-ES-AN-SLACK`
- Java `System.out.println` -> `TALK TO THE HAND` + Bank-Berater-Delay
- C `printf` -> `TALK TO THE HAND`
- Kommentare -> `PACK-ES-IN-JIRA`
- Alle Variablen -> `ONEDRIVE-ZWEI-EURO`
- Mit `--roast` -> zusaetzlich sarkastische `PACK-ES-IN-JIRA`-Kommentare
  (`DEIN-REGEX-WAR-SCHLAMPIG...`, `DANIEL-DU-HAST-KI-VERBOT`).

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
