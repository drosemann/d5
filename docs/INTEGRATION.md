# d5 - Integration status

Rebranded from ShadowCore to **d5**. `app/` is now a single-page app with hash routing (`#/`, `#/catalog`, `#/project/<slug>`, `#/tools`, `#/tool/<id>`). Serve the repo root (not just `app/`) so relative links to `projects/` resolve.

## Runtime layout (what actually runs now)

152 projects are catalogued (`app/catalog.json` + `app/catalog.js`): 76 merged git repos, 73 non-git folders copied from `!Coding-Enviroment` into `projects/`, plus later additions (ai-chat-website-ai, open-world-minigame, volcan-chico — the latter is the former `app/` hot-sauce site, moved aside when the d5 router shell was restored). Nothing was deleted; originals stay in `projects/`.

- **30 static web projects run inside d5**, embedded via iframe with a standalone fallback link (see `RUNNABLE` in `app/app.js`, value = entry file). Every entry was verified by reading the file: no build stubs, no server templates. React/Vite/Next sources (talkativecloud, d5niel, portfolio, PhotoShare, …) are NOT embedded — their `index.html` files are unbuilt stubs that render blank.
- **Ported to working in-browser tools** served under `#/tools` (48 tool pages): Calculator (25 ops), BMI Rechner, Klasse Bruch, Tokyo Metro Pricing, Kilometerzähler, Wetter Daten Analyse (`app/tools.js`); Snake, Tic-Tac-Toe (human X vs random bot + tally), Ping Pong with points shop (`app/games.js`); BedWars, BuildFFA, ClanWars (`app/mc-games.js`); 21 server-system rewrites — SessionLock, Tablist, Autosaver, BroadcastRestart, ChestSpawner, RandomItem, QuestSystem, Lobby+ConnectHub, DirectServerConnect, Elytra, Horden, MinigameTemplate, AntiCheat, RoleSync, SandstoneRemover, ArenaAutoReset, LocateStructure, TNTRemover, VoiceChat, HelloWorld, Pseudocode Runner (`app/mc-tools.js`); PillarsOfFortune, ApocalypseUnleashed, Hearthrift, RealmOfWonders, Challenges, Streuland invites (`app/mc-misc.js`); Guestbook (BBCode + validation, localStorage instead of PHP/MySQL), Login Demo (local auth instead of the PHP stub), Link Shortener (base62 + visit counter), Splitwise (equal splits, balances, settle-up), Speedtest (live ping + download; upload reported honestly when the static host rejects POST), Sortier-Planer (same extension map, exports `.ps1`/`.sh` move scripts since the browser cannot move user files), ToDo, NoteNest (AES-GCM notes, password-derived key), Edge-Payload-Decoder (`app/apps.js`, `app/apps2.js`). Where the originals used MySQL/SQLite or a server backend, the ports use localStorage.
- Faithful-port notes: Calculator ops 22/23 were dead code in the original (listed but never dispatched) and are implemented in the port; BMI thresholds are copied verbatim including the 24.9–25 gap that falls through to Adipositas; Bruch reduce uses gcd instead of the original trial-division loop. Dropped placeholder limbs are documented per-tool in code comments.
- **The rest are source-only with an in-app source view** (README preview + a per-project reason via `sourceWhy()` in `app/app.js`): Flutter/Dart, C/TraumaLang, server-backed Flask/Django/Next apps, Discord bots, PHP backends without a static frontend, desktop/OS-level tools (pyautogui, keyboard automation, PowerShell scripts), shell setup scripts, empty or corrupted sources (llama coder, katzen_python), and data dumps. No Java/Minecraft entry is source-only anymore — each one either runs as a native port under Tools or is embedded (browser-game hub). Each page states plainly why it cannot run in the browser.

## Previous rules (kept for per-project history below)

ShadowCore is one repository and one launcher/catalog app. Not every merged project can run inside that app yet. This file says, per project, what it is and what is planned. Nothing here claims a project is integrated when it is not.

## Rules

- Web/JS projects: candidates to integrate into the ShadowCore web app.
- Java / Minecraft plugins: standalone for now. Planned: rewrite them to work in the browser game.
- Python apps: standalone for now. Planned: port them to work in the app.
- Websites: planned to integrate into the app instead of staying separate sites.
- Everything else: standalone module in `projects/`, runnable on its own terms if at all.
- History note: project histories were merged with `git subtree` (original commits preserved, combined via merge commits on one `main`). Four repos had no readable history (`ai assistant (flask)`, `chat`, `chat app`, `ClearCall`) and were imported as file snapshots only.

