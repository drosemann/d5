# d5 — SolidJS port

Full port of the vanilla `app/` super-app to [SolidJS](https://github.com/solidjs/solid)
(fine-grained reactivity, no virtual DOM), built with Vite + `vite-plugin-solid`.

## What moved

- `src/App.jsx` — hash router (`#/`, `#/tools`, `#/catalog`, `#/project/<slug>`, `#/tool/<id>/<arg>`, `#/go/<code>`), home with unified search, recents, favorites, sections, library shelf, project detail with embed/README, go-redirect.
- `src/tools/CalcTools.jsx` — Calculator, BMI Rechner, Klasse Bruch, Tokyo Metro Pricing, Kilometerzähler, Wetter Daten Analyse.
- `src/tools/Games.jsx` — Snake, Tic-Tac-Toe, Ping Pong, Hangman, Guess the Number, 2048, TankBlaster, Tamagotchi, Audio Visualizer, Theme Park Tycoon.
- `src/tools/McGames.jsx` — BedWars, BuildFFA, ClanWars (native web rewrites).
- `src/tools/Apps.jsx` — Guestbook (BBCode), Login Demo, Link Shortener + `#/go` resolver.
- `src/tools/Apps2.jsx` — Splitwise, Speedtest, Sortier-Planer, ToDo, NoteNest (AES-GCM), Edge-Payload-Decoder.
- `src/tools/McTools.jsx` — SessionLock, Tablist, Autosaver, BroadcastRestart, ChestSpawner, RandomItem, QuestSystem, Lobby, DirectServerConnect, Elytra, Horden, MinigameTemplate, AntiCheat, RoleSync, SandstoneRemover, ArenaAutoReset, LocateStructure, TNTRemover, VoiceChat, HelloWorld, Pseudocode Runner.
- `src/tools/McMisc.jsx` — PillarsOfFortune, ApocalypseUnleashed, Hearthrift, RealmOfWonders, Challenges, Streuland Invites.
- `src/tools/Trip.jsx` + `src/trip-data.js` — Trip to the Makers, all 7 tabs, EN/DE, checklist state in localStorage.
- `src/logic.js` — pure logic from `app/tools.js` (calc/bmi/fractions/tokyo/verbrauch/wetter/pseudo).
- `src/catalog.js` — 151 library entries, generated from `app/catalog.js`.
- `src/styles.css` — same dark theme as the vanilla app.
- `vite.config.js` — dev middleware also serves the repo siblings (`/projects/...`, `/app/...`, `/catalog.json`, `/catalog.js`), so embeds, README fetches and speedtest probes work exactly like before (`../projects/...`).

The original `app/` vanilla build is untouched and still works standalone.

## Run

Requires Node.js 18+:

```powershell
cd app-solid
npm install
npm run dev
```

Then open http://localhost:5173/ in your browser.

Production build:

```powershell
npm run build
npm run preview
```

## Notes

- Timers, intervals, `requestAnimationFrame` loops and keyboard listeners are cleaned up with `onCleanup`, so leaving a tool page never leaks a loop.
- All persistence keys match the vanilla app (`d5:*`, `d5_fav`, `d5_recent`, `d5-trip-checklist`, …), so existing favorites/recents keep working in both versions.
- `#/go/<code>` shortlinks resolve the same way (visit counter + redirect).
