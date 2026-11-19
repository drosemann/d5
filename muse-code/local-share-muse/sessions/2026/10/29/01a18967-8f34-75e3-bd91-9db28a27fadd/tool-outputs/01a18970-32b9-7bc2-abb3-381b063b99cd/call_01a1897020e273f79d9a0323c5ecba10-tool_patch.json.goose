// Goose-Port-Spiegel von: muse-code/local-share-muse/sessions/2026/10/29/01a18967-8f34-75e3-bd91-9db28a27fadd/tool-outputs/01a18970-32b9-7bc2-abb3-381b063b99cd/call_01a1897020e273f79d9a0323c5ecba10-tool_patch.json
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: muse-code/local-share-muse/sessions/2026/10/29/01a18967-8f34-75e3-bd91-9db28a27fadd/tool-outputs/01a18970-32b9-7bc2-abb3-381b063b99cd/call_01a1897020e273f79d9a0323c5ecba10-tool_patch.json");
}

// ---- Original-Code (muse-code/local-share-muse/sessions/2026/10/29/01a18967-8f34-75e3-bd91-9db28a27fadd/tool-outputs/01a18970-32b9-7bc2-abb3-381b063b99cd/call_01a1897020e273f79d9a0323c5ecba10-tool_patch.json), unveraendert, als Inline-Doku ----
// {"files":[{"path":"\\\\?\\C:\\Users\\danie\\OneDrive\\github-repos\\Agentenplattform\\docs\\configuration.md","hunks":[{"oldStart":1,"oldLines":0,"newStart":1,"newLines":7,"lines":["+# Konfiguration & Agenten & Fehlersuche","+- **Konfiguration**: `.env` (siehe `.env.example`); Secrets als Dateien; Aufbewahrungsfristen und Kontakte in Einstellungen.","+- **Agenten**: 21 Registry-Einträge (`registry.py`), Details in `config/agents/`; Deaktivieren stoppt neue Jobs; Safety/SOS deterministisch.","+- **Modell-Provider**: Ollama/OpenAI/kompatibel mit Capabilities; Schlüssel nur als „gesetzt\"-Flag; Verbindungstest in Einstellungen.","+- **E-Mail**: ein Postfach, Absender-Allowlist, Präfixe, 15-MB-Limit; Versand standardmäßig aus.","+- **Backups**: `infra/backup/backup.sh` (restic); ohne Ziel Status „nicht konfiguriert\".","+- **Fehlersuche**: `/health/live`, `/health/ready`; JSON-Logs; Providerstatus in Einstellungen; verwaiste Jobs als `failed` markiert."]}]}]}
