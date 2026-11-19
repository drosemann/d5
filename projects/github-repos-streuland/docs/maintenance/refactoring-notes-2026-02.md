# Refactoring-Notizen (2026-02)

## Fokus

- Reduzierung technischer Schulden in Build, Struktur und Testbarkeit

## Erledigt

- Maven-POM bereinigt (kaputte XML-Struktur, doppelte/defekte Dependencies entfernt)
- Abhängigkeiten auf nachvollziehbare Kernmenge reduziert
- Dokumentation konsolidiert und auf Deutsch vereinheitlicht

## Empfohlene nächste Schritte

1. Service-Grenzen weiter schärfen (insb. Plot- und Marktlogik)
2. Testabdeckung für Integrationspfade erhöhen
3. Fehlertexte und Logs standardisieren
4. Konfigurationsschema versionieren

## Risiken

- Build in isolierten Umgebungen ohne Maven-Central-Zugriff bleibt eingeschränkt
- Altdatenmigrationen können zusätzliche Tests erfordern

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
