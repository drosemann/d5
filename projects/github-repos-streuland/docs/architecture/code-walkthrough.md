# Code-Walkthrough

Dieser Walkthrough hilft beim schnellen Einstieg in die Codebasis.

## 1. Einstiegspunkt

- **Datei:** `src/main/java/de/streuland/StreulandPlugin.java`
- Verantwortlich für Lebenszyklus (`onEnable`, `onDisable`) und Service-Verdrahtung.

## 2. Plot-Domäne

- `plot/PlotManager.java` – zentrale Geschäftslogik
- `plot/Plot.java`, `plot/PlotData.java` – Datenmodell
- `plot/PlotStorage.java` – Persistenz
- `plot/SpatialGrid.java` – räumliche Suche/Index

Typischer Einstieg für Features: zuerst `PlotManager`, dann abhängige Services prüfen.

## 3. Commands

- `command/PlotCommandExecutor.java`
- `commands/` enthält zusätzliche Unterbefehle (`PlotTeamCommand`, `PlotMarketCommand`, ...)

Bei Änderungen an Nutzerflüssen:
1. Command-Parsing prüfen
2. Validierung in Services halten
3. Rückmeldungen in `messages_*.yml` konsistent ergänzen

## 4. Schutz und Events

- `listener/ProtectionListener.java`
- weitere Listener für Nebenfunktionen (z. B. Block-Änderungen)

Regel: Schutzentscheidungen zentralisieren, keine verteilte Ad-hoc-Logik.

## 5. Erweiterungsmodule

- `market/` und `plot/market/` – Marktfunktionen
- `approval/` – Freigabeprozesse
- `backup/` und `plot/snapshot/` – Sicherung/Wiederherstellung
- `dashboard/` und `web/` – HTTP/WS-Ausgabe
- `rules/` – regelbasierte Bedingungen/Aktionen

## 6. Tests

- **Ort:** `src/test/java/de/streuland/...`
- Unit-Tests für Services, Integrationstests für Flows
- Mocking über Mockito und MockBukkit

## 7. Änderungs-Checkliste

Vor dem Merge:

1. Maven-Build ausführen
2. Betroffene Tests ausführen
3. Doku und Konfiguration aktualisieren
4. PR mit Issue-Verlinkung, Testnachweis und Risikohinweis erstellen

## 8. Häufige Stolpersteine

- Ungültige Maven-Konfigurationen (duplizierte/deformierte Dependency-Einträge)
- Asynchrone Logik ohne saubere Fehlerpropagierung
- Inkonsistente Nachrichten zwischen Deutsch/Englisch

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
