# Critic brief: play the game as a new player and a demanding art director

The message that started you gives five values: BRIEF (the design file), REFERENCE (a reference image, or `none`),
GAME (a copy of the game folder), CRITIQUE (the file you write) and SKILL (the folder this file is in). Use them
exactly. You are not the builder: do not read the game code, do not change any file in GAME, and do not write a bot
that reads or sets game state.

**Clock.** Run `date` now and again after each area or level. At 20 minutes, stop playing and write the answers.

**Start.** Serve GAME on a free port of your own (for example `python3 -m http.server 0 --bind 127.0.0.1 --directory GAME`, then read the
port) and open it in the browser at 1280x800. Create CRITIQUE now and append to it as you go, so it is useful even if
you are stopped.

**How to play.** Real keys and clicks only. No faster than a person reacts (about 4 inputs a second at most); hold keys
for real time; wait to read menus and dialogue. Route: the first minute with no help, every control, each area or level
once, one loss, and one win if you can reach it.

Write CRITIQUE in this order:

## 1. SCENE
Save the title screen and one play screenshot per area. Run
`python3 -I SKILL/scripts/sheet.py <CRITIQUE folder>/look.png REFERENCE <title.png> <play shots>` (leave REFERENCE out
when it is `none`) and open look.png. With REFERENCE=none, compare to the look the BRIEF describes. Answer each check yes,
partly or no, and name the screenshot:
- L1 scene share: how much of the screen is scene rather than flat panel, and whether the interface sits at the edges
- L2 size: characters and key objects big enough to read on screen
- L3 surfaces: texture and detail on ground, walls, sky (not flat fills)
- L4 density: props and scenery that make each place feel built
- L5 lettering: a real font, sized and fitted to its panels
- L6 variety: areas or levels that look different from each other

## 2. RESPONSE
Answer yes, partly or no:
- F1 feedback: for each hit, heal, pickup, buy, reject and enemy action you meet, take one screenshot right after the
  input and another 0.5 s later. yes = both show a mark at the spot (number, burst, flash, outline); partly = only in a
  log or one frame; no = nothing on screen.
- F2 motion: characters and objects animate when they act (not just jump to the new state).
- F3 first minutes: playing with no hints, count failures and deaths and where they happened. yes = you understood
  what to do and failed for fair reasons; no = three failures at one spot you could not understand.

## 3. FINISH
At the worst state you reach (longest text, fullest HUD, every modal open), answer yes, partly or no:
- X1 text fit: no text past a panel or the screen edge, no overlapping text or controls
- X2 live numbers: no stale or stuck numbers; the HUD does not wrap or jump when values change
- X3 art finish: no reused, placeholder or emoji art; no holes, stray focus rings or broken frames

## 4. RULES
Pick 8 lines of BRIEF that state a number or a condition your route reaches (amounts, costs, timers, limits, what
resets, what the player is shown). For each: quote the line, say what you did and saw, and mark it holds, broken or not
reached. Decide from play only, never from code.

## 5. RECIPES
For every check not answered yes, name one recipe from this list and say where it applies: bake a textured layer; draw it from
several parts with an outline and one shade tone; scale it up or move the camera; full-screen scene with the interface
at the edges; effect at the target; fixed slot for changing text; unique art for each named thing; gentler first
encounter or a clearer warning.

## 6. CARRY-OVER
After your loss, retry. Reload in the middle of play and continue. Start a new game. Write each thing from before that
is still drawn, misplaced or dead, as a major.

## 7. BUGS
Everything else you met, each tagged blocker, major or polish, with its screenshot and the steps to repeat it.

## Last line
`not yes: SCENE n, RESPONSE n, FINISH n | answered no: n | rules broken: n | bugs: blocker n, major n, polish n`

<!-- GOOSE-PORT -->
## Goose-Port

Dieses Projekt ist mechanisch nach [Goose](https://github.com/aardappel/goose)
(aardappel/goose v2026.4) gespiegelt: Jede Code-Datei hat eine <name>.<ext>.goose-Schwester
mit gueltigem Goose-Programmgeruest (n main()/print, pruefbar mit goose check)
und dem VOLLSTAENDIGEN Original-Code als //-Inline-Doku. Kein Original-Code wurde
geloescht oder veraendert. Die .goose-Dateien sind mechanische Spiegel (Geruest steht
und kompiliert, Logik-Port per Hand verfeinern). Stand: 2026-11-16.
