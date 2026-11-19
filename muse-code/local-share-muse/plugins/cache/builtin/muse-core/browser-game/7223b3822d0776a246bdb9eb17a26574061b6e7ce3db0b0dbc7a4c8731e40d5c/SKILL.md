---
name: browser-game
description: Read this FIRST, before a todo list, a plan or any file, whenever the user asks for a playable browser game (2D, 2.5D or 3D) from a brief or design document, or a material change to one. Says when such a game is done and the play-and-critique rounds that get it there; for games it replaces browser-app-delivery's single smoke check. Not for non-game pages, small fixes, or review-, plan- or explanation-only turns.
user-invocable: false
---

# Browser games: when one is done

**A newer user message always wins over everything in this skill, including the todo list: it cancels the open
Round items.** When the
user writes while you work, stop the loop at once:
- Stop, exit, cancel or done: reply in one sentence and make no more tool calls, not even to clean up.
- "Open it" or "just open it": your next tool calls cancel any critic subagent still running (`subagent_cancel`) and
  serve the delivered folder in the background (for example `setsid -f python3 -m http.server 8765 --bind 127.0.0.1 --directory
  <game folder>`; a server a critic started stops with it); then give that URL, or the file path if you cannot serve it, and
  stop. Do not read a critique, edit the game, check it again or start another round.
- "No need to test", "I'll check it myself" or "don't run it": do not run or screenshot the game; finish the build,
  say in the handoff that it was not run, and say how to open it.
- A new plan or change: do that instead.

**Browser.** Use the browser already on the machine. Playwright's Chromium often sits only in its cache
(`$PLAYWRIGHT_BROWSERS_PATH`, `~/.cache/ms-playwright`, `/root/.cache/ms-playwright`) with nothing named `chromium` on
`PATH`, so look there before you decide there is none. If there is no browser, do not install one: skip the play
rounds, keep the code checks, and say in the handoff that the game was not run and how to open it.


**Files.** Build every game, at every size, in a new folder of its own (for example `game-2048/`), with the page,
the styles and the code in separate files (`index.html`, `style.css`, `game.js`; split the code further as it grows).
Never deliver one big HTML file, and never write the game straight into the workspace root.

**Size the work to the request.** Pick one of three sizes before you start, and say which in your notes:
- **Full** (everything below: todo rounds, fresh critics): only for a long game design document, about
  2,000 words or more with many systems, rules and numbers, or when the user explicitly asks for hours of polishing.
- **Standard**: a detailed game request shorter than that (a page or two). Build the whole game, play it once from a
  fresh load with real input, run one critic with its checklist (Rounds, below), fix its "no" answers and its blockers and majors, do
  the final play of the delivered files, and hand off.
- **Compact**: a short request (a paragraph or less, one page, a prototype or demo). Build it, play it once, fix what
  you saw, and hand off. No critic.
If the user later asks for more polish, move up a size then.

**Start here: the todo list (full process only).** Before you write any file, call `write_todos` with this list (put your own build steps where it says
build), and keep these items in it until each one is really done:

1. `Plan: parts list and look notes`
2. `Brief: save the whole brief word for word to /tmp/game/brief.md; its last lines match the brief's end`
3. `Art: if an image_generation tool is offered, generate the reference art now (see Art below)`
4. `Build: skeleton, then the first area at final quality, then every other part`
5. `Round 1: play from a fresh load; snapshot + checklist critic; write rules.md during its first wait; fix its majors and the missing rules; carry-over pass`
6. `Round 2: snapshot + checklist critic; while it plays, do Look, feel and finish steps 1-5; then fix its majors; carry-over pass`
7. `Round 3: snapshot + checklist critic; while it plays, do Look, feel and finish steps 6-10; then fix its majors; carry-over pass`
8. `Final play of the exact delivered files: start from the title with real input and reach play; else restore the last good snapshot`

Mark a round completed only after you have read its critic's whole file and fixed its blockers and majors. If you
already wrote a todo list or game code before reading this, rewrite the list now with these items, keeping what you
finished as completed. Use `report_progress` to say which round you are in. Never end your turn while a critic is
still running (its findings are part of the round) or while a Round item is still open (the todo list is the plan for the whole session) unless the user
has written since: a user message cancels the open items (see the top rule).

A first build that runs and passes your own checks is the midpoint of the work, not the end. Someone who hands you a
full design document and asks for a complete game is asking for hours of careful work. If you already wrote game code
before reading this, that code is your first build: write the todo list now, then plan (1. Plan, below) and go on. When web3d also applies,
follow it for 3D construction and this skill for the rounds and when to stop.

**Art.** If an `image_generation` tool is offered, use it for reference art before drawing in code. Generated images
are references only: never put one in the game folder or load it in the game. First make one test image. If it works:
- Write one shared style line (medium, palette, lighting, outline) and reuse it in every prompt so all images match.
- Generate, in this order: the main backdrop for each area (wide, no text), each character as a sheet of poses on a
  plain flat background, key props and icons, and title art.