## ai assistant html, css, javascript, python (flask) for openai api

- Category: AI & LLM Projects
- Stack: Python, Web/JS
- Folder: `projects/ai-&-llm-projects-ai-assistant-html,-css,-javascript,-python-(flask)-for-openai-api`
- Status: Standalone for now: Python app. Planned port into the ShadowCore app.

## chat

- Category: AI & LLM Projects\ai chat website
- Stack: Python, Web/JS
- Folder: `projects/ai-&-llm-projects-ai-chat-website-chat`
- Status: Standalone for now: Python app. Planned port into the ShadowCore app.

## super-fast-ai-chat

- Category: AI & LLM Projects\ai chat website
- Stack: Web/JS
- Folder: `projects/ai-&-llm-projects-ai-chat-website-super-fast-ai-chat`
- Status: Web project: candidate to integrate into the ShadowCore web app.

## talkativecloud

- Category: AI & LLM Projects\ai chat website
- Stack: Web/JS
- Folder: `projects/ai-&-llm-projects-ai-chat-website-talkativecloud`
- Status: Web project: candidate to integrate into the ShadowCore web app.

## gpt-5-mini-game

- Category: AI & LLM Projects
- Stack: Web/JS
- Folder: `projects/ai-&-llm-projects-gpt-5-mini-game`
- Status: Web project: candidate to integrate into the ShadowCore web app.

## web-scraping-chatbot

- Category: AI & LLM Projects
- Stack: Python, Web/JS
- Folder: `projects/ai-&-llm-projects-web-scraping-chatbot`
- Status: Standalone for now: Python app. Planned port into the ShadowCore app.

## bodymassindex

- Category: Archive - Unsorted
- Stack: Python
- Folder: `projects/archive-unsorted-bodymassindex`
- Status: Standalone for now: Python app. Planned port into the ShadowCore app.

## calculator

- Category: Archive - Unsorted
- Stack: Python
- Folder: `projects/archive-unsorted-calculator`
- Status: Standalone for now: Python app. Planned port into the ShadowCore app.

## chat app

- Category: Archive - Unsorted
- Stack: Web/JS
- Folder: `projects/archive-unsorted-chat-app`
- Status: Web project: candidate to integrate into the ShadowCore web app.

## die_klasse_bruch

- Category: Archive - Unsorted
- Stack: Python
- Folder: `projects/archive-unsorted-die_klasse_bruch`
- Status: Standalone for now: Python app. Planned port into the ShadowCore app.

## drachen-im-asphalt

- Category: Archive - Unsorted
- Stack: Python
- Folder: `projects/archive-unsorted-drachen-im-asphalt`
- Status: Standalone for now: Python app. Planned port into the ShadowCore app.

## goose-desktop-companion

- Category: Archive - Unsorted
- Stack: Python
- Folder: `projects/archive-unsorted-goose-desktop-companion`
- Status: Standalone for now: Python app. Planned port into the ShadowCore app.

## Kilometerzähler

- Category: Archive - Unsorted
- Stack: Python
- Folder: `projects/archive-unsorted-kilometerzähler`
- Status: Standalone for now: Python app. Planned port into the ShadowCore app.

## Kilometerz-hler

- Category: Archive - Unsorted
- Stack: Python
- Folder: `projects/archive-unsorted-kilometerz-hler`
- Status: Standalone for now: Python app. Planned port into the ShadowCore app.

## modernize-website-design

- Category: Archive - Unsorted
- Stack: Web/JS
- Folder: `projects/archive-unsorted-modernize-website-design`
- Status: Web project: candidate to integrate into the ShadowCore web app.

## Rebioot

- Category: Archive - Unsorted
- Stack: Web/JS
- Folder: `projects/archive-unsorted-rebioot`
- Status: Web project: candidate to integrate into the ShadowCore web app.

## tokyo-metro-pricing

- Category: Archive - Unsorted
- Stack: Python
- Folder: `projects/archive-unsorted-tokyo-metro-pricing`
- Status: Standalone for now: Python app. Planned port into the ShadowCore app.

## wetter-daten-analyse

- Category: Archive - Unsorted
- Stack: Python
- Folder: `projects/archive-unsorted-wetter-daten-analyse`
- Status: Standalone for now: Python app. Planned port into the ShadowCore app.

## browser game

- Category: Browser Games
- Stack: Java, Web/JS
- Folder: `projects/browser-games-browser-game`
- Status: Standalone for now: Minecraft/Java code. Planned rewrite for the ShadowCore browser game.

