// Goose-Port-Spiegel von: muse-code/local-share-muse/sessions/2026/10/29/01a18967-8f34-75e3-bd91-9db28a27fadd/tool-outputs/01a1897b-3e30-7003-8434-f9cc7cf98495/call_01a1897b2e5872b9b44a4d7e646e1a60-tool_patch.json
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: muse-code/local-share-muse/sessions/2026/10/29/01a18967-8f34-75e3-bd91-9db28a27fadd/tool-outputs/01a1897b-3e30-7003-8434-f9cc7cf98495/call_01a1897b2e5872b9b44a4d7e646e1a60-tool_patch.json");
}

// ---- Original-Code (muse-code/local-share-muse/sessions/2026/10/29/01a18967-8f34-75e3-bd91-9db28a27fadd/tool-outputs/01a1897b-3e30-7003-8434-f9cc7cf98495/call_01a1897b2e5872b9b44a4d7e646e1a60-tool_patch.json), unveraendert, als Inline-Doku ----
// {"files":[{"path":"\\\\?\\C:\\Users\\danie\\OneDrive\\github-repos\\Agentenplattform\\apps\\backend\\app\\agents\\registry.py","hunks":[{"oldStart":3,"oldLines":6,"newStart":3,"newLines":7,"lines":[" "," class AgentDefinition(BaseModel):","     id: str; name: str; beschreibung: str = \"\"","+    systemprompt: str = \"\"","     modellprofil: str = \"standard\"; tools: list[str] = []; timeout_s: int = 300","     max_calls: int = 10; enabled: bool = True"," "]}]}]}
