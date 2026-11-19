# API- und Kernkomponenten

## Plugin-Einstieg

### `StreulandPlugin`
- Bootstrap der Services
- Laden der Konfiguration
- Registrierung von Commands und Listenern

## Plot-Kern

### `PlotManager`
- Zentrale Fachlogik für Erstellen, Beanspruchen, Freigeben und Prüfen von Plots

### `PlotStorage`
- Persistenz der Plotdaten (Datei-basiert/YAML)

### `SpatialGrid`
- Räumlicher Index für schnelle Plot-Lookups

## Schutz und Berechtigungen

### `ProtectionListener`
- Event-basierte Block-/Interaktionsprüfungen

### `Role` / `Permission`
- Rollen- und Rechteauswertung pro Plot

## Zusätzliche Domänen

- Markt: `MarketManager`, `PlotMarketService`
- Freigaben: `PlotApprovalService`
- Backups/Snapshots: `SnapshotService`, `SnapshotManager`
- Biome/Upgrades: `BiomeBonusService`, `PlotUpgradeService`
- Dashboard/Web: `RestApiController`, `DashboardWebSocketServer`, `WebServer`

## Grundprinzipien

1. Fachlogik getrennt von Transport (Command/Web/API)
2. Persistenz hinter Services kapseln
3. Schutzregeln früh und zentral validieren
4. Seiteneffekte (I/O, Netzwerk) möglichst isoliert testen

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
