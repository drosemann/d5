---
name: durable-test-collateral
description: Load the body before the first implementation edit for a bug fix or behavior change, or when the user or governing specification makes reusable tests a deliverable. When a reported problem could sit in more than one place in the code and the report does not say where it was seen, the body first has you find which one the user means from their own recent work, before any test or fix. It keeps the smallest focused test with the delivered project and updates coverage when behavior changes. Adding features to a project created earlier in this session is greenfield work, not a behavior change; a report that something already built behaves wrongly is still a bug fix. Do not load for greenfield work unless reusable tests are explicitly required, behavior-preserving refactors, verification-only work, plan/review/explanation/documentation/formatting/generated-output-only work, explicit no-change or no-tool work, or when the user declines tests.
user-invocable: false
---

# Durable Test Collateral

Verification is part of the delivered project when it can prevent the same
behavior from breaking again. Use the project's existing framework and
conventions.

Loading this skill does not mean the current turn asked for the change. While you
are still investigating — explaining existing behavior, or answering a design
question the user raised — use commands that only read and leave the repository
unmodified, tests included. When the user opened by saying they want to understand
or design first, a later message that only adds a requirement or constraint is more
design input, not the signal to start: answer how it shapes the design and the
choices still open, and change files once the user says to build it.

When the user asks whether built behavior is correct, the report is a bug fix
only for what you prove wrong. Check each observation against the source the
project follows: its specification, its documentation, or the real-world rules
it simulates. Fix what that source shows is wrong. When it shows an observation
is correct, keep that behavior, tell the user why it is correct, and offer the
change instead of making it. Do not remove correct behavior to make a reported
symptom go away, even to keep the project simpler.

Loading it does not settle what the new behavior should be either. A test fixes
one answer, so when the request leaves a choice about the delivered behavior to
the user (for example what an output meant for another person or system
includes) and the repository's existing precedents disagree on it, ask that one
grouped question before writing the test or the code; do not pick a reading and
record it in a test.

## Find the code the report is about

A focused test pins the place where the user hit the problem. When a report
could fit more than one place in the code (two clients or two copies of one
feature) and does not say where it was seen, find out which one before writing
the test: read the user's own open changes and tasks and the candidate files'
history. A shallow local clone lacks that history, so read it through the code
host's CLI when the environment has one. Picking the file whose wording fits
the report best, or testing and fixing every candidate to be safe, skips this
step; once you know where the user saw it, fix there and every other place the
same root cause reaches.

## Scale to the task

Skip the failing-test-first workflow below when the change is tiny and leaves
program logic alone (a typo, a text or style tweak, a config value, or a version
pin), when the work is a throwaway prototype or a standalone one-file script or
page, when the request adds features to a project you created earlier in this
session, or when the user asks for speed or a quick result. A quick direct check
of the changed behavior is enough there; if you add no maintained test, say so in
the report. A user request for tests anywhere in the session, or a
specification that makes tests a deliverable, still applies.

Any other bug fix or behavior change keeps the workflow at its smallest: a
focused failing test for each reported defect, the fix, those tests passing,
and, when a broad run is required, one broad run after the final edit.
Smallest limits the machinery, not the cases: add no new framework, suite, or
repeated broad run, but let the maintained test cover the inputs the fix
claims to handle beyond the reported one, such as another position or order,
extreme or boundary values, and each input rule the request restates. When the behavior is output that arrives over time (a stream, a paced or follow mode, progress lines), the test reads the first record through the user-facing command while that command is still running, with a bounded read: a test that captures the output after the command exits passes even when every line arrived together when the command exited. A rule the request tells you to keep, such as input validation, counts as restated: for each function the fix rewrites, give every argument that rule checks its own rejected-input case, since an existing case for one function or argument does not cover the others. A report
that something already built behaves wrongly is a bug fix, even when it comes
with feature requests.

Before a test run that may take more than a minute or two, tell the user in one
line what runs and why. If you poll it, post a short status line between polls;
never poll a long run silently.

## Keep the check with the project

For a bug fix or behavior change, add or update the smallest maintained test in
the repository's normal test layout that exercises the changed behavior. If a
specification makes a reusable suite or test category a deliverable, implement
that suite instead of treating it as private verification.

An inline interpreter command, heredoc, scratch script, temporary-directory
test, demo, or manual probe may help diagnose the problem, but it does not
replace the maintained test. Keep a useful self-authored test unless the user
explicitly asks for a disposable probe.

Do not add a new test framework solely to satisfy this skill. If the repository
has no maintained harness and the request does not require one, disclose when
durable coverage would be disproportionate or infeasible and use the narrowest
honest verification instead.

On a later turn that this workflow still covers (see Scale to the task),
update the maintained test even when the old suite remains green and the user
does not repeat the test request. Cover the new behavior, not merely an
unrelated cleanup in the test file.

## Prove the maintained check

Observe the authentic failure before the implementation change when it is safe
and runnable. Then make the smallest implementation change and run the focused
maintained test after the final relevant source or test edit.
When the request names failing tests, run each one after the final edit in
the configuration it was reported failing in (build mode, platform, flags); the
same test under another configuration is a different check, not a repeat, and
its pass does not prove the named one.

Do not weaken or delete a real failing test to obtain green. Fix the product,
or explain why the test's expectation is wrong before changing that
expectation. Do not repeat an unchanged check solely to collect evidence.

Run a broad or full suite only when the user, a repository gate, or
proportionate risk requires it, and then once, after the final edit, rather
than after each intermediate edit. A focused regression test comes first; broad
proof does not substitute for missing focused coverage.

Before deciding what a repository gate requires, read what the repository
declares it runs: its CI workflow, its test entry points, and its root-level
scripts listed with hidden entries included. A suite the project itself runs
over this change is a gate, not an optional extra, and a suite that skips
itself when its data is absent is not a green result.

A runner is unavailable only after you tried to make it available. When the
repository ships the command that fetches or builds the missing fixture,
corpus, or toolchain, run that command once and then run the gate. Report the
gate unavailable only when that attempt itself failed, and say what failed.

If the real runner is unavailable but the focused test can still be authored
honestly, leave the focused test in the repository and say it was not run. Do
not fabricate a passing result.

<!-- GOOSE-PORT -->
## Goose-Port

Dieses Projekt ist mechanisch nach [Goose](https://github.com/aardappel/goose)
(aardappel/goose v2026.4) gespiegelt: Jede Code-Datei hat eine <name>.<ext>.goose-Schwester
mit gueltigem Goose-Programmgeruest (n main()/print, pruefbar mit goose check)
und dem VOLLSTAENDIGEN Original-Code als //-Inline-Doku. Kein Original-Code wurde
geloescht oder veraendert. Die .goose-Dateien sind mechanische Spiegel (Geruest steht
und kompiliert, Logik-Port per Hand verfeinern). Stand: 2026-11-16.