## online-game-backend

- Category: Browser Games\browser game
- Stack: Other
- Folder: `projects/browser-games-browser-game-online-game-backend`
- Status: Standalone module: kept as-is, integration not yet planned in detail.

## tamagotchi-game

- Category: Browser Games
- Stack: Web/JS
- Folder: `projects/browser-games-tamagotchi-game`
- Status: Web project: candidate to integrate into the ShadowCore web app.

## aktienwerk

- Category: Cloud, Hosting & SaaS
- Stack: Python
- Folder: `projects/cloud,-hosting-&-saas-aktienwerk`
- Status: Standalone for now: Python app. Planned port into the ShadowCore app.

## hosting-club-discord-bot

- Category: Cloud, Hosting & SaaS
- Stack: Web/JS
- Folder: `projects/cloud,-hosting-&-saas-hosting-club-discord-bot`
- Status: Web project: candidate to integrate into the ShadowCore web app.

## hosting-club-redesign

- Category: Cloud, Hosting & SaaS
- Stack: Web/JS
- Folder: `projects/cloud,-hosting-&-saas-hosting-club-redesign`
- Status: Web project: candidate to integrate into the ShadowCore web app.

## hosting-club-site

- Category: Cloud, Hosting & SaaS
- Stack: Web/JS
- Folder: `projects/cloud,-hosting-&-saas-hosting-club-site`
- Status: Web project: candidate to integrate into the ShadowCore web app.

## hosting-club-redesign

- Category: Cloud, Hosting & SaaS\hosting-software
- Stack: Web/JS
- Folder: `projects/cloud,-hosting-&-saas-hosting-software-hosting-club-redesign`
- Status: Web project: candidate to integrate into the ShadowCore web app.

## hosting-club-site

- Category: Cloud, Hosting & SaaS\hosting-software
- Stack: Web/JS
- Folder: `projects/cloud,-hosting-&-saas-hosting-software-hosting-club-site`
- Status: Web project: candidate to integrate into the ShadowCore web app.

## minisaas

- Category: Cloud, Hosting & SaaS
- Stack: Web/JS
- Folder: `projects/cloud,-hosting-&-saas-minisaas`
- Status: Web project: candidate to integrate into the ShadowCore web app.

## secure-vps-setup

- Category: Cloud, Hosting & SaaS
- Stack: Other
- Folder: `projects/cloud,-hosting-&-saas-secure-vps-setup`
- Status: Standalone module: kept as-is, integration not yet planned in detail.

## uptime-site

- Category: Cloud, Hosting & SaaS
- Stack: Web/JS
- Folder: `projects/cloud,-hosting-&-saas-uptime-site`
- Status: Web project: candidate to integrate into the ShadowCore web app.

## ai-chat-webui

- Category: github-repos
- Stack: Web/JS
- Folder: `projects/github-repos-ai-chat-webui`
- Status: Web project: candidate to integrate into the ShadowCore web app.

## cooperating-screen

- Category: github-repos
- Stack: Web/JS
- Folder: `projects/github-repos-cooperating-screen`
- Status: Web project: candidate to integrate into the ShadowCore web app.

## drosemann

- Category: github-repos
- Stack: Other
- Folder: `projects/github-repos-drosemann`
- Status: Standalone module: kept as-is, integration not yet planned in detail.

## ed-docs

- Category: github-repos
- Stack: Web/JS
- Folder: `projects/github-repos-ed-docs`
- Status: Web project: candidate to integrate into the ShadowCore web app.

## forgecms

- Category: github-repos
- Stack: Python, Web/JS
- Folder: `projects/github-repos-forgecms`
- Status: Standalone for now: Python app. Planned port into the ShadowCore app.

## forum-for-nerds

- Category: github-repos
- Stack: Python, Web/JS, PHP
- Folder: `projects/github-repos-forum-for-nerds`
- Status: Standalone for now: Python app. Planned port into the ShadowCore app.

## blog

- Category: github-repos\forum-for-nerds\Blog, CMS & Community Platforms
- Stack: Web/JS
- Folder: `projects/github-repos-forum-for-nerds-blog,-cms-&-community-platforms-blog`
- Status: Web project: candidate to integrate into the ShadowCore web app.

## BlogForge

- Category: github-repos\forum-for-nerds\Blog, CMS & Community Platforms
- Stack: Python, Web/JS
- Folder: `projects/github-repos-forum-for-nerds-blog,-cms-&-community-platforms-blogforge`
- Status: Standalone for now: Python app. Planned port into the ShadowCore app.

