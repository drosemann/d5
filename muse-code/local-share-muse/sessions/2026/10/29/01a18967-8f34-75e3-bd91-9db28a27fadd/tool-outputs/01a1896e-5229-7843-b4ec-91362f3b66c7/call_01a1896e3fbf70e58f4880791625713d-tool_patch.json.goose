// Goose-Port-Spiegel von: muse-code/local-share-muse/sessions/2026/10/29/01a18967-8f34-75e3-bd91-9db28a27fadd/tool-outputs/01a1896e-5229-7843-b4ec-91362f3b66c7/call_01a1896e3fbf70e58f4880791625713d-tool_patch.json
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: muse-code/local-share-muse/sessions/2026/10/29/01a18967-8f34-75e3-bd91-9db28a27fadd/tool-outputs/01a1896e-5229-7843-b4ec-91362f3b66c7/call_01a1896e3fbf70e58f4880791625713d-tool_patch.json");
}

// ---- Original-Code (muse-code/local-share-muse/sessions/2026/10/29/01a18967-8f34-75e3-bd91-9db28a27fadd/tool-outputs/01a1896e-5229-7843-b4ec-91362f3b66c7/call_01a1896e3fbf70e58f4880791625713d-tool_patch.json), unveraendert, als Inline-Doku ----
// {"files":[{"path":"\\\\?\\C:\\Users\\danie\\OneDrive\\github-repos\\Agentenplattform\\docs\\architecture.md","hunks":[{"oldStart":1,"oldLines":0,"newStart":1,"newLines":5,"lines":["+# Architektur","+- **Backend** (FastAPI): Auth, Agenten-Registry, Orchestrator, Modell-Gateway, Tools, Mail, Markt, Safety; PostgreSQL als Wahrheit, Redis optional.","+- **Worker**: nimmt Jobs entgegen; verwaiste Jobs werden beim Start als `failed` markiert (nachvollziehbar).","+- **PWA** (React/TS): Dashboard, Agenten, Chat, Angebote, Standort/SOS, Freigaben, Einstellungen.","+- **Regeln**: Deterministische Logik vor KI; Least Privilege; Provider-Unabhängigkeit; Idempotenz; Timeouts; keine versteckten Schreibrechte; kein `shell` aus LLM-Output; Fehler sichtbar."]}]}]}
