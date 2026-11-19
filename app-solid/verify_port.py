import re, pathlib

root = pathlib.Path("app-solid/src")
ok = True

def check(cond, msg):
    global ok
    print(("PASS " if cond else "FAIL ") + msg)
    if not cond:
        ok = False

# 1. All tool component files exist and exports referenced by App.jsx resolve
app = (root / "App.jsx").read_text(encoding="utf-8")
imports = re.findall(r'import \{([^}]+)\} from "\./tools/([^"]+)\.jsx"', app)
for names, mod in imports:
    p = root / "tools" / (mod + ".jsx")
    check(p.exists(), f"file tools/{mod}.jsx exists")
    src = p.read_text(encoding="utf-8")
    for n in names.split(","):
        n = n.strip()
        if n:
            check(re.search(r"export function " + re.escape(n) + r"\b", src) is not None, f"{n} exported from {mod}")

# 2. Tool count matches original registry (same ids, same order)
tools_block = re.search(r"const TOOLS = \[(.*?)\n\];", app, re.S).group(1)
ids = re.findall(r'\{ id: "([^"]+)"', tools_block)
orig = pathlib.Path("app/app.js").read_text(encoding="utf-8")
orig_tools = re.search(r"var TOOLS = \[(.*?)\];", orig, re.S).group(1)
orig_ids = re.findall(r"\{ id: '([^']+)'", orig_tools, re.S)
check(ids == orig_ids, f"{len(ids)} tools in same order as original ({len(orig_ids)})")

# 3. Sections unchanged
for sec in ["Everyday", "Play", "Minecraft & servers", "Worlds & stories"]:
    check(sec in app, f"section '{sec}' present")
# 4. Catalog matches original
cat = (root / "catalog.js").read_text(encoding="utf-8")
slugs = re.findall(r'"slug":\s*"([^"]+)"', cat)
orig_slugs = re.findall(r'"slug":\s*"([^"]+)"', pathlib.Path("app/catalog.js").read_text(encoding="utf-8-sig"))
check(len(slugs) == len(orig_slugs), f"catalog count {len(slugs)} == original {len(orig_slugs)}")
check(slugs == orig_slugs, "catalog slugs identical order")
# 5. Trip data verbatim spot checks
trip = (root / "trip-data.js").read_text(encoding="utf-8")
for s in ["day0", "LH454", "Meta Like sign", "INSIDE Meta HQ", "Tage", "Budget", "Videos"]:
    check(s in trip, f"trip data contains '{s}'")
# 6. Logic parity spot checks
logic = (root / "logic.js").read_text(encoding="utf-8")
for s in ["Adipositas", "Division by zero", "parseWetter", "runPseudo", "WETTER_SAMPLE"]:
    check(s in logic, f"logic contains '{s}'")
# 7. Styles copied verbatim
check((root / "styles.css").read_text(encoding="utf-8") == pathlib.Path("app/styles.css").read_text(encoding="utf-8"), "styles.css identical to original")
# 8. Trip images copied
for img in ["like-sign.jpg", "tour.jpg", "chm.jpg", "apple-park.jpg"]:
    check(pathlib.Path("app-solid/public/trip-assets", img).exists(), f"trip asset {img}")
# 9. JSX files have balanced braces/parens roughly (crude)
for p in sorted(root.rglob("*.jsx")):
    t = p.read_text(encoding="utf-8")
    check(t.count("{") == t.count("}"), f"braces balanced in {p.name}")
    check(t.count("(") == t.count(")"), f"parens balanced in {p.name}")

print("ALL OK" if ok else "FAILURES PRESENT")