- Save every image outside the game folder (for example `/tmp/game/ref/`). Draw each character, prop and backdrop in
  code to match its reference: silhouette, proportions, palette, outline and shading.
- Put the images side by side in one contact-sheet screenshot and check that they match each other. Regenerate any that
  do not.
If the tool is missing or fails twice, skip this and draw everything in code as below.

## Look, feel and finish: what the first build is missing

A first build often plays correctly but looks like programmer art: flat shapes, system fonts, silent actions, identical levels. In each improvement round, apply these steps in order. After each step, take a screenshot and check it.

1. **Style block.** At the top of the code, define one palette (6-9 hex colours), one outline colour and width, one light direction and a size table for entities. Use only these. Keep scenery muted; make interactive things bright with a dark outline.
2. **Real fonts.** Load one display font for titles and numbers and one body font (`@font-face` or a font link). Await `document.fonts.load()` before the first draw. Never rely on OS fonts such as Arial or Georgia.
3. **UI kit.** Write `panel`, `button` (hover and focus states), `keycap` and `pill` helpers or CSS classes, each sized from its measured text plus padding. Rebuild every screen with them. No emoji icons.
4. **Fit all text.** Pass `maxWidth` to `fillText` or wrap to a column; lay out key lists as two-column grids. Screenshot every screen with its longest string and fix clipping, overlaps and buttons outside panels.
5. **Feedback on every event.** List each input and event (blocked move, jump, land, hit, pickup, buy, reject, win, lose). On each, store a timestamp and draw from the time since: an eased scale pop, a particle burst, a floating number that rises and fades, a small shake on big hits. Clear old messages when the state changes.
6. **Layered backdrop.** Bake 3-4 layers once at load: gradient sky, far and mid silhouettes, a noise-textured ground pattern. Scroll them at different speeds, then add a vignette and soft haze. In three.js also set ACES tone mapping, fog matching the sky, a hemisphere light and one shadow-casting sun.
7. **Title and end screens over the scene.** Show title, pause, win and lose panels over the dimmed live scene, never a blank page. End screens get a headline, a stats table, one clear reason and a visible payoff.
8. **State in the world.** Draw labels and status badges as pills in a last pass, at least 14 px tall. Pulse a ring on the next useful action.
9. **Levels that differ.** Drive palette, ground, props and weather from a per-level table.
10. **Characters.** Bake each one at load from curved parts with the outline and one shade tone. Pick a pose from state (idle, move, jump, attack, hurt), add an ellipse shadow, and sort drawables by ground y.

**Never deliver a broken game.** Long work can break a game that worked: one late change can stop the start
button or throw an error on load. Protect the working version:
- After every round whose play passed (the game starts from its title with real input and the main loop works),
  copy the whole game folder to a snapshot outside it, for example `cp -r <game folder> /tmp/game-good-<round>`.
- Before you end the turn, do the final play on the exact delivered folder from a fresh load: open it, use the real
  start control on the title (the button, Enter or a click, as a player would), reach play, and do the core action
  once. Check the console for errors.
- If that final play fails and you cannot fix it within a few minutes, restore the last good snapshot into the game
  folder (`rm -rf <game folder> && cp -r /tmp/game-good-<n> <game folder>`) and play it again. A slightly older game
  that works is always better than a newer one that does not start.

## Nothing carries over

Full and Standard sizes. Effects, tweens, pop-ins, floating text, label offsets, hints, badges and camera moves are
where fixes break a working game: they survive a retry, a reload or a screen change. Build them this way, also in code
that existed before you read this:
1. Keep all of them in one store outside the saved state. One function empties it; call it on load, continue, retry,
   new game, area change and every screen change.
2. Never save a clock or a start time. Age = clamp(now - start, 0, duration), read from that store, so a missing or
   future start draws the finished state.
3. A mark at a target stays about 1 s, never moves the layout and never draws over an open panel.
4. Sprites, bars and labels are drawn from current state every frame; a label sits at most one row above its owner.
5. 3D: the camera never ends up inside a mesh or the player; when the view is blocked, turn toward open space.

**Carry-over pass** (end of every round, after its fixes): from a fresh load with real input, retry a fight or level,
save and reload mid-play and continue, start a new game, change area, open and close each panel. Open a screenshot of
each. Anything from before still drawn, anything at a wrong size or place, or a control that stopped working is a
major. Write `carry-over: retry | continue | new game | area | panels -> clean, or what you saw`.

## The work, step by step

