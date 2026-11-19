---
name: browser-game
description: Spawn an art director subagent and run three critic rounds for every playable browser game (2D, 2.5D or 3D) built from a brief or design document, or a material change to one: the art director makes the game's art while you build, then each play, review and improve round uses a fresh critic. Short or quick game asks stay light (build, play once, hand off), so read it for those too. Read it before you plan; if game code already exists, read it now and switch to its todo list. Not for non-game pages, small fixes, or review-, plan- or explanation-only turns.
user-invocable: false
metadata:
  short-description: Art director subagent plus three critic rounds for full browser-game builds, short game asks stay light; switch to it now even if game code already exists
---

# Browser games: a game-studio process

**Start here, even if you already wrote game code.** Reading this skill does not finish the job; following it does.
First pick the size of the work (**Size the work to the request**, below). For a Full build, if you are mid-build or
already have your own todo list, stop editing now: your next tool call is `{{tool:write_todos}}` with the nine items under
**The process, in order** below, replacing your own list. Keep the code you wrote; the Build item goes on from it.

**A newer user message always wins over everything in this skill, including the todo list: it cancels the open
Round items.** When the
user writes while you work, stop the loop at once:
- Stop, exit, cancel or done: reply in one sentence and make no more tool calls, not even to clean up.
- "Open it" or "just open it": your next tool calls cancel any critic subagent still running (`{{tool:subagent_cancel}}`) and
  serve the delivered folder in the background (for example `setsid -f python3 -m http.server 8765 --bind 127.0.0.1 --directory
  <game folder>`; a server a critic started stops with it); then give that URL as **Hand-off URL** below says, or the file
  path if you cannot serve it, and stop. Do not read a critique, edit the game, check it again or start another round.
- "No need to test", "I'll check it myself" or "don't run it": do not run or screenshot the game; finish the build,
  say in the handoff that it was not run, and say how to open it.
- With a 3D generation tool offered, the user calls a hand-built creature, vehicle or prop too blocky, too basic or
  dumb, and it needs no exact sizes, legible text or articulation (animated limbs, parts that must articulate or
  explode): make a concept image, then generate it with that tool (`3d-asset-generation` skill) and swap the model in;
  do not rebuild it in code.
- A new plan or change: do that instead.

**Browser.** Use the browser already on the machine. Playwright's Chromium often sits only in its cache
(`$PLAYWRIGHT_BROWSERS_PATH`, `~/.cache/ms-playwright`, `/root/.cache/ms-playwright`) with nothing named `chromium` on
`PATH`, so look there before you decide there is none. If there is no browser, do not install one: skip the play
rounds, keep the code checks, and say in the handoff that the game was not run and how to open it.


**Files.** Build every game, at every size, in a new folder of its own (for example `game-2048/`), with the page,
the styles and the code in separate files (`index.html`, `style.css`, `game.js`; split the code further as it grows).
Never deliver one big HTML file, and never write the game straight into the workspace root.

**3D models, when a 3D generation tool is offered.** When a 3D generation tool is offered and the game is 3D, its
characters, creatures, vehicles and hero props come from that tool at every size, Compact included, through a required
3D asset manifest before any procedural build (in a Full build, before the Build item): list them in
`<game folder>/assets/manifest-3d.md`, separate from the art director's `manifest.json`, read the `3d-asset-generation`
skill, make one concept image per entry, call the tool once per entry (each returns a textured model in under a
minute), save each model under `<game folder>/assets/` and load it in the game. With a 3D generation tool offered,
simple shapes stand in for an entry only while its job runs and are swapped for the model when it lands (if a job
fails, retry it once; if it fails again, keep the placeholder, finish the build and name the failed entries in the
handoff), and a realistic, lifelike or AAA ask is never a reason to build them from primitives. With a 3D generation
tool offered, a model already in the workspace for an entry (a `.glb` under `assets/` or `visual-plan/`) is used
instead of rebuilding it, and game code, a plan or a PRD already built from primitives does not skip this step: run
the 3D asset manifest and swap the primitive entries for models. With a 3D generation tool offered, keep code
primitives for blockout or greybox art the user asks for, the level itself (ground, track, walls), exact measurements,
readable text, and parts that must articulate, explode or move separately; a car that drives or a ship that flies
moves as a whole and is still the tool's, and with a 3D generation tool offered a vehicle's body, cockpit and wheels
are all hero props: wheels that spin or steer are separate generations turned in code. With a 3D generation tool
offered, a character from the tool moves as a whole (glides, bobs, turns, leans); only a character whose limbs the
user asks to animate, such as a walk cycle or punches, is built from code primitives instead. With a 3D generation
tool offered, a "too blocky" or "too basic" complaint about a hand-built creature, vehicle or prop that needs no exact
sizes, legible text or articulation goes to the tool (concept image first), while broken repeated detail such as
spokes goes back to code primitives, not a second generation.

