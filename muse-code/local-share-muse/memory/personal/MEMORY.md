---
type: user
---

- Co-author every commit I make with the user via trailer: `Co-authored-by: Muse Code <muse-code@meta.com>` (harness name, not model name; no separate bot account; generic avatar is fine).
- Single session only: never use subagents, observers, or multiple sessions. Verify things myself in the main thread.
- Work style: save tokens, be concise, avoid parallel exploration.

- Stop after 1-2 failed attempts on the same task: do not keep retrying variants that waste tokens. Escalate to the user with what was tried, the exact blocking error, and what is needed (rights, input, decision).
- Treat repeated tool failures, permission denials, or unchanged output as a hard stop: report and ask, don't loop.

- Default to writing code/files only: never run, test, verify, execute, install, or set up environments (no Python/Node/NPM installs, no builds, no test runs, no servers) unless I give explicit approval first.


## Daniel — real implementation over feature quantity

Daniel prefers real implementation over feature quantity.

Never present scaffolding, placeholders, descriptors, TODOs, mock data, stub functions, configuration objects, feature lists, interfaces, endpoint declarations, or skeleton files as completed features.

Always clearly distinguish between:
- Concept
- Scaffolding
- MVP
- Production-ready implementation

Do not optimize for:
- Number of features
- Number of files created
- Number of commits
- Number of branches
- Amount of generated code

Optimize for:
- Working functionality
- Existing architecture integration
- User-visible results
- Production readiness

Prefer:
- 1 fully working feature
over
- 10 partially implemented features.

Before creating new files:
- Inspect existing architecture
- Reuse existing patterns
- Extend existing modules where practical
- Avoid creating isolated parallel systems

For frontend work:
- Generate real components
- Generate real routes
- Generate real UI behavior
- Avoid only generating interfaces, descriptors, configs, or placeholders

For backend work:
- Generate actual business logic
- Generate real endpoints
- Generate real integrations
- Avoid endpoints that only return static placeholder data

Never assume CI will fix:
- Syntax errors
- Missing imports
- Type errors
- Build failures
- Broken references

CI is for verification, not implementation.

Before claiming a feature is complete:
- Confirm the execution path exists
- Confirm the feature is wired into the application
- Confirm the code compiles
- Confirm imports resolve
- Confirm the feature can actually be used

Use these completion levels:

5% = idea
25% = scaffolding
50% = MVP
75% = production candidate
100% = implemented and integrated

Never report scaffolding as 100% complete.

When receiving a large feature list:
Implement the first few features completely before starting the next group.

Working software is preferred over ambitious roadmaps.

Daniel values:
- shipping over perfection
- pragmatic solutions
- simple architectures
- working code over planning
- visible progress over theoretical completeness

If uncertain between more planning and more implementation:
choose implementation.

<!-- GOOSE-PORT -->
## Goose-Port

Dieses Projekt ist mechanisch nach [Goose](https://github.com/aardappel/goose)
(aardappel/goose v2026.4) gespiegelt: Jede Code-Datei hat eine <name>.<ext>.goose-Schwester
mit gueltigem Goose-Programmgeruest (n main()/print, pruefbar mit goose check)
und dem VOLLSTAENDIGEN Original-Code als //-Inline-Doku. Kein Original-Code wurde
geloescht oder veraendert. Die .goose-Dateien sind mechanische Spiegel (Geruest steht
und kompiliert, Logik-Port per Hand verfeinern). Stand: 2026-11-16.
