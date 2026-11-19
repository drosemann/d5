# d5 — Vision

I tinkedered the last few weeks on this. Thats why no other commits were made :D

## Why d5 exists

Years of experiments, tools, games, dashboards, bots, plugins, and sites — each started alone, each with its own repo, README, and license — should be one living app, not a folder of silos. d5 is a super-app ecosystem in the Twitter/WeChat sense: one connected app whose surfaces are the merged projects, so a guestbook post, a shared link, a split bill, a note, and a game score all live in the same place and can reference each other.

## Principles

1. **One app, many surfaces.** The shell in `app/` is the app; `projects/` supplies its surfaces — embedded web projects, native features under `#/tools`, and source-view surfaces for the rest. The catalog is the registry that ties them into one ecosystem, not a directory of links.
2. **Everything somewhat connected.** Native features already share state through `localStorage` keys under the `d5:` prefix (`app/app.js` `storeGet`/`storeSet`, `app/apps.js`). The direction is toward real shared layers — profiles, feed, graph, sharing — on top of that current single-device glue.
3. **Preserve everything.** Nothing is deleted to make room for the new. Original commits, authors, and dates stay in `git log`; side branches live on under `refs/projects/<project>/`. Porting adds a new runnable form; it never deletes the original.
4. **Honest status.** `docs/INTEGRATION.md` says per project what runs, what was ported, and what is still standalone (planned rewrites: Java plugins → browser game, Python apps → the app, websites → the app). “Integrated” means verified, not assumed.
5. **Dogfood the language.** `d5lang/` exists because porting kept hitting the same pain. `d5lang-port/` ports the app to D5 itself — the language and the super-app grow together.

## Where it is going

- Finish the per-project rewrites listed in `docs/INTEGRATION.md` so the “standalone for now” backlog keeps shrinking and more surfaces become first-class features.
- Deepen the connective tissue: shared profile over the existing login demo, cross-feature references over the `d5:` store, then a server-backed layer (feed, graph, sync) when that becomes the constraint.
- Keep the SolidJS re-implementation (`app-solid/`) at parity with the framework-free shell (`app/`) — same registry, same features, same status claims.
- Keep `README.MD` as the concatenated project index and `ALL-LICENSES.md` as the license collection, so a fresh clone answers “what is this, who wrote it, under what terms?” without archaeology.

## Non-goals

- Not a rewritten history: project commits keep their original hashes; the combined timeline is a mirror of branches, not a re-timestamped squash.
- Not slimming the repo for its own sake. Size is the cost of preservation; see `memory.md` § “Gotchas” before proposing deletions.
