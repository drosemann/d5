# d5 Super-App Port — Full Report

Goal: merge everything under `!Coding-Enviroment` into the single `d5` web
app without deleting any feature or app. Status at write time: implementation
complete, statically verified, **not yet browser-tested** (see Blockers).

## 1. Scope inventory (what was found)

- **76 git repos** under `!Coding-Enviroment` (already merged into `projects/`
  in an earlier session, histories preserved via subtree).
- **73 additional non-git project folders** (plain folders, no `.git`):
  games (2048, snake, ping pong, …), websites, PHP apps, learning exercises,
  Minecraft plugins, Python tools. These were **not** in `projects/` yet.
- Total: **149 projects**. `!Coding-Enviroment` itself was never modified —
  folders were copied, not moved.

## 2. Changes made (this session)

### 2.1 Merge — 73 folders copied into `projects/`

`Copy-Item` of every non-git leaf project to `projects/<slug>/`, slug =
lowercased, sanitized folder path (same convention as the existing 76).
`projects/` went from 76 → **149 folders**. One temp file used during the
merge (`tools/new-entries.txt`) was deleted afterwards.

### 2.2 Catalog — 73 entries appended

`app/catalog.json` and `app/catalog.js` (same data, JS file assigns
`window.D5_CATALOG`): 76 → **149 entries**. Fields per entry: slug, name,
category (top folder), stack (detected from file extensions), status,
path, hasReadme, hasLicense. One correction: `archive-unsorted-helloworld`
is labeled a plain Java sample, not Minecraft code. JSON validity verified
by parsing (`ConvertFrom-Json`, 149 entries, no errors).

### 2.3 Web app shell (`app/`)

| File | Change |
|---|---|
| `app/index.html` | Rebranded ShadowCore → **d5**, top nav (Home / Catalog / Tools), loads `catalog.js`, `tools.js`, `games.js`, `apps.js`, `apps2.js`, `app.js` |
| `app/styles.css` | Restyled for the new views (nav, tool forms, game/tool cards, data tables, iframe frames) |
| `app/app.js` | Hash router (`#/`, `#/catalog`, `#/project/<slug>`, `#/tools`, `#/tool/<id>`, `#/go/<code>`); `RUNNABLE` entry-file map; `PORTED` slug→tool map; per-project source-viewer with README fetch + file browser + `SOURCE_WHY` reasons; mount-stale guards not needed here (views are sync) |
| `app/tools.js` | Unchanged from prior session: 6 Python-CLI ports (Calculator, BMI, Bruch, Tokyo fares, Verbrauch, Wetter parser) |
| `app/games.js` | **New.** Snake, Tic-Tac-Toe, Ping Pong (canvas). Includes `__mount` token so stale loops/listeners retire on navigation |
| `app/apps.js` | **New.** Guestbook, Login demo, Link Shortener + `#/go` resolver |
| `app/apps2.js` | **New.** Splitwise, Speedtest, Sortier-Planer, ToDo, encrypted notes, edge-payload decoder |
| `docs/INTEGRATION.md` | Header rewritten: runtime layout (30/21/98), what runs vs what doesn't and why |
| `docs/D5-PORT-REPORT.md` | This file |

### 2.4 Bug fixes found by review (before any user report)

- `RUNNABLE` previously contained 7 Vite/React **stub** `index.html` files
  (talkativecloud, d5niel, portfolio, PhotoShare, ShareBox, Forumino,
  it-security-learning-platform) that render blank — removed.
- `RUNNABLE` previously pointed some projects at folder roots whose real
  entry lives deeper (Stranded Horizons → `game.html`, uptime-site →
  `public/index.html`, ClearCall → `client/index.html`, etc.) — mapped.
- Guestbook was both embedded (broken PHP backend) and ported — embed
  removed so the working native port wins.
- Game loops/intervals kept running after navigating away — stale-mount
  guards added in `games.js`.

## 3. What runs where (149 projects)

### 3.1 Runs embedded in d5 — 30 projects (iframe, standalone link included)

super-fast-ai-chat, gpt-5-mini-game, 10billionvaluation, CascadeProjects
(`windsurf-project/index.html`), landing-page-revamp, 2048, browser game,
color cascade (`color-cascade/index.html`), guess the number, Hangmen,
shooter, tank shooter, hosting-club-site (×2 copies), uptime-site
(`public/index.html`), netip.cloud, ai-chat-webui, stranded-horizons
(`game.html`), CSSundHTML, fun_ccna_learning, Internetwebsite,
MinecraftSeite, personal-website, ShadowUnity Website, Website,
SecureStream VPN (`client/index.html`), zapfile (`indexs.html`),
online-game-frontend, audio_visualizer, ClearCall (`client/index.html`).
Every entry file was read and confirmed: no build stubs, no server
templates.

### 3.2 Ported to native in-app tools — 21 projects → 18 tool pages

