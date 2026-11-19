# Goose Desktop Companion

Goose Desktop Companion is a modular desktop companion project with a PowerShell feature engine and a Python/PyQt UI.

## Project overview

This repository contains:

- A large set of PowerShell feature modules (productivity, wellness, system utilities, social/fun features).
- A cross-platform Python UI in `goose-ui-python/`.
- Optional server-side integration assets (Supabase schema and related docs).

## Features / purpose

- Modular architecture with category-based `*.ps1` modules.
- Config-driven behavior via `config.ini`.
- Optional authentication, sync, telemetry, and incident workflows.
- Python UI for local development and packaging.

## Installation

### Prerequisites

- PowerShell 5.1+ (Windows modules)
- Python 3.9+
- `pip`

### Install and run Python UI

```bash
cd goose-ui-python
python -m venv .venv
# Windows
.venv\Scripts\activate
# macOS/Linux
source .venv/bin/activate
pip install -r requirements.txt
python main.py
```

## Usage

### Run feature checks

```powershell
./test-goose-features.ps1
```

### Run module orchestrator (Windows PowerShell)

```powershell
./run-all.ps1
```

### Launch helper scripts (Windows)

- `goose-ui.bat`
- `goose-ui.vbs`
- `run-all.bat`

## Development setup

1. Clone the repository.
2. Create a Python virtual environment under `goose-ui-python/`.
3. Install Python dependencies with `pip install -r goose-ui-python/requirements.txt`.
4. Review module docs in `docs/`.
5. Run `test-goose-features.ps1` before opening a PR.

## Configuration

Primary configuration lives in:

- `config.ini` (root)
- `goose-ui-python/assets/config.ini` (Python UI)

For backend and optional services, see:

- `docs/backend-setup.md`
- `docs/SERVER-FEATURES.md`

## Build / run instructions

### Python package builds

```bash
# Windows
cd goose-ui-python
build\build.bat

# macOS/Linux
cd goose-ui-python
bash build/build.sh
```

Generated output is intentionally **not** tracked in git. Build artifacts (executables, caches, logs, and temporary outputs) should be generated locally as needed.

## Troubleshooting

- If Python UI fails to start, verify you activated the virtual environment and installed requirements.
- If PowerShell modules fail to load, confirm you are running from repository root and that script execution policy permits local scripts.
- If module settings appear ignored, verify keys in `config.ini` and restart the relevant UI/process.

See also:

- `QUICK_START.md`
- `goose-ui-python/SETUP.md`
- `docs/DEVELOPER.md`

## Open-source policy files

- License: `LICENSE` (GNU GPLv3)
- Contribution guide: `CONTRIBUTING.md`
- Code of conduct: `CODE_OF_CONDUCT.md`

<!-- ZIMBU-PORT -->
## Zimbu-Port

Dieses Projekt ist mechanisch nach [Zimbu](https://moolenaar.net/z/zimbu/spec/zimbu.html)
(Bram Moolenaar) gespiegelt: Jede Code-Datei hat eine <name>.<ext>.zimbu-Schwester
mit Zimbu-Modulgeruest (MODULE/FUNC Main) und dem VOLLSTAENDIGEN Original-Code
als #-Inline-Doku. Kein Original-Code wurde geloescht oder veraendert.
Die .zimbu-Dateien sind mechanische Spiegel (80/20: Geruest steht, Logik-Port
per Hand verfeinern). Stand: 2026-11-12.

<!-- GOOSE-PORT -->
## Goose-Port

Dieses Projekt ist mechanisch nach [Goose](https://github.com/aardappel/goose)
(aardappel/goose v2026.4) gespiegelt: Jede Code-Datei hat eine <name>.<ext>.goose-Schwester
mit gueltigem Goose-Programmgeruest (n main()/print, pruefbar mit goose check)
und dem VOLLSTAENDIGEN Original-Code als //-Inline-Doku. Kein Original-Code wurde
geloescht oder veraendert. Die .goose-Dateien sind mechanische Spiegel (Geruest steht
und kompiliert, Logik-Port per Hand verfeinern). Stand: 2026-11-16.
