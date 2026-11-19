- Ein PHP‑Backend zum Verwalten und Bereitstellen von Artikeln (Admin‑Bereich und API).
- Ein Next.js‑Frontend, das die Artikel abruft und anzeigt.


Hinweis:
Stelle sicher, dass du CORS (Cross-Origin Resource Sharing) im PHP‑Backend aktivierst, falls dein Next.js‑Frontend und dein PHP‑Backend auf unterschiedlichen Domains oder Ports laufen. Ein einfacher Ansatz dazu wäre, im API‑Script vor dem Output den Header zu setzen:

header("Access-Control-Allow-Origin: *");


Für Produktionssysteme solltest du CORS jedoch restriktiver konfigurieren.
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
