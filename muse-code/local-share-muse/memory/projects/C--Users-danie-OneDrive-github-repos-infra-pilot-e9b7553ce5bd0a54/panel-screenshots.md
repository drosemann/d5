---
type: project
---

Panel screenshots: `.github/workflows/screenshots.yml` captures `docs/screenshots/*.png` + `tour.gif` in CI (Playwright Chromium + Vite + `scripts/capture-screenshots.mjs`, Pillow for GIF) and commits back with `[skip ci]`. Triggers on every PR touching `services/management-panel/**` (no branch names) + manual dispatch. Commits PNGs back into the PR branch with `[skip ci]` (same-repo only; fork PRs get images as artifacts). No local capture needed.
<!-- GOOSE-PORT -->
## Goose-Port

Dieses Projekt ist mechanisch nach [Goose](https://github.com/aardappel/goose)
(aardappel/goose v2026.4) gespiegelt: Jede Code-Datei hat eine <name>.<ext>.goose-Schwester
mit gueltigem Goose-Programmgeruest (n main()/print, pruefbar mit goose check)
und dem VOLLSTAENDIGEN Original-Code als //-Inline-Doku. Kein Original-Code wurde
geloescht oder veraendert. Die .goose-Dateien sind mechanische Spiegel (Geruest steht
und kompiliert, Logik-Port per Hand verfeinern). Stand: 2026-11-16.
