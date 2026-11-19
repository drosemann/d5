---
name: visual-coding
description: For building or materially changing 3D, game, Blender or video-from-code work, read this first, before a plan or any file: a 3D web page, scene or model viewer, a playable browser game (2D, 2.5D or 3D), a Blender model, scene, animation or render, or a rendered video or GIF made from code; not for 2D web pages, landing pages or UI styling (taste). It names the one skill that owns the work. Also not for the start-command and URL handoff alone (browser-app-delivery), small fixes, or review-, plan- or explanation-only turns.
user-invocable: false
---

# Visual coding: one owner per deliverable

**Do this now, before a todo list, a plan or any file:** find the deliverable in the table, call `{{tool:read_skill}}` for its owner, and follow that owner's process to its done rule. Read a "use alongside" skill only for the technique its row names, and only when it is in your skill list.

| Deliverable | Owner: call `{{tool:read_skill}}` now | Use alongside (technique only) |
|---|---|---|
| A 3D model file from an image or a description, when a 3D generation tool is offered | That 3D generation tool: prepare its input image as the `3d-asset-generation` skill says (read it first), then call the tool. Do not generate geometry procedurally when a 3D generation tool can be called, and do not build it in Blender | `bundled:blender` only to edit or present the tool's result |
| A playable browser game: 2D, 2.5D or 3D, one file or many | `bundled:browser-game` | For 3D parts: `bundled:web3d` construction sections and `check_page.py`; `plugin:threejs:threejs` for three.js API |
| A 3D web page, scene or model viewer that is not a game | `bundled:web3d` | `plugin:threejs:threejs` for three.js API; `bundled:game-3d-visuals` for art direction only, when the user gives a reference image or asks for a polished look |
| An object or scene recreated in Blender from a reference image the user gives | `bundled:game-3d-visuals`, which may run its pipeline | `bundled:blender` for Blender technique |
| Any other Blender model, scene, animation, render or `.blend` file | `bundled:blender` | `bundled:game-3d-visuals` for art direction only, when the user asks for a polished, art-directed result |
| A rendered video or GIF made from code (promo, explainer, trailer, logo sting); only when `bundled:code-to-video` is in your skill list | `bundled:code-to-video` | A three.js scene or Blender frames as inputs to the film |

## When a 3D generation tool is offered: objects inside a game, scene or page

When a 3D generation tool is offered, the row's owner still owns the deliverable, and each object in it comes from one source:
- **The offered 3D generation tool** (read the `3d-asset-generation` skill first: one concept image, then one generation per object; it returns a textured model in under a minute, which the game or page loads): whenever the user wants better-looking graphics than primitives give, and for anything living or organic, a vehicle, a character, or a hero prop that should match concept art, including one that moves as a whole, such as a car that drives or a ship that flies; a vehicle's body, cockpit and wheels are all hero props, and wheels that spin or steer are generated separately and turned in code, never a reason to build the vehicle from primitives.
- **Primitives in code, when a 3D generation tool is offered (then Blender only when the user names it, fetching it if needed, or when it is already installed; otherwise never a download):** greybox or blockout, exact measurements, readable text, and parts that must articulate, explode or move separately. With a 3D generation tool offered, a character from the tool moves as a whole (glides, bobs, turns, leans); only a character whose limbs the user asks to animate, such as a walk cycle or punches, is built from code primitives instead.
- **Switching while a 3D generation tool is offered:** a "too blocky", "too basic" or "looks dumb" complaint about a hand-built organic or detailed object goes to the tool, concept image first, unless exact sizes, legible text or articulation are required; repeated regular fine detail, such as a wheel's spokes or a keyboard's keys, switches the other way, to code primitives, not a second generation.
- **An existing rough model, when a 3D generation tool is offered:** a primitive or procedural approximation already in the workspace (a build script, a `.blend` or an exported model) does not decide the route. When a 3D generation tool is offered, "better", "improve", "redo", "higher quality" or "continue" for such a model of an organic character, creature, vehicle or recognisable figure goes to the offered 3D generation tool, concept image first, and Blender then does only the steps it keeps: rigging, animation, exact dimensions, scene assembly and render. With a 3D generation tool offered, rule 1 still wins when the user names Blender.

## When more than one row fits

1. A tool or skill the user names wins: "in Blender" goes to a Blender row, a three.js page to web3d or browser-game.
2. A 3D model file from an image or a description while a 3D generation tool is offered: that tool's row, never a Blender row, even when the user gives a reference image. Rule 1 still wins when the user names Blender. When the ask also needs one of these steps, Blender does it on the tool's result, after the tool: rigging, animation, exact dimensions, a scene of several objects, and a render or video. Editing a model the user already has goes to a Blender row alone, never the tool. When a 3D generation tool is offered, a primitive or procedural approximation already in the workspace is not such a model: a better version of it is a new object from the tool. When a 3D generation tool is offered and fidelity decides between the two, organic characters, faces and recognisable figures go to the tool, and hard-surface props that need exact dimensions, legible text or articulated parts go to Blender. An explicit ask for close fidelity to a reference is not this rule's: rule 4 owns it. A reference image alone is the tool's input, not a fidelity ask. The tool makes only a new object from an image or a description; Blender does the steps it is named for or that are on this list.
3. The user plays it (controls, goals, score, win or lose): browser-game. A scene they only watch or explore is not a game.
4. A reference image to recreate in Blender: game-3d-visuals, with blender for technique. Run its long pipeline only when the user is not waiting for a quick result; for a quick look or rough draft, blender owns it. Any other `.blend` file, or a still or animation rendered by Blender: blender.
5. The deliverable is a video file (MP4, WebM, GIF): code-to-video when it is listed; otherwise the owner of the scene (blender for Blender, web3d for three.js) renders the frames.
6. Otherwise, a 3D scene that runs in a browser: web3d.

Examples: a cinematic three.js intro for a website is a page (web3d); the same intro as an MP4 is a video. A trailer for a game is a video, not a game.

## One owner, one process

- Follow only the owner's plan, checks, critic and done rule. A "use alongside" skill adds technique; never run its process, critic or stop rule as well.
- A row's owner stays the owner for the user's follow-ups on that deliverable.

## Rules for every visual task

- A newer user message wins over any skill's method. "Stop", "exit" or "cancel": answer in one sentence and make no more tool calls. "Open it": open the delivered file and stop. "Don't test" or a new plan: drop the remaining checks.
- When a 3D generation tool is offered and the user calls a hand-built object too blocky, too basic or dumb, and it needs no exact sizes, legible text or articulation (animated limbs, parts that must articulate or explode): make a concept image, then generate the object with that tool (read the `3d-asset-generation` skill first) and swap the model in, in this turn or any later one; do not rebuild it in code.
- If no browser is on the machine, install a headless one with the system package manager and check that it starts; say the page was not run only if that fails. Use one already on the machine (web3d's `check_page.py` finds it), always headless, never in the user's own browser.
- Generated images are references only (a look target or concept); never ship a generated image inside the deliverable.
- A person, avatar or character that stands for the user, or for users in general, should not get a skin tone, ethnicity or gender you picked for them. Use a neutral non-skin color (toy plastic, gray, a brand color) unless the user stated their appearance or the app lets them choose it.
- When you fix something wrong in a visual result, whether the user pointed it out or you found it while checking, change only that. Everything else the viewer sees stays as it was, including layout, motion, timing and colors, even when the fix seems to imply adjusting another element too. Name that knock-on change in your reply as an option instead of making it.

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
