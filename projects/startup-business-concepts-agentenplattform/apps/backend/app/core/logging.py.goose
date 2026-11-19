// Goose-Port-Spiegel von: projects/startup-business-concepts-agentenplattform/apps/backend/app/core/logging.py
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/startup-business-concepts-agentenplattform/apps/backend/app/core/logging.py");
}

// ---- Original-Code (projects/startup-business-concepts-agentenplattform/apps/backend/app/core/logging.py), unveraendert, als Inline-Doku ----
// """Strukturierte JSON-Logs ohne Secrets."""
// import json, logging, sys
//
// class JsonFormatter(logging.Formatter):
//     def format(self, record):
//         payload = {"level": record.levelname, "msg": record.getMessage(),
//                    "logger": record.name, "corr": getattr(record, "corr", "-")}
//         return json.dumps(payload, ensure_ascii=False)
//
// h = logging.StreamHandler(sys.stdout); h.setFormatter(JsonFormatter())
// root = logging.getLogger(); root.handlers = [h]; root.setLevel(logging.INFO)
// def get_logger(name: str): return logging.getLogger(name)
//
