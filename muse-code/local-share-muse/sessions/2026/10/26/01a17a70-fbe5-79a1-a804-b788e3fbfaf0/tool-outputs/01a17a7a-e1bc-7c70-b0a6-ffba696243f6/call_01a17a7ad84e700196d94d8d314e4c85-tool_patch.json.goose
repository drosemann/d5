// Goose-Port-Spiegel von: muse-code/local-share-muse/sessions/2026/10/26/01a17a70-fbe5-79a1-a804-b788e3fbfaf0/tool-outputs/01a17a7a-e1bc-7c70-b0a6-ffba696243f6/call_01a17a7ad84e700196d94d8d314e4c85-tool_patch.json
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: muse-code/local-share-muse/sessions/2026/10/26/01a17a70-fbe5-79a1-a804-b788e3fbfaf0/tool-outputs/01a17a7a-e1bc-7c70-b0a6-ffba696243f6/call_01a17a7ad84e700196d94d8d314e4c85-tool_patch.json");
}

// ---- Original-Code (muse-code/local-share-muse/sessions/2026/10/26/01a17a70-fbe5-79a1-a804-b788e3fbfaf0/tool-outputs/01a17a7a-e1bc-7c70-b0a6-ffba696243f6/call_01a17a7ad84e700196d94d8d314e4c85-tool_patch.json), unveraendert, als Inline-Doku ----
// {"files":[{"path":"\\\\?\\C:\\Users\\danie\\OneDrive\\github-repos\\infra-pilot\\services\\orchestrator-agent\\config.py","hunks":[{"oldStart":159,"oldLines":7,"newStart":159,"newLines":9,"lines":["     # GitOps","     GITOPS_MAX_VERSIONS_PER_VPS: int = 50","     FEATURE_FLAGS_ENABLED: bool = os.getenv(\"FEATURE_FLAGS_ENABLED\", \"false\").lower() == \"true\"","-    GITOPS_WEBHOOK_PORT: int = 8500","+    GITOPS_WEBHOOK_PORT: int = 8500","+    FEATURE_FLAGS_PANEL_URL: str = os.getenv(\"FEATURE_FLAGS_PANEL_URL\", \"http://localhost:3001\")","+    FEATURE_FLAGS_POLL_SECONDS: int = int(os.getenv(\"FEATURE_FLAGS_POLL_SECONDS\", \"30\"))"," ","     # Auto-scale (overridable via environment variables)","     AUTO_SCALE_COOLDOWN_MINUTES: int = int("]}]}]}