## blog-forum-with-z.ai

- Category: github-repos\forum-for-nerds\Blog, CMS & Community Platforms
- Stack: Web/JS
- Folder: `projects/github-repos-forum-for-nerds-blog,-cms-&-community-platforms-blog-forum-with-z.ai`
- Status: Web project: candidate to integrate into the ShadowCore web app.

## blog-website-frontend---backend

- Category: github-repos\forum-for-nerds\Blog, CMS & Community Platforms
- Stack: Web/JS, PHP
- Folder: `projects/github-repos-forum-for-nerds-blog,-cms-&-community-platforms-blog-website-frontend-backend`
- Status: Web project: candidate to integrate into the ShadowCore web app.

## Forumino

- Category: github-repos\forum-for-nerds\Blog, CMS & Community Platforms
- Stack: Web/JS
- Folder: `projects/github-repos-forum-for-nerds-blog,-cms-&-community-platforms-forumino`
- Status: Web project: candidate to integrate into the ShadowCore web app.

## infra-pilot

- Category: github-repos
- Stack: Python, Web/JS
- Folder: `projects/github-repos-infra-pilot`
- Status: Standalone for now: Python app. Planned port into the ShadowCore app.

## stranded-horizons

- Category: github-repos
- Stack: Python, Web/JS
- Folder: `projects/github-repos-stranded-horizons`
- Status: Standalone for now: Python app. Planned port into the ShadowCore app.

## streuland

- Category: github-repos
- Stack: Java, Web/JS
- Folder: `projects/github-repos-streuland`
- Status: Standalone for now: Minecraft/Java code. Planned rewrite for the ShadowCore browser game.

## fun_ccna_learning

- Category: Learning Projects
- Stack: Web/JS
- Folder: `projects/learning-projects-fun_ccna_learning`
- Status: Web project: candidate to integrate into the ShadowCore web app.

## it-security-learning-platform

- Category: Learning Projects
- Stack: Web/JS
- Folder: `projects/learning-projects-it-security-learning-platform`
- Status: Web project: candidate to integrate into the ShadowCore web app.

## katzen_python

- Category: Learning Projects
- Stack: Python
- Folder: `projects/learning-projects-katzen_python`
- Status: Standalone for now: Python app. Planned port into the ShadowCore app.

## pseudocode

- Category: Learning Projects
- Stack: Java, Python
- Folder: `projects/learning-projects-pseudocode`
- Status: Standalone for now: Minecraft/Java code. Planned rewrite for the ShadowCore browser game.

## python

- Category: Learning Projects
- Stack: Python
- Folder: `projects/learning-projects-python`
- Status: Standalone for now: Python app. Planned port into the ShadowCore app.

## python-code

- Category: Learning Projects
- Stack: Python
- Folder: `projects/learning-projects-python-code`
- Status: Standalone for now: Python app. Planned port into the ShadowCore app.

## TraumaLang

- Category: Learning Projects
- Stack: Python
- Folder: `projects/learning-projects-traumalang`
- Status: Standalone for now: Python app. Planned port into the ShadowCore app.

## arena-auto-reset

- Category: Minecraft Plugins & Server Systems
- Stack: Java
- Folder: `projects/minecraft-plugins-&-server-systems-arena-auto-reset`
- Status: Standalone for now: Minecraft/Java code. Planned rewrite for the ShadowCore browser game.

## bedwars

- Category: Minecraft Plugins & Server Systems
- Stack: Java
- Folder: `projects/minecraft-plugins-&-server-systems-bedwars`
- Status: Standalone for now: Minecraft/Java code. Planned rewrite for the ShadowCore browser game.

## buildffa-revamp

- Category: Minecraft Plugins & Server Systems
- Stack: Java
- Folder: `projects/minecraft-plugins-&-server-systems-buildffa-revamp`
- Status: Standalone for now: Minecraft/Java code. Planned rewrite for the ShadowCore browser game.

## clan-wars

- Category: Minecraft Plugins & Server Systems
- Stack: Java
- Folder: `projects/minecraft-plugins-&-server-systems-clan-wars`
- Status: Standalone for now: Minecraft/Java code. Planned rewrite for the ShadowCore browser game.

## locate-structure-minecraft

- Category: Minecraft Plugins & Server Systems
- Stack: Java
- Folder: `projects/minecraft-plugins-&-server-systems-locate-structure-minecraft`
- Status: Standalone for now: Minecraft/Java code. Planned rewrite for the ShadowCore browser game.

## tnt-remover

