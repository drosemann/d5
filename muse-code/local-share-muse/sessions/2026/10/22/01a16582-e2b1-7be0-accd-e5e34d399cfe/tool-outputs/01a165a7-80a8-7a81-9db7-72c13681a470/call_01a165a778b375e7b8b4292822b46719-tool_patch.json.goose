// Goose-Port-Spiegel von: muse-code/local-share-muse/sessions/2026/10/22/01a16582-e2b1-7be0-accd-e5e34d399cfe/tool-outputs/01a165a7-80a8-7a81-9db7-72c13681a470/call_01a165a778b375e7b8b4292822b46719-tool_patch.json
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: muse-code/local-share-muse/sessions/2026/10/22/01a16582-e2b1-7be0-accd-e5e34d399cfe/tool-outputs/01a165a7-80a8-7a81-9db7-72c13681a470/call_01a165a778b375e7b8b4292822b46719-tool_patch.json");
}

// ---- Original-Code (muse-code/local-share-muse/sessions/2026/10/22/01a16582-e2b1-7be0-accd-e5e34d399cfe/tool-outputs/01a165a7-80a8-7a81-9db7-72c13681a470/call_01a165a778b375e7b8b4292822b46719-tool_patch.json), unveraendert, als Inline-Doku ----
// {"files":[{"path":"\\\\?\\C:\\Users\\danie\\OneDrive\\github-repos\\infra-pilot\\services\\orchestrator-agent\\living_fleet.py","hunks":[{"oldStart":300,"oldLines":7,"newStart":300,"newLines":9,"lines":["     creature = data.get(workload_id)","     if creature is None or creature.get(\"retired\"):","         return None","-    creature[\"display_name\"] = display_name[:64]","+    if not isinstance(display_name, str) or not display_name.strip():","+        return None","+    creature[\"display_name\"] = display_name.strip()[:64]","     _save_all(data)","     return public_view(creature)"," "]}]}]}
