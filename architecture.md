# d5 — Architecture

d5 is a super-app ecosystem — one connected app (like a social super-app in the Twitter/WeChat sense) whose surfaces are the merged projects, not a launcher that merely points elsewhere. Status, identity, and data flow through one shell: the catalog is the shared registry, the native tools are the built-in features, and `localStorage` keys (`d5:*`) are the currently-shared state layer. It is intentionally a monorepo: every historical project under `projects/` is preserved with its original Git history (merged via `git subtree` on one `main`) and wired into the ecosystem as an embedded surface, a native tool, or a source-view surface.

## Layout

| Path | Role |
| --- | --- |
| `app/` | The super-app shell — a framework-free single-page app (hash routing: `#/`, `#/catalog`, `#/project/<slug>`, `#/tools`, `#/tool/<id>`). No build step: open `app/index.html` or `python -m http.server 8000 --directory app`. Catalog data in `app/catalog.json` + `app/catalog.js` is the ecosystem registry. |
| `app-solid/` | SolidJS + Vite re-implementation of the same super-app shell (same catalog/tools parity target). Scripts in its own `package.json` (`npm --prefix app-solid run dev/build`). Its root `package.json` at repo root proxies to it via `build:solid` / `dev:solid`. |
| `projects/` | Source of truth for all 152 merged projects. Static web projects are embedded surfaces via iframe (entries listed as `RUNNABLE` in `app/app.js`); ported desktop/server projects run as native in-browser features under `#/tools`; everything else is source-only with an in-app source view and a stated reason (`sourceWhy()` in `app/app.js`). Per-project status in `docs/INTEGRATION.md`. |
| `d5lang/` | The D5 language — a small C99 interpreter/compiler (`d5lang.c`, built with plain `gcc` via `Makefile`: `make -C d5lang build`, `make -C d5lang test`). Spec in `d5lang/spec/`; examples in `d5lang/examples/`. |
| `d5lang-port/` | D5-language ports/docs of the launcher (`app/*.d5`, generated from `app/`). Not yet the runtime; kept for language dogfooding and documentation. |
| `services/` | Backend/service helpers referenced by some projects. |
| `tools/` | Repo-local tooling scripts (merge/port helpers). |
| `meta-trip/` | Non-code content (trip planning docs) kept in-repo for completeness. |
| `generated_images/` | Assets used by UI/landing pages. |
| `docs/` | Integration and port reports (`D5-PORT-REPORT.md`, `GOOSE-PORT-REPORT.md`, …). |
| `.github/workflows/` | CI (`.github/workflows/ci.yml`): syntax checks for `app/`, build `app-solid/`, build+test `d5lang/`, `verify_port.py` parity. |

## Runtime data flow (super-app shell)

`app/index.html` → `app/app.js` (router) → `app/catalog.json` (project registry: slug, folder, stack) + per-area scripts (`app/tools.js`, `app/games.js`, `app/mc-*.js`, `app/apps*.js`, `app/trip.js`). Embedded surfaces load from `projects/<slug>/…` relative paths, which is why the repo root must be served (not just `app/`) when following links into `projects/`. Native features (Guestbook, Login, Link Shortener, Splitwise, ToDo, NoteNest, games) persist via `localStorage` under the shared `d5:` prefix (`storeGet`/`storeSet` helpers) — that prefix is the ecosystem's current connective tissue: one state namespace every feature reads/writes. Ports replace server backends (MySQL/SQLite/PHP/Flask) with `localStorage` + WebCrypto where noted in `docs/INTEGRATION.md`. A server-backed shared state (profiles, feed, graph) is the natural next step beyond this single-device layer.

## History model

One `main` branch with `git subtree` merges per project (original hashes/authors preserved), plus mirrored refs under `refs/projects/<project>/` so side branches/tags survive (`git log --all`). Four source repos had no readable history and were imported as labeled snapshot commits — see `README.MD` § “How the merge was done”.

## Run

```powershell
npm run dev        # launcher on :8000 (app/)
npm run dev:solid  # SolidJS launcher (app-solid/)
make -C d5lang build
```
