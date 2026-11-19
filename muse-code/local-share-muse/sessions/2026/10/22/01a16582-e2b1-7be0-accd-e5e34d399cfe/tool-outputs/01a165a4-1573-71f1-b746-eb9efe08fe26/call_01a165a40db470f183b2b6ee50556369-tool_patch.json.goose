// Goose-Port-Spiegel von: muse-code/local-share-muse/sessions/2026/10/22/01a16582-e2b1-7be0-accd-e5e34d399cfe/tool-outputs/01a165a4-1573-71f1-b746-eb9efe08fe26/call_01a165a40db470f183b2b6ee50556369-tool_patch.json
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: muse-code/local-share-muse/sessions/2026/10/22/01a16582-e2b1-7be0-accd-e5e34d399cfe/tool-outputs/01a165a4-1573-71f1-b746-eb9efe08fe26/call_01a165a40db470f183b2b6ee50556369-tool_patch.json");
}

// ---- Original-Code (muse-code/local-share-muse/sessions/2026/10/22/01a16582-e2b1-7be0-accd-e5e34d399cfe/tool-outputs/01a165a4-1573-71f1-b746-eb9efe08fe26/call_01a165a40db470f183b2b6ee50556369-tool_patch.json), unveraendert, als Inline-Doku ----
// {"files":[{"path":"\\\\?\\C:\\Users\\danie\\OneDrive\\github-repos\\infra-pilot\\services\\orchestrator-agent\\living_fleet.py","hunks":[{"oldStart":242,"oldLines":7,"newStart":242,"newLines":10,"lines":["                 },","                 signals,","             )","-        creature = get_or_birth(workload_id)","+        birth_name = signals.get(\"display_name\")","+        creature = get_or_birth(","+            workload_id, birth_name if isinstance(birth_name, str) else None","+        )","         data[workload_id] = creature","     vitals = compute_vitals(signals)","     down_since = creature.get(\"down_since\")"]}]}]}
