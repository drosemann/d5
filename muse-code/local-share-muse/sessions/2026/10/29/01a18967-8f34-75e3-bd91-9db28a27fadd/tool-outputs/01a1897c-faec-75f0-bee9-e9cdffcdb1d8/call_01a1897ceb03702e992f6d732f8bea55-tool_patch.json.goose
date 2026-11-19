// Goose-Port-Spiegel von: muse-code/local-share-muse/sessions/2026/10/29/01a18967-8f34-75e3-bd91-9db28a27fadd/tool-outputs/01a1897c-faec-75f0-bee9-e9cdffcdb1d8/call_01a1897ceb03702e992f6d732f8bea55-tool_patch.json
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: muse-code/local-share-muse/sessions/2026/10/29/01a18967-8f34-75e3-bd91-9db28a27fadd/tool-outputs/01a1897c-faec-75f0-bee9-e9cdffcdb1d8/call_01a1897ceb03702e992f6d732f8bea55-tool_patch.json");
}

// ---- Original-Code (muse-code/local-share-muse/sessions/2026/10/29/01a18967-8f34-75e3-bd91-9db28a27fadd/tool-outputs/01a1897c-faec-75f0-bee9-e9cdffcdb1d8/call_01a1897ceb03702e992f6d732f8bea55-tool_patch.json), unveraendert, als Inline-Doku ----
// {"files":[{"path":"\\\\?\\C:\\Users\\danie\\OneDrive\\github-repos\\Agentenplattform\\apps\\backend\\app\\services\\runner.py","hunks":[{"oldStart":58,"oldLines":9,"newStart":58,"newLines":9,"lines":["         try:","             gateway = _gateway_fuer(task.agent_id, db)","             text = task.title + \"\\n\" + str(task.input.get(\"text\", \"\"))","-            antwort = _gateway_sync(gateway, text, d.modellprofil)","+            antwort = _agent_durchlauf(gateway, d, text, task, db, run)","             task.result = {\"text\": antwort.text, \"modell\": antwort.modell,","-                           \"versuch\": versuch + 1}","+                           \"tool_calls\": len(antwort.tool_calls), \"versuch\": versuch + 1}","             break","         except Exception as e:  # noqa: BLE001 – Fehlerdetails bleiben nachvollziehbar","             versuch += 1"]}]}]}
