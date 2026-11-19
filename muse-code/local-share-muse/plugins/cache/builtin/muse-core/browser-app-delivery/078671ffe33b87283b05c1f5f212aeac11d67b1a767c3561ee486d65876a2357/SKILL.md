---
name: browser-app-delivery
description: Deliver a runnable local browser app so the user can operate it on the first handoff. This delivery skill does not choose whether a requested local system should be a browser app. On a current turn that explicitly says to implement a brand-new browser project now, load bundled:greenfield-project-scaffolding before project work only after no-peek or permitted top-level placement facts prove that no named or suitable current-folder target resolves the root; never hand off from planning or answer-only turns, existing work, a named or suitable target, or standalone or single-file delivery. Resolve user-blocking product or interface choices with an available interaction surface; resolving those choices alone never authorizes implementation. Always call read_skill for bundled:browser-app-delivery before creating or materially changing a local browser app that owns its start path or a playable browser game. Also load it when the user requests a paste-ready, single-file, offline, or immediately playable browser artifact, even if no local start path should remain, unless the user says they will open or check it themselves or explicitly declines verification. On completed local-server delivery, include exact start commands, a concrete local URL, and explicit browser-open wording. On completed standalone delivery, hand off the exact artifact path or paste URL and smoke result without inventing a server. Do not load it for a self-contained static file that has no owned start path if the user either says they will open or check it themselves or explicitly declines verification. Do not load it for component/style-only edits, deployed sites, backend/API-only work, browser QA, review, explanation, plan-only, or explicit stop/no-tool turns.
user-invocable: false
---

# Browser App Delivery

For a brand-new browser project, apply this hard boundary before project work.
Do NOT call `{{tool:read_skill}}` for `bundled:greenfield-project-scaffolding` on a
requirements-guidance, planning, option-selection, multi-decision, or answer-only
turn; from prior-turn answers, authorization, or reminders without new
implementation-now words; for existing work, server start/restart, verification,
or handoff-only work; for a named path or a confirmed-suitable here/current-folder
target; or for a requested standalone, paste-ready, single-file, or snippet artifact.

Only when this same user turn explicitly says to start, implement, build,
scaffold, or go ahead with a new project now may unresolved placement trigger
the handoff. Do not load the greenfield skill merely to decide whether it is
eligible. If inspection is forbidden, do not list or read the workspace; use
only the request and `pwd`. Otherwise inspect only top-level placement facts
first. Call the greenfield skill before any project-content inspection or write
only when no named or suitable current-folder target resolves placement and
inspection is forbidden or those facts prove the current root home-like,
general-purpose, or falsely empty. Wait for its body, resolve the root, then
continue this workflow.

Use this workflow only for a local browser app whose build or start path is part
of the task, or for a requested paste-ready, single-file, offline, or immediately
playable browser artifact. Current user instructions always win. Build the features the request names at the size they need; do not add controls, modes or tools it did not ask for to make the artifact look complete.

Before using this workflow, resolve user-blocking product or interface choices
using an offered question tool. This workflow does not choose a browser
architecture or authorize implementation.

Prefer `{{tool:request_user_input_async}}` when offered.
If only `{{tool:request_user_input}}` is offered, use it and preserve its waiting and timeout behavior.
An `accepted` result is neither a user answer nor approval.
Use `auto_resolution_ms` only with `{{tool:request_user_input}}`.
Continue independent work while awaiting an answer.

Product correctness precedes delivery closure. Before Step 1, ensure the chosen
architecture and data source can satisfy the requested behavior at its stated
scale and coverage; runner availability, start success, a URL, or reachability
proves delivery mechanics only and must not narrow or stand in for those
requirements. Anything the user creates that gets its own link, or that other
people or devices must see, is stored by the server and served at that link;
browser storage (localStorage, IndexedDB, a URL hash) keeps it in one browser.
When the app keeps the user's work in browser storage, a save that throws
shows a visible warning in the app; never catch and drop it while the page
carries on as if the work were saved. Cover that path with a test that makes
the storage throw.

Product correctness includes the result arriving from the user's own action in
the delivered app. When the usual architecture needs a step the user ruled out
or this environment cannot run (a deploy, a registration, a background worker
or queue), run that work where it can run, such as in the request handler,
instead of shipping a flow that waits on the missing step; parts the user
listed (a job, a loading state) stay as code and UI and do not require the
result to be deferred. Show a loading state only while real work runs: never
add a sleep, timer, delayed thread, or later-visit trigger to make it
observable, and update any test you wrote that expects the result to stay
unfinished.

1. Derive the supported build and start commands, host, port, and path from the
   project, the chosen stack, or an observed run. A greenfield app is a
   multi-file project unless the user asked for a standalone, single-file,
   paste-ready, or offline artifact or named the one file to create; a page that
   could also open from disk does not make it standalone. For that project,
   first choose one appropriate project stack, then confirm its runner is
   supported by the available toolchain before creating its normal manifest and
   start declaration. A project with no dependencies or build step still gets
   them: its manifest's start script runs the project's own server or its
   stack's dev server, and a README command or a bare launcher script is not a
   start declaration. If that runner is unavailable, choose an
   already-available equivalent stack instead. Successfully run that exact start
   command. Hand off only that verified runner; do not add or retain a second
   manifest or runner for convention. A generic static-file server never
   qualifies as the project runner and may be used only for smoke. An explicitly
   standalone artifact skips this requirement. Never guess a URL, and do not add
   a server or dependency solely to manufacture one for a standalone artifact.
