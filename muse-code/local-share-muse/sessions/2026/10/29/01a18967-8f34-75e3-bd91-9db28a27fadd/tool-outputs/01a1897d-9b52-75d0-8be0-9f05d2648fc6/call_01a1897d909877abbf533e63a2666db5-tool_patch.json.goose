// Goose-Port-Spiegel von: muse-code/local-share-muse/sessions/2026/10/29/01a18967-8f34-75e3-bd91-9db28a27fadd/tool-outputs/01a1897d-9b52-75d0-8be0-9f05d2648fc6/call_01a1897d909877abbf533e63a2666db5-tool_patch.json
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: muse-code/local-share-muse/sessions/2026/10/29/01a18967-8f34-75e3-bd91-9db28a27fadd/tool-outputs/01a1897d-9b52-75d0-8be0-9f05d2648fc6/call_01a1897d909877abbf533e63a2666db5-tool_patch.json");
}

// ---- Original-Code (muse-code/local-share-muse/sessions/2026/10/29/01a18967-8f34-75e3-bd91-9db28a27fadd/tool-outputs/01a1897d-9b52-75d0-8be0-9f05d2648fc6/call_01a1897d909877abbf533e63a2666db5-tool_patch.json), unveraendert, als Inline-Doku ----
// {"files":[{"path":"\\\\?\\C:\\Users\\danie\\OneDrive\\github-repos\\Agentenplattform\\apps\\backend\\app\\services\\runner.py","hunks":[{"oldStart":62,"oldLines":7,"newStart":62,"newLines":7,"lines":["     versuch = 0","     while versuch <= MAX_RETRIES:","         try:","-            gateway = _gateway_fuer(task.agent_id, db)","+            gateway, _profil = _gateway_fuer(task.agent_id, db)","             text = task.title + \"\\n\" + str(task.input.get(\"text\", \"\"))","             antwort = _agent_durchlauf(gateway, d, text, task, db, run)","             task.result = {\"text\": antwort.text, \"modell\": antwort.modell,"]}]}]}
