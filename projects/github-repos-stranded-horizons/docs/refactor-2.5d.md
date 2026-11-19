# Refactor 2.5D notes (issue #8)

## Renderer swap
`src/main.js` picks the renderer from `?renderer=`:
- default / `?renderer=2d` → `src/rendering/Renderer2D.js` (pixel-faithful)
- `?renderer=25d` → `src/rendering/Renderer25D.js` (shadows, depth sort, billboard anchors, camera follow + wheel zoom, optional `camera.mode = 'iso'`)

A future `Renderer3D` only needs `render(state, assets, camera)`. Simulation never
touches DOM/canvas; all world→screen mapping goes through `src/rendering/Camera.js`.

## Adding content without touching systems
- Weapon: add entry to `src/data/weapons.js`.
- Enemy: add entry to `src/data/enemies.js` (+ sprite in `src/rendering/Assets.js` image map).
- Upgrade: add def to `src/data/upgrades.js`; purchase logic is data-driven in `src/simulation/ProgressionSystem.js`.

## Simulation rules
- Time: `state.timeMs` (ms, advanced by `dt`). Never call `performance.now()` in sim.
- Randomness: use injected `ctx.rng`. Never call `Math.random()` in sim.
- Update order per frame: reload → movement → shoot → wave → enemies → projectiles → pickups → buffs → particles → collisions → derived stats.

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
