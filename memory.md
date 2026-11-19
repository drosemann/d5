# d5 — Memory / Maintainer notes

Durable context for contributors and future sessions. Keep this file factual and short — it is the “how d5 works” complement to `README.MD` (merge history, contributor credits, full project README dump) and `docs/INTEGRATION.md` (per-project status).

## What d5 is

- A super-app ecosystem in one repo combining all of Daniel Rosemann’s projects (in the Twitter/WeChat sense: one connected app whose surfaces are the projects) — code, full Git histories (via `git subtree`), READMEs, and licenses. Not a launcher that merely points elsewhere.
- Super-app shell in `app/` (catalog = registry, `#/tools` = built-in features, `localStorage` `d5:*` keys = shared state); see `architecture.md` for the layout.
- Rebranded from ShadowCore → d5. Author also committed as DaaanielTV / danielatschool / Daniel. `Dev Coder` is the same person (temporary git config). Full contributor clarification in `README.MD` § “Contributors”.

## How to run / verify

```powershell
npm run dev            # serve app/ on :8000, open http://localhost:8000
npm run dev:root       # serve repo root (needed for links into projects/)
npm run build          # build app-solid/ (SolidJS port)
npm test               # make -C d5lang test + python app-solid/verify_port.py
npm run check          # node --check the launcher scripts
make -C d5lang build   # plain gcc, no deps
```

CI (`.github/workflows/ci.yml`) runs exactly these four lanes on push/PR to `main`. If you touch `app/*.js`, run `npm run check`; if you touch `app-solid/`, run `npm run build`; if you touch `d5lang/`, run `make -C d5lang test`.

## Conventions

- **Catalog:** adding a project means: code under `projects/<slug>/`, entry in both `app/catalog.json` and `app/catalog.js`, then README entry (the root `README.MD` concatenates all project READMEs). Serve the repo root so `projects/` relative links resolve.
- **Status honesty:** a project is “embedded” only if its entry file was verified to run without a build/server (see `RUNNABLE` in `app/app.js`); otherwise it is a native port under `#/tools` or source-only with `sourceWhy()`. Never claim integrated when it is not — update `docs/INTEGRATION.md` alongside the code.
- **Ports:** server backends (MySQL/SQLite/PHP/Flask) become `localStorage` under the shared `d5:` prefix + WebCrypto in the in-browser port. That shared prefix is the ecosystem glue — reuse its key shape for new features rather than inventing a parallel store. Keep faithful-port quirks documented (e.g. Calculator dead ops 22/23, BMI 24.9–25 gap) so future edits don’t “fix” them silently.
- **History:** preserve original commits via `git subtree`; snapshot-imported repos (ai assistant flask, chat, chat app, ClearCall) stay labeled as snapshots.
- **Docs:** per-project status → `docs/INTEGRATION.md`; port decisions → `PORT-TO-1-SUPER-APP.md`, `docs/` reports; licenses → `ALL-LICENSES.md` (root collection; each project keeps its own).

## Gotchas

- Root `.gitignore` intentionally ignores only local tooling (`.agents/`, `.muse/`, `.eden/`…) — `projects/` content is tracked on purpose, including old `.env` files with stale keys. Do not bulk-delete history or `projects/` to shrink the repo; if size becomes a problem, use `git filter-repo` on a fork and keep the original `main` intact.
- `*.goose` / `*.zimbu` files alongside counterparts are generated mirrors — don’t hand-edit them; regenerate via the `d5lang-port/` tooling.
- `app-solid/` and `app/` must stay in parity; `app-solid/verify_port.py` is the gate.
