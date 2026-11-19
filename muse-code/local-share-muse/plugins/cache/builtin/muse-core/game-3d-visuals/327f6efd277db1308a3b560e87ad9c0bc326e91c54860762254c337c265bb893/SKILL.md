---
name: game-3d-visuals
description: Use for 3D work where the user wants a polished, art-directed look: recreating an object or scene from reference image(s), modeling and rendering in Blender, or an explicit ask for high visual fidelity in a three.js, WebGL/WebGPU or game-engine scene. It adds consistent reference images, a detailed visual PRD, a blockout gate and a render-vs-reference acceptance loop, run as a fixed Workflow script when the workflow tool is available, which takes much longer than a direct build. Skip it for quick prototypes or playable pages where a fast working result matters more, small edits, and 2D work. When it applies, read it before tool-specific skills such as blender or threejs and use those for technique.
---

# Reference-driven 3D and game visuals

Goal: a result that looks art-directed, not like programmer art. The lever is a sharp visual target written down with numbers (consistent reference images and a detailed visual PRD) and independent comparisons of the real output against it, repeated until they match.

## When to run the full process

Run the procedure below when the user wants a polished, art-directed result: a reference image to match, a Blender model or render, or an explicit ask for high visual fidelity. It takes much longer than a direct build. For a quick prototype or a playable page where a fast working result matters more, do not run it: build directly (read and follow `web3d` or `browser-game` first when they are in your skill list) and answer the user's follow-up messages without waiting on long work.

## Required procedure (when it applies)

When it applies, this skill owns the process. If `blender`, `threejs` or another tool skill is also loaded, use it only as a technique reference (the builder inside the workflow reads it); do not follow its own step-by-step process instead of this one.

If the `workflow` tool is in your tool list, steps 2–5 of this skill **are** the fixed Workflow script `scripts/visual_pipeline.js` shipped with it: you load it as is, you do not write, copy or edit any workflow code. Writing the PRD, the build or the reviews yourself instead does not count as following this procedure: the independent PRD reviewer and the independent visual reviewers are the point, and they only exist inside the workflow. `<skill dir>` is the directory of this SKILL.md, shown as `path:` in the read_skill result.

1. **References** (done by you; details in references/process.md section 1): view the input, run `image_generation` if offered, and put the references in `visual-plan/refs/`.
2. **Launch the pipeline**: your next tool call after step 1 is this one call, loading the shipped script directly by its absolute path (the hash pins its exact bytes):
   ```
   workflow(scriptPath="<skill dir>/scripts/visual_pipeline.js",
            expectedScriptHash="sha256:1e440d13ccd05b75286cc06d3fca70145a012b50165b92a442c11428c87d1d79",
            args={"request": "<the user's request, verbatim>",
                  "references": ["visual-plan/refs/hero.png", "visual-plan/refs/side.png"],
                  "output": "/app/render.png",
                  "deliverables": ["/app/render.png", "/app/scene.blend"],
                  "source": "/app/build_scene.py",
                  "build": "blender -b --python /app/build_scene.py",
                  "skillDir": "<skill dir>",
                  "measure": "blender -b --factory-startup --python <skill dir>/scripts/tone_compare.py -- visual-plan/refs/hero.png /app/render.png",
                  "maxReviewRounds": 0, "maxRounds": 1})
   ```
   Pass `args` as a JSON object, not a JSON-encoded string. Adapt `output`, `deliverables` (every file the task requires), `source` and `build` to the task (for a game: a screenshot path, the main source file, and the command that rebuilds and captures it; omit `measure` outside Blender). With these args the script runs: PRD author → builder (blockout gate first, best copy kept) → one acceptance round (two independent reviewers who see only the reference and the output; unless both accept, a fixer writes "Polish round 1" into the PRD, fixes, rebuilds, keeps the best). `maxReviewRounds` above 0 adds independent PRD review rounds and `maxRounds` above 1 adds acceptance rounds, each at a large time cost.
3. **Wait**: the workflow runs in the background and its result is delivered to you automatically, even after you end your turn. Do not edit the same files meanwhile.
4. **Check and finish**: if the result is `invalid_arguments`, relaunch with the missing args. Otherwise, when the result arrives, confirm the deliverables exist and view the output once. Report the rounds and remaining differences.

Without the `workflow` tool, read [references/process.md](references/process.md) and follow it yourself, using a subagent tool (if offered) for the independent reviews.

## Final message

What was built, where the deliverables are, how many acceptance rounds ran, and the remaining visible differences, if any.

<!-- GOOSE-PORT -->
## Goose-Port

Dieses Projekt ist mechanisch nach [Goose](https://github.com/aardappel/goose)
(aardappel/goose v2026.4) gespiegelt: Jede Code-Datei hat eine <name>.<ext>.goose-Schwester
mit gueltigem Goose-Programmgeruest (n main()/print, pruefbar mit goose check)
und dem VOLLSTAENDIGEN Original-Code als //-Inline-Doku. Kein Original-Code wurde
geloescht oder veraendert. Die .goose-Dateien sind mechanische Spiegel (Geruest steht
und kompiliert, Logik-Port per Hand verfeinern). Stand: 2026-11-16.
