// Goose-Port-Spiegel von: muse-code/local-share-muse/sessions/2026/10/29/01a18967-8f34-75e3-bd91-9db28a27fadd/tool-outputs/01a1897f-c538-70a1-aa76-74f8350ecebf/call_01a1897fb9a1705bb85989991ea85a01-tool_patch.json
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: muse-code/local-share-muse/sessions/2026/10/29/01a18967-8f34-75e3-bd91-9db28a27fadd/tool-outputs/01a1897f-c538-70a1-aa76-74f8350ecebf/call_01a1897fb9a1705bb85989991ea85a01-tool_patch.json");
}

// ---- Original-Code (muse-code/local-share-muse/sessions/2026/10/29/01a18967-8f34-75e3-bd91-9db28a27fadd/tool-outputs/01a1897f-c538-70a1-aa76-74f8350ecebf/call_01a1897fb9a1705bb85989991ea85a01-tool_patch.json), unveraendert, als Inline-Doku ----
// {"files":[{"path":"\\\\?\\C:\\Users\\danie\\OneDrive\\github-repos\\Agentenplattform\\apps\\backend\\app\\tasks\\worker.py","hunks":[{"oldStart":20,"oldLines":6,"newStart":20,"newLines":10,"lines":["     log.info(\"Worker gestartet (Polling alle 5s).\")","     try:","         while True:","+            try:","+                with open(\"/tmp/worker_heartbeat.txt\", \"w\") as f:","+                    from datetime import datetime; f.write(f\"worker ok {datetime.utcnow().isoformat()}\")","+            except Exception: pass","             db = SessionLocal()","             try:","                 nxt = (db.query(models.Task).filter_by(status=\"queued\")"]}]}]}