**Hand-off URL.** Every handoff gives a way to open the game from the user's own machine. On a remote or headless host (a
devvm, a container, a machine reached over SSH; check `hostname -f` and `$SSH_CONNECTION`), a `127.0.0.1` URL opens
nothing on the user's laptop: keep the server on `127.0.0.1` and give the tunnel command with the host's real name
(`ssh -L 8765:127.0.0.1:8765 <hostname -f>`) before the `http://localhost:8765/` URL.

**Size the work to the request.** Pick one of three sizes before you start, and say which in your notes:
- **Full** (everything below: the art director, three rounds with fresh critics): only for a long game design document, about
  2,000 words or more with many systems, rules and numbers, or when the user explicitly asks for hours of polishing.
- **Standard**: a detailed game request shorter than that (a page or two). Build the whole game, play it once from a
  fresh load with real input, run one critic with its checklist (Rounds, below), fix its "no" answers and its blockers and majors, do
  the final play of the delivered files, and hand off.
- **Compact**: a short request (a paragraph or less, one page, a prototype or demo). Build it, play it once, fix what
  you saw, and hand off. No critic.
If the user later asks for more polish, move up a size then. Everything from **The process, in order** to the end is the
Full build; a Standard build uses only its section 4 critic step, once, and its section 5 final play.

**The process, in order.** For a Full build, before you write any file (or right now, if you already wrote game code), call `{{tool:write_todos}}`
with these items and keep them until each one is really done; never cancel one, and mark one completed only when the
work it names has happened (a file written, a subagent spawned, a critique read):

1. `Brief: save the whole brief word for word to /tmp/game/brief.md; its last lines match the brief's end`
2. `Art director: spawn it now with the exact message below; it makes every asset while you build`
3. `Spec: write /tmp/game/spec.md (requirements trace, balance targets, feedback plan)`
4. `Build: the whole game; simple shapes where art will go (when a 3D generation tool is offered, after the 3D asset manifest)`
5. `Round 1 (playable and cohesive): critic as soon as the build plays, before the art; your own playtest; review.md; fix blockers and majors`
6. `Wire the art: when the art director replies (usually while critic 1 plays), draw every asset in assets/manifest.json in the game`
7. `Rounds 2 and 3 (fun and fair; impressive and converged): two critics on one snapshot, spawned together; your own playtest`
8. `Rounds 2 and 3 fixes: both critiques read; review.md for each; blockers and majors of both fixed in one pass`
9. `Final play of the exact delivered files; sprites.py check prints hand-off: yes`

**Your first tool calls after reading this (Full):** `{{tool:write_todos}}` with this list; save the brief (item 1); then spawn the art
director with `{{tool:subagent_spawn}}` and exactly this message (fill in the values): `Read <this skill's folder>/art-director.md
and follow it exactly. BRIEF=/tmp/game/brief.md REFERENCE=<reference image or none> GAME=<game folder>
SKILL=<this skill's folder>`. Do not wait for it: go on with the spec and the build while it works. Do this even if you
already wrote game code. A brief that says the art is drawn in code, procedural or made by you does not replace the art
director: the art it generates and saves in the game folder meets that brief. Skip it only when no `{{tool:image_generation}}`
tool is in your tool list.

