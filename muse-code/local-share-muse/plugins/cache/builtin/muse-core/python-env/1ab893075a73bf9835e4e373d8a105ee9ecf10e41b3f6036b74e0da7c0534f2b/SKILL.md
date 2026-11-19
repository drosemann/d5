---
name: python-env
description: Setting up or installing into a Python environment. One rule applies whether or not you read the body - the environment belongs with the project, so create it inside the project directory (.venv) or let uv manage it, and never in a scratch directory like /tmp and never by forcing an install into the system interpreter. Load the body before creating a virtualenv, choosing an installer, or writing run instructions for a Python project; run instructions for a library also show it imported and called.
user-invocable: false
---

# Python environments

The environment is part of the project, not scratch space. A user who opens the
project tomorrow, or clones it on another machine, should find the environment
where their editor, their tooling, and their habits expect it.

## Where it goes

Create it **inside the project directory** — `.venv` at the project root is the
convention nearly every editor and tool auto-detects:

```
python3 -m venv .venv
source .venv/bin/activate
pip install -e .
```

For a greenfield project, prefer `uv`, which manages a project-local `.venv` for
you and is much faster:

```
uv venv
uv pip install -e .      # or `uv sync` when there is a lockfile
uv run python -m yourpkg # runs in the project env without activating
```

Never put the environment in `/tmp`, `~/envs`, or any other scratch location
outside the project. It is invisible to the user's tooling, it is not what they
will look for, and on `/tmp` it is deleted out from under them.

## PEP 668: "externally-managed-environment"

Homebrew, Debian, and Ubuntu mark the system interpreter as externally managed,
so `pip install` outside a virtualenv refuses with:

```
error: externally-managed-environment
```

That is the signal to create the project environment — not an obstacle to work
around. Do **not** pass `--break-system-packages`, set
`PIP_BREAK_SYSTEM_PACKAGES`, or delete the `EXTERNALLY-MANAGED` marker: those
mutate an interpreter the OS owns, leave the project with no environment of its
own, and can break other software on the machine.

The same holds when the package index fails TLS verification
(`CERTIFICATE_VERIFY_FAILED`): never turn verification off (`--trusted-host`, an
`http://` index, `curl -k`, `PYTHONHTTPSVERIFY=0`). If the packages the task needs
already import from the system interpreter, use them: create the environment with
`python3 -m venv --system-site-packages .venv`, or run in place with
`PYTHONPATH=src`. Otherwise report the certificate failure.

## Hand off commands the user can run

Write the run instructions against the project environment, so they work from a
fresh shell in the project directory:

```
source .venv/bin/activate
python -m yourpkg ...
```

or, with uv, `uv run python -m yourpkg ...`.

Do not hand back absolute paths into an environment outside the project
(`/tmp/whatever/bin/python -m yourpkg`). Even when they work right now, they
tell the user their project has no environment of its own.

When the project is also a library the user will import, show that in the
hand-off too: a few lines of Python, run from the same environment, that import
the package and make one real call. A usage example in a README you wrote does
not replace it; the hand-off is what the user reads first.

## Respect what is already there

If the project already has an environment or a declared tool — a `.venv`, a
`uv.lock`, Poetry, Pipenv, conda — use it rather than introducing a second one.
Check before creating. The same goes for a container image, conda channel or
prebuilt wheels that the user or the project names: try them before you compile
a dependency from source.

<!-- GOOSE-PORT -->
## Goose-Port

Dieses Projekt ist mechanisch nach [Goose](https://github.com/aardappel/goose)
(aardappel/goose v2026.4) gespiegelt: Jede Code-Datei hat eine <name>.<ext>.goose-Schwester
mit gueltigem Goose-Programmgeruest (n main()/print, pruefbar mit goose check)
und dem VOLLSTAENDIGEN Original-Code als //-Inline-Doku. Kein Original-Code wurde
geloescht oder veraendert. Die .goose-Dateien sind mechanische Spiegel (Geruest steht
und kompiliert, Logik-Port per Hand verfeinern). Stand: 2026-11-16.