2. Preserve live user processes and persistent data. Prefer the existing dev
   server and hot reload. Restart only when required, target only the process
   this task owns, and migrate persistent state instead of deleting or reseeding
   it unless the user explicitly requests a reset. A server you think died is
   down only on fresh evidence: immediately before restarting it, run one shell
   call containing only a reachability check of that server, and restart only if
   that check fails (an earlier refusal inside a longer diagnostic command,
   behind `| tail` or `|| true`, may be stale or masked). Then restart only the
   process that exited; leave its live siblings and their supervisor running.
3. Verify changed behavior once with the smallest suitable check. For a form
   or action, that check submits it the way the user does and reads the page it
   lands on; a result that appears only after you run a back-end step yourself,
   or only after waiting, does not work yet. A successful
   HTTP response is enough to establish reachability. Do not run browser
   automation or screenshots solely to justify URL wording, and do not repeat
   visual checks for unchanged visuals.
   For a requested paste-ready, single-file, offline, or immediately playable
   artifact, modular sources may remain, but make the exact standalone artifact
   the primary handoff. Reject unresolved local imports and run one load/start
   smoke of that exact artifact with an already-available project or runtime
   check. If no appropriate check is available, report the exact artifact's
   start behavior unverified. HTTP success proves only reachability. Do not
   execute shims, download, install, work around, or repair dependencies for
   this smoke.
   For a standalone JavaScript artifact when no browser is available but Node
   is already present, exercise the exact embedded script through initialization
   and at least one update or render frame with a temporary dependency-free DOM
   and canvas harness. Syntax-only checks, extracted logic tests, HTTP success,
   and paste upload success do not count as this load smoke. Fix every runtime
   error and repeat the smoke once. This temporary test harness is not a package
   or runtime shim.
   Run the smoke against the final artifact bytes: after any artifact edit,
   rerun it. The fallback must invoke at least one queued
   `requestAnimationFrame` callback instead of suppressing it. After choosing
   this fallback, do not install or launch a browser or browser package.
4. Close browser delivery before handoff. For standalone delivery, do not create
   or start a server solely for handoff; report the exact smoke result and skip
   the remainder of this step. When the user did not explicitly ask
   to verify, prove, or confirm browser behavior or ask to be told when it works,
   do all of the following before the first completion answer: choose exactly
   one runner declared by the project; run one shell call whose only
   browser-runner probe is `command -v chromium`, substituting that runner's
   executable; allow only an exit-status echo to accompany it; after choosing
   from project declarations, perform no additional runner/path/module/tool
   discovery in this browser-closure step before, inside, or after that call;
   and if that chosen project runner is absent, explicitly and honestly report
   browser behavior unverified and stop browser verification without executing
   shims (`npx`, `uvx`), downloading, installing, working around, or repairing
   dependencies. With explicit intent, follow the relevant verification policy
   and report any remaining blocker honestly.
5. Keep every completion answer brief: a user handoff, not an engineering log.
   This changes only the report, never implementation or verification. Lead
   with the outcome and strongest verification. Unless the user explicitly asks
   for a detailed implementation report, omit exhaustive feature lists,
   file-by-file inventories, endpoint catalogs, internal architecture, and raw
   metrics.
6. In the first completion answer, open with an unambiguous completion signal
   such as `Done`, `Complete`, or `Ready`. For standalone delivery, give the
   exact artifact path or paste URL and the load/start smoke result; do not
   invent a server, start command, or local URL. Otherwise, give copy-paste
   start commands, a concrete URL, and a direct instruction to open that URL in
   a browser. A concrete URL must be one the user can open from their own
   machine. When the session host is headless, remote, or containerized, or the
   user says they cannot reach it, a loopback URL plus a local success response
   proves only that the server runs — deliver a user-reachable access path
   instead: bind and serve on a host-reachable interface using the host's real
   name or IP, establish a supported tunnel, or produce a self-contained
   openable artifact with open instructions; state which path you verified.
   When `setsid` is available, the URL in a server-backed handoff is served by a
   copy you started detached with the project's start command and left running,
   not by one your own test or smoke script started and stopped. If the server is
   not currently reachable, say why and label the URL as the address to use
   after starting it.
7. State current runtime status honestly. Never imply that a temporary local
   process is durable hosting or will survive cleanup or session end.
   Current-server claims: in that same turn, after the latest start, kill, or
   failed check, run a shell call containing only one reachability check; this
   includes answers that merely give curl examples or say done. For an
   agent-started server that is currently reachable, give its exact start
   command once only as current runtime provenance; never include a restart or
   recovery command, or any failure or session-cleanup condition in that
   message. After the user asks to keep it running, omit start and restart
   commands entirely; report only the fresh standalone reachability result,
   URL, and `Recovery remains mine.` On a host without `setsid` that sentence
   does not apply, because nothing you start outlives this session: say plainly
   that you cannot keep it running after this session ends, that your copy
   stops then, and give the one command that starts the server, never
   `Recovery remains mine.` If the server is not reachable, or the
   user explicitly asks how to start it, give the exact start command with an
   honest not-running label.

Do not turn a plan, clarification, stop request, or explicit no-start/no-verify
request into implementation or verification work.

<!-- GOOSE-PORT -->
## Goose-Port

Dieses Projekt ist mechanisch nach [Goose](https://github.com/aardappel/goose)
(aardappel/goose v2026.4) gespiegelt: Jede Code-Datei hat eine <name>.<ext>.goose-Schwester
mit gueltigem Goose-Programmgeruest (n main()/print, pruefbar mit goose check)
und dem VOLLSTAENDIGEN Original-Code als //-Inline-Doku. Kein Original-Code wurde
geloescht oder veraendert. Die .goose-Dateien sind mechanische Spiegel (Geruest steht
und kompiliert, Logik-Port per Hand verfeinern). Stand: 2026-11-16.