In a Full build, after every step run `python3 -I <this skill's folder>/scripts/sprites.py check <game folder>`: its `next:` line names the
step still missing (brief, spec, Round 1's critique, the art director's manifest and the art wired into the game, then
Rounds 2 and 3), and the work is done only when it prints `hand-off: yes`.
SPRITES below means `python3 -I <this skill's folder>/scripts/sprites.py`.

## 1. Brief and spec

Copy the user's whole brief word for word into `/tmp/game/brief.md` (several appends are fine; `tail -n 3` must show the
brief's end). Never summarize it for a critic; pass the path. Then write `/tmp/game/spec.md`:
- **Route.** A detailed design document (fixed core loop, controls, flow, concrete content and numbers) is the design:
  build it faithfully, add no mechanics beyond it, and use your own ideas only for feel, feedback and polish. A short or
  partial prompt is a floor: expand it into a complete design with one clear hook.
- **Requirements trace:** each section of the brief -> how it is built -> how you will check it in play. Every stated
  requirement is kept verbatim or stronger, never dropped or softened. List the ambiguities and the reading you chose.
- **Art:** the art director's `/tmp/game/art/plan.md` holds the style block, size table and asset list; use its sizes.
- **Balance targets** (time to first setback, win rate over 3 runs, ramp) and a **feedback plan** (what every input and
  event shows on screen).

## 2. Art: the art director makes it, you wire it

When the `{{tool:image_generation}}` tool is in your tool list, the game's art is generated and shipped in the game folder (a
brief that asks you to make every image yourself, drawn in code or as files you generate and save in the game folder,
allows it). The art director subagent you spawned right after the brief writes the art plan, generates and cuts every
asset into `<game folder>/assets/` and lists them in `<game folder>/assets/manifest.json`. Do not wait for it after your
build: start Round 1 as soon as the whole build plays from a fresh load (section 4), and wire the art while critic 1
plays (if its reply is already in by then, wire the art first). When its reply arrives, read it and the manifest, open
`/tmp/game/art/sheet.png`, and wire every asset in: backdrops behind the play layer, each sprite at its `draw_height`
anchored at its feet with a soft ground shadow, pose strips stepped by `cell_w`, items and icons in the HUD and world,
the title picture behind your title text. If it has not replied when critic 1's critique is in, call `{{tool:subagent_wait}}` on
it (`timeout_ms` 300000, repeat while it works) before the Round 1 fixes. If it reports a missing or broken asset,
generate that one yourself the same way (`python3 -I <this skill's folder>/scripts/sprites.py cut|fit ...`). If the tool
is missing from your tool list or fails twice, draw everything in code and run sprites.py check with `--no-art-tool`;
never use that flag because the brief says the art is drawn in code.

## 3. Build

Build the whole game from spec.md: every system, screen and control the brief names, at the art plan's sizes. Load
every image from `assets/` with a relative path before the title shows (`await img.decode()`); draw sprites standing on
their ground point with a soft ground shadow; flip for the other facing; step pose strips for movement; draw backdrops
behind the play layer with a darker band behind text. Wrap the per-frame step in try/catch and reschedule it in
`finally`; map pointer events to CSS pixels; load one display font and one body font (`document.fonts.load()` before
the first draw); synthesize sounds with Web Audio. Start directly in playable space with one obvious action; teach the
core loop through a first success, not a wall of text. When the whole build plays from a fresh load (title, the real
start control, the core action once, no console errors), save that play screenshot as `/tmp/game/first-play.png`: that
is the first playable build, and Round 1 starts then.

## 4. Three rounds: verify, review, improve

