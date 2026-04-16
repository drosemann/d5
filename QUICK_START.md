# Quick Start - Goose Desktop Companion

## Fastest path (Python UI)

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

## Windows orchestration scripts

```powershell
./run-all.ps1
```

or

```bat
run-all.bat
```

## Build standalone Python UI

```bash
cd goose-ui-python
# Windows
build\build.bat
# macOS/Linux
bash build/build.sh
```

## Developer references

- `goose-ui-python/DEVELOPER.md`
- `docs/DEVELOPER.md`
- `docs/MODULES.md`