| Tool (`#/tool/<id>`) | Source project(s) | Notes |
|---|---|---|
| calculator | archive-unsorted-calculator | 25 ops; original ops 22/23 were dead code, implemented in port |
| bmi | archive-unsorted-bodymassindex | Thresholds verbatim incl. the 24.9–25 gap falling through to Adipositas (original behavior) |
| bruch | archive-unsorted-die_klasse_bruch | gcd reduce instead of trial division |
| tokyo | archive-unsorted-tokyo-metro-pricing | Adult/child fares |
| verbrauch | archive-unsorted-kilometerz-hler | Also covers the duplicate `Kilometerzähler` folder (same 1-file tool) |
| wetter | archive-unsorted-wetter-daten-analyse | Parser + sort only; scratch-file text-diff helper not ported |
| snake | browser-games-snake | Working German `main()`; broken first draft in file ignored |
| tictactoe | browser-games-tic-tac-toe (both files) | Human X vs random bot + score tally (superset of both files) |
| pong | browser-games-ping-pong | Start screen, W/S vs AI, angled bounces ×1.1, first to 5, points shop (keys 1/2) |
| guestbook | archive-unsorted-guestbook-html-css-javascript | Validation + BBCode + stats; localStorage replaces PHP/MySQL; weather key, voice, maps, dead WebSocket dropped (placeholders) |
| signin | archive-unsorted-php-signin | Local demo auth (original PHP was a non-functional stub) |
| shortener | link shortener **and** Shortify (same feature) | base62 6-char codes, visit counter, in-app resolve |
| splitwise | productivity-sharing-apps-splitwise | Equal splits, balances (paid − share), settle-up; localStorage replaces SQLite |
| speedtest | speedtest **and** speedsnap (same feature) | Live ping + download; upload reported honestly when static host rejects POST |
| sorting | sorting-script | Same extension map; file picker + grouped plan + downloadable `.ps1`/`.sh` move scripts (browser cannot move user files) |
| todo | react-todo **and** ToDo Django (same feature) | Add/edit/delete/done; localStorage |
| notes | productivity-&-sharing-apps-notenest | AES-GCM notes, password-derived key (replaces SECRET_KEY server model) |
| dataopt | utilities-&-desktop-tools-data-optimization | Decodes the documented compact JSON schema |

### 3.3 Source-only with in-app source view — 98 projects

Each `#/project/<slug>` page states the reason, shows the README if present,
and embeds the project folder for file browsing. Groups:

- **Java/Minecraft (33):** all Paper/Spigot plugins, server systems, game
  concepts (ApocalypseUnleashed, Challenges_Source, Hearthrift), streuland,
  bedrock/python `pillars-of-fortune` (.jar only), `HelloWorld` sample,
  SessionLock. Reason: no browser Java runtime.
- **Python server/desktop/pygame (29):** Flask AI chats, forum-for-nerds
  stack, aktienwerk, drachen-im-asphalt, goose, infra-pilot,
  old-python-openworldminigame, WebScrapeMaster, ToDo Django (feature runs
  as the ToDo tool), spammer (pyautogui OS keys — impossible + unwanted in
  browser), katzen_python (file itself is corrupted/mojibake), TraumaLang C
  sources, 122 MB chat-log data bundle. Reason per project in `SOURCE_WHY`.
- **Web/JS needing build or backend (28):** all React/Vite/Next/TSX sources
  (talkativecloud, d5niel, portfolio, ui-optimization, ai-productivity-
  dashboard, blog-forum-with-z.ai, …), Flutter cooperating-screen, Flask
  templates (picHosty, video platform), chat-app, tamagotchi (backend +
  secrets), NoteNest server (feature runs as notes tool). Reason: no
  runnable bundle checked in, or server required.
- **Other (8):** drosemann (md+jpg only), llama coder (empty folder),
  NexArena (one-line README), secure-vps-setup (run on a server),
  document-recovery (run in PowerShell), vercel-clone scaffold, ArnoldC
  esolang ecommerce, online-game-backend stubs.
- **PHP (1):** sandstone-remover-pocketmine. (Guestbook, signin, shorteners,
  zapfile frontend are covered above as embeds/ports.)

## 4. Blockers

1. **No JS runtime in this sandbox — browser verification impossible here.**
   Tried, in order: node (not installed), Python (broken WindowsApps shim),
   cscript parse check (access denied on settings load), headless Firefox
   screenshots (process hangs on profile/cert lock; killing it denied),
   .NET file APIs (constrained language mode), deno/bun/qjs (absent).
   Escalated per repo rules after repeated failures. **Needed:** open the
   app in a real browser (serve repo root, open `app/`) and report errors,
   or provide a working runtime.
2. **Server-backed features cannot run from a static page** (Discord bots
   need tokens, Flask/Django need Python, PHP needs a PHP+SQL host,
   pyautogui/OS automation is outside browser capability). Resolved by
   documented local equivalents (localStorage, WebCrypto, generated move
   scripts) or honest source-only pages — no fake backends were built.
3. **Two `Copy-Item`/`Set-Content` quirks** hit during the work (sandbox temp
   path, CRLF mismatches, a truncated write): all repaired and re-verified;
   no stray files remain (temp entry list and verify harness deleted).

## 5. Verification log (evidence, not claims)

- `catalog.json` parses: 149 entries (was 76).
- All 30 `RUNNABLE` entry files exist on disk; each was read (no stubs).
- All 18 tool views + resolver + source-viewer present and modules closed
  (tail checks); `PORTED` slugs all in catalog; no slug in two buckets
  (30 + 21 + 98 = 149).
- `tools/new-entries.txt`, `app/__verify.html` removed; `!Coding-Enviroment`
  untouched (copies only).
- **Not done:** executing any page in a browser (blocked, §4.1).

## 6. How to verify (for the user)

Serve the repo root (not `app/`, so `../projects/…` links resolve), e.g.
`python -m http.server` in `d5/`, then open `app/`: Home stats, Catalog
filters (incl. kind filter), one embed page, every `#/tools` entry
(especially pong keys W/S + 1/2, speedtest, notes decrypt with wrong vs
right password), one source-only page (README + files + reason).

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
