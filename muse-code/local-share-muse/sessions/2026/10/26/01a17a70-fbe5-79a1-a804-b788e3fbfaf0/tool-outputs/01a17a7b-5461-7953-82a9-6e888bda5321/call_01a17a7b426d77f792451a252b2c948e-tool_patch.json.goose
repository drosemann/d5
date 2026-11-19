// Goose-Port-Spiegel von: muse-code/local-share-muse/sessions/2026/10/26/01a17a70-fbe5-79a1-a804-b788e3fbfaf0/tool-outputs/01a17a7b-5461-7953-82a9-6e888bda5321/call_01a17a7b426d77f792451a252b2c948e-tool_patch.json
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: muse-code/local-share-muse/sessions/2026/10/26/01a17a70-fbe5-79a1-a804-b788e3fbfaf0/tool-outputs/01a17a7b-5461-7953-82a9-6e888bda5321/call_01a17a7b426d77f792451a252b2c948e-tool_patch.json");
}

// ---- Original-Code (muse-code/local-share-muse/sessions/2026/10/26/01a17a70-fbe5-79a1-a804-b788e3fbfaf0/tool-outputs/01a17a7b-5461-7953-82a9-6e888bda5321/call_01a17a7b426d77f792451a252b2c948e-tool_patch.json), unveraendert, als Inline-Doku ----
// {"files":[{"path":"\\\\?\\C:\\Users\\danie\\OneDrive\\github-repos\\infra-pilot\\services\\orchestrator-agent\\living_fleet.py","hunks":[{"oldStart":19,"oldLines":7,"newStart":19,"newLines":8,"lines":["     if os.getenv(\"FEATURE_FLAGS_ENABLED\", \"false\").lower() != \"true\":","         return os.getenv(\"LIVING_FLEET_ENABLED\", \"false\").lower() == \"true\"","     try:","-        from .feature_flags import is_enabled","+        from .feature_flags import client as _flag_client, is_enabled","+        _flag_client.start()","         return is_enabled(\"living_fleet\", default=False)","     except Exception:","         return False"]}]}]}
