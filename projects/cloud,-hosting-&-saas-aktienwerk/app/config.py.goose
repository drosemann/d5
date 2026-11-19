// Goose-Port-Spiegel von: projects/cloud,-hosting-&-saas-aktienwerk/app/config.py
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/cloud,-hosting-&-saas-aktienwerk/app/config.py");
}

// ---- Original-Code (projects/cloud,-hosting-&-saas-aktienwerk/app/config.py), unveraendert, als Inline-Doku ----
// import os
// from pathlib import Path
//
//
// ROOT = Path(__file__).resolve().parent.parent
// DATA_DIR = Path(os.environ.get("AKTIENWERK_DATA_DIR", ROOT / "data"))
// DATABASE_PATH = Path(os.environ.get("AKTIENWERK_DATABASE", DATA_DIR / "aktienwerk.sqlite3"))
// HOST = os.environ.get("AKTIENWERK_HOST", "0.0.0.0")
// PORT = int(os.environ.get("AKTIENWERK_PORT", "8080"))
// SITE_URL = os.environ.get("SITE_URL", f"http://localhost:{PORT}").rstrip("/")
// SEC_USER_AGENT = os.environ.get("SEC_USER_AGENT", "Aktienwerk/1.0 kontakt@example.com")
// OLLAMA_URL = os.environ.get("OLLAMA_URL", "http://localhost:11434")
// OLLAMA_MODEL = os.environ.get("OLLAMA_MODEL", "llama3.1")
// FMP_API_KEY = os.environ.get("FMP_API_KEY", "")
// POLL_INTERVAL = int(os.environ.get("POLL_INTERVAL_SECONDS", "3600"))
// REQUEST_TIMEOUT = int(os.environ.get("REQUEST_TIMEOUT_SECONDS", "25"))
//