Each round has a theme; check every axis, dig deepest into the theme:
- Round 1, playable and cohesive: every brief requirement reachable, no crash or console error, a first balance
  baseline (3 fresh runs, numbers written down). Critic 1 plays the build before the art is in (do not cancel or
  re-spawn it for that): skip its L0 and L7 answers (Round 2's critic checks the art in place) and fix the rest; wire
  the art before the Round 1 fixes.
- Round 2, fun and fair: assets cohesive in the running game, balance toward every target, immediate visible feedback
  on every input, readable threats, a fair difficulty ramp.
- Round 3, impressive and converged: the hook clear in the first 10 seconds, juice, art direction, title and end
  screens, a moment worth sharing; balance re-measured.

Every round:
1. **Snapshot and critic:** `rm -rf /tmp/game/snap-N && cp -r <game folder> /tmp/game/snap-N`, then spawn the critic with
   `{{tool:subagent_spawn}}` and exactly this message: `Read <this skill's folder>/critic.md and follow it exactly.
   BRIEF=/tmp/game/brief.md REFERENCE=<reference image or none> GAME=/tmp/game/snap-N
   CRITIQUE=/tmp/game/critique-N/critique.md SKILL=<this skill's folder>`. Without subagents, play the copy yourself with
   critic.md before reading any code.
2. **Your own check while it plays** (`{{tool:subagent_wait}}` with `timeout_ms` 300000 between steps): a visual comparison
   (save `/tmp/game/iterations/round_N/opening.png` from a fresh load and view it beside the reference image: camera,
   framing, palette, object scale, control placement) and a functional playtest with real keys and mouse only, at a
   human pace (the core loop, this round's changes, a win and a loss, restart, save and reload).
3. **Review:** write `/tmp/game/iterations/round_N/review.md`: the theme, what you checked and how, findings tagged
   blocker / major / polish with their screenshot, the measured balance numbers, and from Round 3 a "Would I share
   this?" line. Then read the critic's whole file; every "no" answer, every rule it marks broken and every blocker or
   major is yours to fix.
4. **Improve:** list the changes (file + what changes), blockers first, at least half serving the round's theme; make
   them; replay what changed. After the sixth wait send the critic "Time is up: write your scores and last line now",
   wait once more, then cancel it and work from its file.
A round is done only when its critique file exists, its review.md is written and its blockers and majors are fixed.
After each round whose play passed, copy the game folder to `/tmp/game-good-<N>`.

**Rounds 2 and 3 run together.** After the Round 1 fixes, take one snapshot, `/tmp/game/snap-2`, and spawn both critics
on it in the same turn: the Round 2 critic with `GAME=/tmp/game/snap-2 CRITIQUE=/tmp/game/critique-2/critique.md`, and
the Round 3 critic with the same message but `CRITIQUE=/tmp/game/critique-3/critique.md` and `FOCUS=late` added. While
they play, do your own check for both themes. Then write `round_2/review.md` and `round_3/review.md`, read both
critiques, and fix the blockers and majors of both in one pass, blockers first; replay what changed. Count the waits
for the pair: after the sixth, send both the time-up message.

## 5. Done

Done when three rounds ran after the build with their blockers and majors fixed, `SPRITES check <game folder>` prints
PASS and `hand-off: yes`, and a final play of the exact delivered folder from a fresh load (title, real start control,
reach play, do the core action once, no console errors) is clean; if that final play fails and you cannot fix it within
a few minutes, restore the last good snapshot. **Clock:** note `date` in spec.md at the start; at 2.5 hours start no new
round: do the final play and hand off. Hand off briefly: what was built, how to open it, what was not checked.

<!-- GOOSE-PORT -->
## Goose-Port

Dieses Projekt ist mechanisch nach [Goose](https://github.com/aardappel/goose)
(aardappel/goose v2026.4) gespiegelt: Jede Code-Datei hat eine <name>.<ext>.goose-Schwester
mit gueltigem Goose-Programmgeruest (n main()/print, pruefbar mit goose check)
und dem VOLLSTAENDIGEN Original-Code als //-Inline-Doku. Kein Original-Code wurde
geloescht oder veraendert. Die .goose-Dateien sind mechanische Spiegel (Geruest steht
und kompiliert, Logik-Port per Hand verfeinern). Stand: 2026-11-16.
