// Goose-Port-Spiegel von: muse-code/local-share-muse/sessions/2026/10/29/01a18967-8f34-75e3-bd91-9db28a27fadd/tool-outputs/01a1897e-7892-7923-b04c-68b2fb97aae9/call_01a1897e6cc6721b8adac9fd5b01bddf-tool_patch.json
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: muse-code/local-share-muse/sessions/2026/10/29/01a18967-8f34-75e3-bd91-9db28a27fadd/tool-outputs/01a1897e-7892-7923-b04c-68b2fb97aae9/call_01a1897e6cc6721b8adac9fd5b01bddf-tool_patch.json");
}

// ---- Original-Code (muse-code/local-share-muse/sessions/2026/10/29/01a18967-8f34-75e3-bd91-9db28a27fadd/tool-outputs/01a1897e-7892-7923-b04c-68b2fb97aae9/call_01a1897e6cc6721b8adac9fd5b01bddf-tool_patch.json), unveraendert, als Inline-Doku ----
// {"files":[{"path":"\\\\?\\C:\\Users\\danie\\OneDrive\\github-repos\\Agentenplattform\\apps\\backend\\app\\main.py","hunks":[{"oldStart":166,"oldLines":6,"newStart":166,"newLines":11,"lines":["             db.query(models.Document).order_by(models.Document.created_at.desc()).limit(100)]"," "," # --- Finanzen: CSV-Import + Snapshots ---","+def _betrag(roh: str) -> float:","+    \"\"\"Versteht deutsche (1.234,56) und englische (1234.56) Beträge.\"\"\"","+    s = roh.strip().replace(\" \", \"\")","+    if \",\" in s: s = s.replace(\".\", \"\").replace(\",\", \".\")","+    return float(s)"," @app.post(\"/api/v1/finance/import\")"," async def finance_import(datei: UploadFile = File(...), db: Session = Depends(get_db), _: str = Depends(aktuell)):","     import csv, io"]}]}]}
