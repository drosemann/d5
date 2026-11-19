// Goose-Port-Spiegel von: muse-code/local-share-muse/sessions/2026/10/29/01a18967-8f34-75e3-bd91-9db28a27fadd/tool-outputs/01a18995-c6cc-7e33-9904-063eae4c23ec/call_01a18995ba8e7766b8da58b39430fd95-tool_patch.json
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: muse-code/local-share-muse/sessions/2026/10/29/01a18967-8f34-75e3-bd91-9db28a27fadd/tool-outputs/01a18995-c6cc-7e33-9904-063eae4c23ec/call_01a18995ba8e7766b8da58b39430fd95-tool_patch.json");
}

// ---- Original-Code (muse-code/local-share-muse/sessions/2026/10/29/01a18967-8f34-75e3-bd91-9db28a27fadd/tool-outputs/01a18995-c6cc-7e33-9904-063eae4c23ec/call_01a18995ba8e7766b8da58b39430fd95-tool_patch.json), unveraendert, als Inline-Doku ----
// {"files":[{"path":"\\\\?\\C:\\Users\\danie\\OneDrive\\github-repos\\Agentenplattform\\apps\\backend\\app\\main.py","hunks":[{"oldStart":265,"oldLines":7,"newStart":265,"newLines":9,"lines":[" @app.post(\"/api/v1/technews/import\")"," def news_import(b: NewsBitte, db: Session = Depends(get_db), _: str = Depends(aktuell)):","     from app.services.adapter import technews_import","-    feeds = b.feeds or [os.environ[\"TECHNEWS_FEEDS\"].split(\",\")[0]] if os.environ.get(\"TECHNEWS_FEEDS\") else []","+    feeds = list(b.feeds or [])","+    if not feeds and os.environ.get(\"TECHNEWS_FEEDS\"):","+        feeds = [f.strip() for f in os.environ[\"TECHNEWS_FEEDS\"].split(\",\") if f.strip()]","     return technews_import(db, feeds)"," "," # --- Kalender (Lesen/Schreiben; Agenten nur mit Freigabe-Tool) ---"]}]}]}