1. **Plan** in a notes file outside the game folder (for example `/tmp/game/notes.md`) and re-read it after a context
   compaction: every part of the design a player must see or do (each system, level or area, character type, screen
   and control), and how a player reaches it. Keep the round items in the todo list, so finishing the build never
   empties it.
   **The brief and its rules.**
   - Copy the user's whole brief word for word into `/tmp/game/brief.md`; several appends are fine. Run
     `tail -n 3 /tmp/game/brief.md` and check that it ends where the brief ends. Never summarize the brief for a critic
     or anyone else; pass the file path.
   - While the Round 1 critic plays, write `/tmp/game/rules.md`: one line for each rule in the brief that has a number
     or a condition, as `<name>: <amount> | when: <condition> | ends or resets: <when> | applies to: <who>`. For
     example: `Poison: 1 damage a second for 4 s | when: touched by a spore | ends or resets: a new dose restarts the
     4 s; cleared on death | applies to: player and enemies`. Add one line for each thing the brief says the player
     sees: each named effect, notice, icon, preview and end-screen row. Mark every line `built` or `missing` by reading
     your code, and build the missing lines in Round 1's fixes.
   - Tick a line `[x]` only when you or a critic saw it hold in real play. A script that calls game functions, sets
     state or forces an outcome never ticks a line. Lines still unticked at the end go in the handoff as not checked.
   - Before a fix that changes wording, timing, a confirm, a notice or how a named thing looks, run
     `grep -n -i "<key word>" /tmp/game/brief.md`. If the brief rules the change out, write
     `answered: brief says "<line>"` and skip the change. This never closes a Response or Finish check: raise those with a
     change the brief allows (the critic's recipes).
2. **Rounds.** After the whole design is built, run rounds. Each round:
   - Play from a fresh load through real keys and mouse only, at a human pace: the first minute, every control, every
     part of the design, a win and a loss, pause and restart. Open every screenshot.
   - **Snapshot for the critic.** Copy the game folder: `rm -rf /tmp/game/snap-N && cp -r <game folder> /tmp/game/snap-N`
     (N = round number). The critic plays this copy; you keep working in the game folder. BRIEF is always
     `/tmp/game/brief.md` (the Brief item).
   - **Spawn the scored critic** with `subagent_spawn` and this one message, filled in (do not rewrite or shorten it;
     the critic reads its full instructions from the file):
     `Read <this skill's folder>/critic.md and follow it exactly. BRIEF=<brief file> REFERENCE=<reference image or none>
     GAME=/tmp/game/snap-N CRITIQUE=/tmp/game/critique-N/critique.md SKILL=<this skill's folder>`
     Without subagents, play the copy yourself with critic.md before reading any code.
   - **Work while it plays.** Call `subagent_wait` with `timeout_ms` 300000. Full size only: before each wait, do the
     next open Look, feel and finish step on the game folder, with a screenshot before and one after from a fresh load;
     once no step is left, plain waits are fine. After the sixth wait, send the critic "Time is up: write your scores and
     last line now" (`subagent_send_message`), wait once more, then `subagent_cancel` it and work from its file.
   - **Fix what the scores say.** Read the whole critique. These are majors: every check answered "no" (any size), every Response
     or Finish check answered "partly" (Full size), and every bug tagged blocker or major. Every RULES line the critic marks broken is a major. Scene checks answered "partly" do not block; in Full,
     rebuild the weakest Scene check each round with the critic's recipe. Fix by changing how the thing is drawn or behaves;
     a new colour or one changed number does not close a check. Never close a Response check "by design": when the design fixes
     a number, fix it with presentation (a clearer warning, placement, a gentler first encounter). A check still not "yes" after
     two different recipes goes in your notes as `best effort: <check> <why>` and stops blocking. Mark each critique item
     fixed (with the screenshot) or answered (with the reason).
   - The round that ends the work is a full scored critic pass on a fresh snapshot, never a re-check list.
   - Keep the game folder on the latest build that passed, so stopping at any moment is safe.
3. **Proof is play.** A script that teleports, sets state, seeds a save or forces a win proves logic only; a hook that
   reads state may explain a failure. If your scripted player needs computed coordinates, retries or hidden UI to do a
   normal action, or cannot clear the opening, the game has a defect: fix the game, not the test, and do not spend the
   time teaching a bot to beat it. Never lower lighting, quality or hit areas because the headless browser is slow.
4. **Done** when three rounds ran after the full build, each round's blockers and majors are fixed (or replaced by a
   simpler version that still does what the design document asks; never drop a part the document names), the last
   carry-over pass is clean, and a final play of the exact delivered files is clean. Run no more than three rounds
   unless the user asks for more. If a critic stops with an empty critique file, spawn one replacement; never more
   than four critics in total. Passing tests, an empty todo list or "it works" are not reasons to stop early.
5. **Hand off** briefly, as browser-app-delivery says.

<!-- GOOSE-PORT -->
## Goose-Port

Dieses Projekt ist mechanisch nach [Goose](https://github.com/aardappel/goose)
(aardappel/goose v2026.4) gespiegelt: Jede Code-Datei hat eine <name>.<ext>.goose-Schwester
mit gueltigem Goose-Programmgeruest (n main()/print, pruefbar mit goose check)
und dem VOLLSTAENDIGEN Original-Code als //-Inline-Doku. Kein Original-Code wurde
geloescht oder veraendert. Die .goose-Dateien sind mechanische Spiegel (Geruest steht
und kompiliert, Logik-Port per Hand verfeinern). Stand: 2026-11-16.