- Category: Minecraft Plugins & Server Systems
- Stack: Java
- Folder: `projects/minecraft-plugins-&-server-systems-tnt-remover`
- Status: Standalone for now: Minecraft/Java code. Planned rewrite for the ShadowCore browser game.

## d5niel

- Category: Personal & Client Websites
- Stack: Web/JS
- Folder: `projects/personal-&-client-websites-d5niel`
- Status: Web project: candidate to integrate into the ShadowCore web app.

## jonathan-site

- Category: Personal & Client Websites
- Stack: Web/JS
- Folder: `projects/personal-&-client-websites-jonathan-site`
- Status: Web project: candidate to integrate into the ShadowCore web app.

## portfolio

- Category: Personal & Client Websites
- Stack: Web/JS
- Folder: `projects/personal-&-client-websites-portfolio`
- Status: Web project: candidate to integrate into the ShadowCore web app.

## link shortener

- Category: Productivity & Sharing Apps
- Stack: PHP
- Folder: `projects/productivity-&-sharing-apps-link-shortener`
- Status: Standalone module: kept as-is, integration not yet planned in detail.

## NoteNest

- Category: Productivity & Sharing Apps
- Stack: Web/JS
- Folder: `projects/productivity-&-sharing-apps-notenest`
- Status: Web project: candidate to integrate into the ShadowCore web app.

## PhotoShare

- Category: Productivity & Sharing Apps
- Stack: Web/JS
- Folder: `projects/productivity-&-sharing-apps-photoshare`
- Status: Web project: candidate to integrate into the ShadowCore web app.

## ShareBox

- Category: Productivity & Sharing Apps
- Stack: Web/JS
- Folder: `projects/productivity-&-sharing-apps-sharebox`
- Status: Web project: candidate to integrate into the ShadowCore web app.

## Shortify

- Category: Productivity & Sharing Apps
- Stack: PHP
- Folder: `projects/productivity-&-sharing-apps-shortify`
- Status: Standalone module: kept as-is, integration not yet planned in detail.

## OLD-party-planner

- Category: Startup & Business Concepts
- Stack: Web/JS
- Folder: `projects/startup-&-business-concepts-old-party-planner`
- Status: Web project: candidate to integrate into the ShadowCore web app.

## online-game-backend

- Category: Startup & Business Concepts
- Stack: Other
- Folder: `projects/startup-&-business-concepts-online-game-backend`
- Status: Standalone module: kept as-is, integration not yet planned in detail.

## online-game-frontend

- Category: Startup & Business Concepts
- Stack: Web/JS
- Folder: `projects/startup-&-business-concepts-online-game-frontend`
- Status: Web project: candidate to integrate into the ShadowCore web app.

## Party Planner

- Category: Startup & Business Concepts
- Stack: Web/JS
- Folder: `projects/startup-&-business-concepts-party-planner`
- Status: Web project: candidate to integrate into the ShadowCore web app.

## party-planner

- Category: Startup & Business Concepts\Party Planner
- Stack: Web/JS
- Folder: `projects/startup-&-business-concepts-party-planner-party-planner`
- Status: Web project: candidate to integrate into the ShadowCore web app.

## scalable-ArnoldC-ecommerce

- Category: Startup & Business Concepts
- Stack: Web/JS
- Folder: `projects/startup-&-business-concepts-scalable-arnoldc-ecommerce`
- Status: Web project: candidate to integrate into the ShadowCore web app.

## audio_visualizer

- Category: Utilities & Desktop Tools
- Stack: Web/JS
- Folder: `projects/utilities-&-desktop-tools-audio_visualizer`
- Status: Web project: candidate to integrate into the ShadowCore web app.

## ClearCall

- Category: Utilities & Desktop Tools
- Stack: Web/JS
- Folder: `projects/utilities-&-desktop-tools-clearcall`
- Status: Web project: candidate to integrate into the ShadowCore web app.

## data-optimization

- Category: Utilities & Desktop Tools
- Stack: Other
- Folder: `projects/utilities-&-desktop-tools-data-optimization`
- Status: Standalone module: kept as-is, integration not yet planned in detail.

## ui-optimization

- Category: Utilities & Desktop Tools
- Stack: Web/JS
- Folder: `projects/utilities-&-desktop-tools-ui-optimization`
- Status: Web project: candidate to integrate into the ShadowCore web app.

## youtube-downloader

- Category: Utilities & Desktop Tools
- Stack: Python
- Folder: `projects/utilities-&-desktop-tools-youtube-downloader`
- Status: Standalone for now: Python app. Planned port into the ShadowCore app.



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
