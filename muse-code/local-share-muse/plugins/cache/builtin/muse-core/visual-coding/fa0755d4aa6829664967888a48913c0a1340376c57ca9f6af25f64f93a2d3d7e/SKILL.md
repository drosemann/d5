---
name: visual-coding
description: For building or materially changing 3D, game, Blender or video-from-code work, read this first, before a plan or any file: a 3D web page, scene or model viewer, a playable browser game (2D, 2.5D or 3D), a Blender model, scene, animation or render, or a rendered video or GIF made from code; not for 2D web pages, landing pages or UI styling (taste). It names the one skill that owns the work. Also not for the start-command and URL handoff alone (browser-app-delivery), small fixes, or review-, plan- or explanation-only turns.
user-invocable: false
---

# Visual coding: one owner per deliverable

**Do this now, before a todo list, a plan or any file:** find the deliverable in the table, call `read_skill` for its owner, and follow that owner's process to its done rule. Read a "use alongside" skill only for the technique its row names, and only when it is in your skill list.

| Deliverable | Owner: call `read_skill` now | Use alongside (technique only) |
|---|---|---|
| A playable browser game: 2D, 2.5D or 3D, one file or many | `bundled:browser-game` | For 3D parts: `bundled:web3d` construction sections and `check_page.py`; `plugin:threejs:threejs` for three.js API |
| A 3D web page, scene or model viewer that is not a game | `bundled:web3d` | `plugin:threejs:threejs` for three.js API; `bundled:game-3d-visuals` for art direction only, when the user gives a reference image or asks for a polished look |
| An object or scene recreated in Blender from a reference image the user gives | `bundled:game-3d-visuals`, which may run its pipeline | `bundled:blender` for Blender technique |
| Any other Blender model, scene, animation, render or `.blend` file | `bundled:blender` | `bundled:game-3d-visuals` for art direction only, when the user asks for a polished, art-directed result |
| A rendered video or GIF made from code (promo, explainer, trailer, logo sting); only when `bundled:code-to-video` is in your skill list | `bundled:code-to-video` | A three.js scene or Blender frames as inputs to the film |

## When more than one row fits

1. A tool or skill the user names wins: "in Blender" goes to a Blender row, a three.js page to web3d or browser-game.
2. The user plays it (controls, goals, score, win or lose): browser-game. A scene they only watch or explore is not a game.
3. A reference image to recreate in Blender: game-3d-visuals, with blender for technique. Run its long pipeline only when the user is not waiting for a quick result; for a quick look or rough draft, blender owns it. Any other `.blend` file, or a still or animation rendered by Blender: blender.
4. The deliverable is a video file (MP4, WebM, GIF): code-to-video when it is listed; otherwise the owner of the scene (blender for Blender, web3d for three.js) renders the frames.
5. Otherwise, a 3D scene that runs in a browser: web3d.

Examples: a cinematic three.js intro for a website is a page (web3d); the same intro as an MP4 is a video. A trailer for a game is a video, not a game.

## One owner, one process

- Follow only the owner's plan, checks, critic and done rule. A "use alongside" skill adds technique; never run its process, critic or stop rule as well.
- A row's owner stays the owner for the user's follow-ups on that deliverable.

## Rules for every visual task

- A newer user message wins over any skill's method. "Stop", "exit" or "cancel": answer in one sentence and make no more tool calls. "Open it": open the delivered file and stop. "Don't test" or a new plan: drop the remaining checks.
- Never install a browser. Use one already on the machine (web3d's `check_page.py` finds it), always headless, never in the user's own browser.
- Generated images are references only (a look target or concept); never ship a generated image inside the deliverable.

## Outside this family

- `bundled:taste`: the don't-list for 2D UI such as a HUD, menus or overlays; it has its own trigger.
- `bundled:browser-app-delivery`: start command, URL and handoff wording. For a game, browser-game decides the checks; use this skill only for the handoff.

<!-- GOOSE-PORT -->
## Goose-Port

Dieses Projekt ist mechanisch nach [Goose](https://github.com/aardappel/goose)
(aardappel/goose v2026.4) gespiegelt: Jede Code-Datei hat eine <name>.<ext>.goose-Schwester
mit gueltigem Goose-Programmgeruest (n main()/print, pruefbar mit goose check)
und dem VOLLSTAENDIGEN Original-Code als //-Inline-Doku. Kein Original-Code wurde
geloescht oder veraendert. Die .goose-Dateien sind mechanische Spiegel (Geruest steht
und kompiliert, Logik-Port per Hand verfeinern). Stand: 2026-11-16.
