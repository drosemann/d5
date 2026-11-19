// Goose-Port-Spiegel von: muse-code/local-share-muse/sessions/2026/10/26/01a17a70-fbe5-79a1-a804-b788e3fbfaf0/tool-outputs/01a17a7a-efe4-7f51-a98d-b4ac71fd9f97/call_01a17a7ae4db7766a79e4688dabf0b3e-tool_patch.json
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: muse-code/local-share-muse/sessions/2026/10/26/01a17a70-fbe5-79a1-a804-b788e3fbfaf0/tool-outputs/01a17a7a-efe4-7f51-a98d-b4ac71fd9f97/call_01a17a7ae4db7766a79e4688dabf0b3e-tool_patch.json");
}

// ---- Original-Code (muse-code/local-share-muse/sessions/2026/10/26/01a17a70-fbe5-79a1-a804-b788e3fbfaf0/tool-outputs/01a17a7a-efe4-7f51-a98d-b4ac71fd9f97/call_01a17a7ae4db7766a79e4688dabf0b3e-tool_patch.json), unveraendert, als Inline-Doku ----
// {"files":[{"path":"\\\\?\\C:\\Users\\danie\\OneDrive\\github-repos\\infra-pilot\\services\\orchestrator-agent\\living_fleet.py","hunks":[{"oldStart":15,"oldLines":6,"newStart":15,"newLines":15,"lines":[" "," logger = logging.getLogger(__name__)"," ","+def _flags_enabled() -> bool:","+    if os.getenv(\"FEATURE_FLAGS_ENABLED\", \"false\").lower() != \"true\":","+        return os.getenv(\"LIVING_FLEET_ENABLED\", \"false\").lower() == \"true\"","+    try:","+        from .feature_flags import is_enabled","+        return is_enabled(\"living_fleet\", default=False)","+    except Exception:","+        return False","+"," ENABLED = os.getenv(\"LIVING_FLEET_ENABLED\", \"false\").lower() == \"true\""," STORE_PATH = os.getenv(","     \"LIVING_FLEET_STORE\", os.path.join(os.path.dirname(__file__), \"living_fleet.json\")"]}]}]}
