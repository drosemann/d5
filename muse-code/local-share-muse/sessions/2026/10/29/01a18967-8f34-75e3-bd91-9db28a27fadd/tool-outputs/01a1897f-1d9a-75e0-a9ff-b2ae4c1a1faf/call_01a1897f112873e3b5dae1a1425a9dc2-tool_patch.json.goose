// Goose-Port-Spiegel von: muse-code/local-share-muse/sessions/2026/10/29/01a18967-8f34-75e3-bd91-9db28a27fadd/tool-outputs/01a1897f-1d9a-75e0-a9ff-b2ae4c1a1faf/call_01a1897f112873e3b5dae1a1425a9dc2-tool_patch.json
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: muse-code/local-share-muse/sessions/2026/10/29/01a18967-8f34-75e3-bd91-9db28a27fadd/tool-outputs/01a1897f-1d9a-75e0-a9ff-b2ae4c1a1faf/call_01a1897f112873e3b5dae1a1425a9dc2-tool_patch.json");
}

// ---- Original-Code (muse-code/local-share-muse/sessions/2026/10/29/01a18967-8f34-75e3-bd91-9db28a27fadd/tool-outputs/01a1897f-1d9a-75e0-a9ff-b2ae4c1a1faf/call_01a1897f112873e3b5dae1a1425a9dc2-tool_patch.json), unveraendert, als Inline-Doku ----
// {"files":[{"path":"\\\\?\\C:\\Users\\danie\\OneDrive\\github-repos\\Agentenplattform\\apps\\backend\\app\\main.py","hunks":[{"oldStart":14,"oldLines":6,"newStart":14,"newLines":16,"lines":[" "," Base.metadata.create_all(bind=engine)"," app = FastAPI(title=\"Agentenplattform\", docs_url=\"/docs\")","+","+@app.on_event(\"startup\")","+def _start():","+    try:","+        from app.tasks.scheduler import starten","+        starten()","+    except Exception: pass  # Scheduler optional – App läuft auch ohne","+    try:","+        with open(\"/tmp/worker_heartbeat.txt\", \"w\") as f: f.write(\"backend ok\")","+    except Exception: pass"," app.add_middleware(CORSMiddleware, allow_origins=[\"*\"], allow_methods=[\"*\"], allow_headers=[\"*\"])"," "," def aktuell(x_auth: str = Header(default=\"\")) -> str:"]}]}]}
