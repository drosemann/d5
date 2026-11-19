// Goose-Port-Spiegel von: muse-code/local-share-muse/sessions/2026/10/26/01a17a70-fbe5-79a1-a804-b788e3fbfaf0/tool-outputs/01a17a7b-d8ba-77e3-a32f-34dc2fb1e266/call_01a17a7bd34a771f82afba2e10317ed2-tool_patch.json
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: muse-code/local-share-muse/sessions/2026/10/26/01a17a70-fbe5-79a1-a804-b788e3fbfaf0/tool-outputs/01a17a7b-d8ba-77e3-a32f-34dc2fb1e266/call_01a17a7bd34a771f82afba2e10317ed2-tool_patch.json");
}

// ---- Original-Code (muse-code/local-share-muse/sessions/2026/10/26/01a17a70-fbe5-79a1-a804-b788e3fbfaf0/tool-outputs/01a17a7b-d8ba-77e3-a32f-34dc2fb1e266/call_01a17a7bd34a771f82afba2e10317ed2-tool_patch.json), unveraendert, als Inline-Doku ----
// {"files":[{"path":"\\\\?\\C:\\Users\\danie\\OneDrive\\github-repos\\infra-pilot\\cli\\ipilot\\commands\\__init__.py","hunks":[{"oldStart":25,"oldLines":7,"newStart":25,"newLines":8,"lines":[" from .ssh import app as ssh_app"," from .templates import app as templates_app"," from .tui import app as tui_app","-from .webhooks import app as webhooks_app","+from .webhooks import app as webhooks_app","+from .feature_flags import app as feature_flags_app"," "," register(\"gitops\", \"Infrastructure as Code (GitOps)\")(gitops_app)"," register(\"ssh\", \"SSH session management\")(ssh_app)"]}]}]}
