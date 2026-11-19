// Goose-Port-Spiegel von: muse-code/local-share-muse/sessions/2026/10/29/01a18967-8f34-75e3-bd91-9db28a27fadd/tool-outputs/01a18990-e7d1-7643-9aac-7f88dbe4ab8e/call_01a18990dc4b717dbbb7616d73b6779a-tool_patch.json
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: muse-code/local-share-muse/sessions/2026/10/29/01a18967-8f34-75e3-bd91-9db28a27fadd/tool-outputs/01a18990-e7d1-7643-9aac-7f88dbe4ab8e/call_01a18990dc4b717dbbb7616d73b6779a-tool_patch.json");
}

// ---- Original-Code (muse-code/local-share-muse/sessions/2026/10/29/01a18967-8f34-75e3-bd91-9db28a27fadd/tool-outputs/01a18990-e7d1-7643-9aac-7f88dbe4ab8e/call_01a18990dc4b717dbbb7616d73b6779a-tool_patch.json), unveraendert, als Inline-Doku ----
// {"files":[{"path":"\\\\?\\C:\\Users\\danie\\OneDrive\\github-repos\\Agentenplattform\\apps\\backend\\app\\services\\mail_eingang.py","hunks":[{"oldStart":68,"oldLines":7,"newStart":68,"newLines":6,"lines":["                 betreff, text = _betreff(nachricht), _text_aus_msg(nachricht)","                 ziel = praefix_erkennen(betreff, text)","                 r = auftrag_anlegen(ziel, betreff or \"(ohne Betreff)\", {\"text\": text, \"via\": \"mail\"})","-                from app.services.runner import MAX_RETRIES  # noqa: nur Typnähe, kein Einfluss","                 import uuid","                 t = models.Task(agent_id=r[\"agent_id\"], title=betreff or \"(ohne Betreff)\",","                                 input={\"text\": text, \"via\": \"mail\"}, status=\"queued\","]}]}]}
