// Goose-Port-Spiegel von: muse-code/local-share-muse/sessions/2026/10/29/01a18967-8f34-75e3-bd91-9db28a27fadd/tool-outputs/01a18969-85d5-7572-b8c0-95d17e02380f/call_01a1896978df765a80ac1127745c0472-tool_patch.json
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: muse-code/local-share-muse/sessions/2026/10/29/01a18967-8f34-75e3-bd91-9db28a27fadd/tool-outputs/01a18969-85d5-7572-b8c0-95d17e02380f/call_01a1896978df765a80ac1127745c0472-tool_patch.json");
}

// ---- Original-Code (muse-code/local-share-muse/sessions/2026/10/29/01a18967-8f34-75e3-bd91-9db28a27fadd/tool-outputs/01a18969-85d5-7572-b8c0-95d17e02380f/call_01a1896978df765a80ac1127745c0472-tool_patch.json), unveraendert, als Inline-Doku ----
// {"files":[{"path":"\\\\?\\C:\\Users\\danie\\OneDrive\\github-repos\\Agentenplattform\\apps\\backend\\app\\core\\logging.py","hunks":[{"oldStart":1,"oldLines":0,"newStart":1,"newLines":12,"lines":["+\"\"\"Strukturierte JSON-Logs ohne Secrets.\"\"\"","+import json, logging, sys","+","+class JsonFormatter(logging.Formatter):","+    def format(self, record):","+        payload = {\"level\": record.levelname, \"msg\": record.getMessage(),","+                   \"logger\": record.name, \"corr\": getattr(record, \"corr\", \"-\")}","+        return json.dumps(payload, ensure_ascii=False)","+","+h = logging.StreamHandler(sys.stdout); h.setFormatter(JsonFormatter())","+root = logging.getLogger(); root.handlers = [h]; root.setLevel(logging.INFO)","+def get_logger(name: str): return logging.getLogger(name)"]}]}]}
