// Goose-Port-Spiegel von: muse-code/local-share-muse/sessions/2026/10/29/01a18967-8f34-75e3-bd91-9db28a27fadd/tool-outputs/01a18969-64a6-7d11-8b81-801ca643d208/call_01a1896956de76128e7da6122e538480-tool_patch.json
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: muse-code/local-share-muse/sessions/2026/10/29/01a18967-8f34-75e3-bd91-9db28a27fadd/tool-outputs/01a18969-64a6-7d11-8b81-801ca643d208/call_01a1896956de76128e7da6122e538480-tool_patch.json");
}

// ---- Original-Code (muse-code/local-share-muse/sessions/2026/10/29/01a18967-8f34-75e3-bd91-9db28a27fadd/tool-outputs/01a18969-64a6-7d11-8b81-801ca643d208/call_01a1896956de76128e7da6122e538480-tool_patch.json), unveraendert, als Inline-Doku ----
// {"files":[{"path":"\\\\?\\C:\\Users\\danie\\OneDrive\\github-repos\\Agentenplattform\\apps\\backend\\app\\core\\config.py","hunks":[{"oldStart":1,"oldLines":0,"newStart":1,"newLines":17,"lines":["+\"\"\"Zentrale Einstellungen (Umgebung). Keine Secrets im Code.\"\"\"","+from pydantic_settings import BaseSettings, SettingsConfigDict","+","+class Settings(BaseSettings):","+    model_config = SettingsConfigDict(env_file=\".env\", extra=\"ignore\")","+    app_env: str = \"development\"","+    secret_key: str = \"CHANGE_ME_32_ZEICHEN_MINDESTENS\"","+    database_url: str = \"postgresql+psycopg://agent:agent@db:5432/agentenplattform\"","+    redis_url: str = \"redis://redis:6379/0\"","+    allowed_email_sender: str = \"ich@example.de\"","+    demo_mode: bool = True","+    facade_enabled: bool = False","+    facade_api_key: str = \"\"","+    outbound_mail_enabled: bool = False","+    sos_delivery_enabled: bool = False","+","+settings = Settings()"]}]}]}
