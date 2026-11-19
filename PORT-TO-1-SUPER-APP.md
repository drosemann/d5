# PORT-TO-1-SUPER-APP — decision log

Goal: merge everything under `!Coding-Enviroment` into the single `d5`
super-app (`app/` + `projects/` + `app/catalog.*`), then delete every
repo/feature from `!Coding-Enviroment` that is already implemented in `d5`.
Prior art: [docs/D5-PORT-REPORT.md](/absolute/path/to/docs/D5-PORT-REPORT.md)
(149 projects ported: 30 embedded, 21 native tools, 98 source-view).

Method: listed every directory in `!Coding-Enviroment` (11 top folders),
listed every folder in `projects/` with item counts, compared contents
folder-by-folder (spot-read entry files), and checked `app/catalog.json` /
`app/catalog.js` entry format. No code executed (read-only checks).

## Decisions per top folder — all ported, all deleted

| # | `!Coding-Enviroment` folder | Content | d5 state | Decision |
|---|---|---|---|---|
| 1 | AI & LLM Projects (9 items) | Flask chats, dashboards, mini-game, bots | Each has a `projects/ai-*-*` folder with matching files; `chat` minus `.git` (10 items) matches exactly | DELETE |
| 2 | Archive - Unsorted (21 items) | Calculators, BMI, guestbook, goose, drachen, WebScrapeMaster, … | All 21 in `projects/archive-unsorted-*`; 6 natively re-implemented as tools (calculator, bmi, guestbook, signin, …) | DELETE |
| 3 | Browser Games (11 items) | 2048, snake, pong, shooters, hangman, tamagotchi, … | All in `projects/browser-games-*`; snake/tictactoe/pong run as native game pages | DELETE |
| 4 | Cloud, Hosting & SaaS (11 items) | aktienwerk, hosting-club ×3, minisaas, netip.cloud, vercel-clone, LXC platform, … | All in `projects/cloud-*-*`; `hosting-software/*` kept as the two intentional duplicate copies | DELETE |
| 5 | github-repos (9 items) | ai-chat-webui, forgecms, forum-for-nerds (+5 blog/cms sub-splits), infra-pilot, stranded-horizons, … | All in `projects/github-repos-*`, incl. the 5 forum-for-nerds sub-splits | DELETE |
| 6 | Learning Projects (10 items) | CSS/HTML, CCNA, IT-security platform, python exercises, TraumaLang | All in `projects/learning-projects-*` | DELETE |
| 7 | Minecraft Game Concepts (5 items) | ApocalypseUnleashed, Challenges_Source, NexArena, open-world ×2 | All in `projects/minecraft-game-concepts-*` (source-view, no browser Java runtime) | DELETE |
| 8 | Minecraft Plugins & Server Systems (25 items) | bedwars, anticheat, lobby, questsystem, voicechat, … | All 25 in `projects/minecraft-plugins-*` (source-view) | DELETE |
| 9 | Personal & Client Websites (8 items) | d5niel, portfolio, jonathan-site, MinecraftSeite, … | All in `projects/personal-*-websites-*`; static ones embedded via iframe | DELETE |
| 10 | Productivity & Sharing Apps (10 items) | NoteNest, PhotoShare, ShareBox, shorteners, todos, splitwise | All in `projects/productivity-*-apps-*`; splitwise/todo/notes/shortener run as native tools | DELETE |
| 11 | Startup & Business Concepts (10 items) | party-planner ×2, ecommerce, VPN, video platform, zapfile, online-game ×2 | All in `projects/startup-*-concepts-*`, incl. nested `party-planner/party-planner` | DELETE |
| 12 | Utilities & Desktop Tools (10 items) | visualizer, ClearCall, SessionLock, speedtest/snap, youtube-dl, … | All in `projects/utilities-*-tools-*`; speedtest/sorting run as native tools | DELETE |

Result: 12/12 top folders fully implemented in `d5` → deleted whole tree.

## Exceptions found during comparison (resolved before deleting)

1. `AI & LLM Projects/ai chat website/AI` (`src/backend/main.py`,
   `src/frontend/App.tsx`, `src/model.py`, `requirements.txt`) — real code,
   NOT in `projects/`, NOT in catalog. Decision: PORT first
   (→ `projects/ai-&-llm-projects-ai-chat-website-ai` + 1 catalog entry in
   both `catalog.json` and `catalog.js`), then delete source with the rest.
2. `Browser Games/browser game/open world minigame` (`src/`, `config.yml`,
   `pom.xml` — Java/Maven plugin, different code from the
   `minecraft-game-concepts-open-world-minigame` Python port). Decision: PORT
   first (→ `projects/browser-games-browser-game-open-world-minigame` +
   1 catalog entry each file), then delete.
3. `AI & LLM Projects/llama coder` — empty folder, and
   `projects/ai-llm-projects-llama-coder` is equally empty. Nothing to port,
   nothing lost. Decision: DELETE with the rest.
4. `AI & LLM Projects/ai chat website/deep-research` — empty folder, no
   counterpart. Nothing to port, nothing lost. Decision: DELETE.
5. `ai chat website/chatbot…` vs top-level `chatbot html, css, javascript and
   python` — identical file sets (`app.py`, `main.py`, `static/`,
   `templates/`, …); one `projects/` copy covers both. Decision: DELETE both,
   no duplicate port.
6. `Kilometerz-hler` vs `Kilometerzähler` — same 1-file tool; one native
   `verbrauch` tool covers both (already documented in D5-PORT-REPORT §3.2).
   Decision: DELETE both.
7. `browser game/online-game-backend` and `open world minigame` subfolders —
   already ported as own `projects/` entries (backend 2 items; MC concept 15
   items); `devlog/` + `enemy/` came along inside the parent copy (dest has
   8 items). Decision: DELETE, nothing left behind.

## Catalog updates (this session)

- Appended `ai-&-llm-projects-ai-chat-website-ai` (Python, Web/JS, no
  README/license) and `browser-games-browser-game-open-world-minigame`
  (Java, no README/license) to `app/catalog.json` and `app/catalog.js`
  (same one-line style as neighboring tail entries).
- Catalog: 149 → **151 entries**.

## Deletion performed

- `Remove-Item -Recurse -Force '!Coding-Enviroment'` after the two ports
  above were copied and cataloged. `projects/` re-listed afterwards to
  confirm nothing was touched there.
- Not browser-tested (no JS runtime in this environment, see
  D5-PORT-REPORT §4.1): open `app/` via a static server and spot-check the
  two new `#/project/<slug>` pages plus one embed and one tool page.

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
