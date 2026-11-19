// Goose-Port-Spiegel von: muse-code/local-share-muse/sessions/2026/10/22/01a16582-e2b1-7be0-accd-e5e34d399cfe/tool-outputs/01a16587-4bfc-7030-9412-003b35b5ea24/call_01a165873ff073efa787e8fc0e680182-tool_patch.json
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: muse-code/local-share-muse/sessions/2026/10/22/01a16582-e2b1-7be0-accd-e5e34d399cfe/tool-outputs/01a16587-4bfc-7030-9412-003b35b5ea24/call_01a165873ff073efa787e8fc0e680182-tool_patch.json");
}

// ---- Original-Code (muse-code/local-share-muse/sessions/2026/10/22/01a16582-e2b1-7be0-accd-e5e34d399cfe/tool-outputs/01a16587-4bfc-7030-9412-003b35b5ea24/call_01a165873ff073efa787e8fc0e680182-tool_patch.json), unveraendert, als Inline-Doku ----
// {"files":[{"path":"\\\\?\\C:\\Users\\danie\\OneDrive\\github-repos\\infra-pilot\\cli\\ipilot\\commands\\__init__.py","hunks":[{"oldStart":37,"oldLines":7,"newStart":37,"newLines":8,"lines":[" register(\"apikeys\", \"API key management\")(apikeys_app)"," register(\"templates\", \"Deployment templates\")(templates_app)"," register(\"tui\", \"Terminal UI mode\")(tui_app)","-register(\"rollback\", \"Undo/rollback changes\")(rollback_app)","+register(\"rollback\", \"Undo/rollback changes\")(rollback_app)","+register(\"pet\", \"Living Fleet creature status\")(pet_app)"," "," __all__: list[str] = [","     \"server_app\","]}]}]}
