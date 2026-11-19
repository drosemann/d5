# Development Guidelines

This document outlines coding and project conventions for **Stranded Horizons**.

## 1) Code Style

- Keep formatting consistent across HTML, CSS, and JavaScript files.
- Prefer readable names and small functions.
- Add comments only where intent is not obvious from code.

## 2) Frontend Practices

### HTML

- Use semantic HTML where practical (`header`, `main`, `footer`, etc.).
- Ensure alt text is present for meaningful images.
- Keep heading order logical (`h1` → `h2` → `h3`).

### CSS

- Keep styles grouped by component or section.
- Reuse CSS custom properties for theme values when possible.
- Avoid unnecessary specificity.

### JavaScript

- Avoid polluting the global namespace beyond required bootstrapping.
- Keep gameplay values centralized and easy to tune.
- Preserve existing gameplay behavior unless intentionally changed.

## 3) Repository Hygiene

- Commit source files and documentation only.
- Do not commit generated artifacts, logs, or temporary files.
- Keep docs in sync with actual game behavior and setup instructions.

## 4) Game Scope (Current)

Stranded Horizons is currently a single-player browser survival shooter where the player:

- moves with keyboard input
- shoots enemies with mouse input
- survives waves
- buys upgrades with collected coins

Future modes or systems should be introduced incrementally with corresponding documentation updates.

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
