// Goose-Port-Spiegel von: projects/github-repos-infra-pilot/tests/conftest.py
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/github-repos-infra-pilot/tests/conftest.py");
}

// ---- Original-Code (projects/github-repos-infra-pilot/tests/conftest.py), unveraendert, als Inline-Doku ----
// import sys
// import inspect
// import asyncio
// from pathlib import Path
//
// _project_root = str(Path(__file__).resolve().parent.parent)
// if _project_root not in sys.path:
//     sys.path.insert(0, _project_root)
//
// _cli_root = str(Path(__file__).resolve().parent.parent / "cli")
// if _cli_root not in sys.path:
//     sys.path.insert(0, _cli_root)
//
// for mod in list(sys.modules):
//     if mod == "cli" or mod.startswith("cli."):
//         del sys.modules[mod]
//
//
// def pytest_pyfunc_call(pyfuncitem):
//     """Run async test functions without requiring pytest-asyncio.
//
//     Several generated test modules define ``async def`` tests.  Keeping this
//     tiny hook in the shared conftest makes those tests executable in minimal
//     environments where the optional pytest-asyncio plugin is not installed.
//     """
//     testfunction = pyfuncitem.obj
//     if not inspect.iscoroutinefunction(testfunction):
//         return None
//
//     funcargs = {
//         name: pyfuncitem.funcargs[name]
//         for name in pyfuncitem._fixtureinfo.argnames
//     }
//     asyncio.run(testfunction(**funcargs))
//     return True
//
