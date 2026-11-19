// Goose-Port-Spiegel von: muse-code/local-share-muse/sessions/2026/10/22/01a16582-e2b1-7be0-accd-e5e34d399cfe/tool-outputs/01a1659c-be22-7110-b55b-35925ebaaec2/call_01a1659cb25975a6838c89d0780ac5ff-tool_patch.json
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: muse-code/local-share-muse/sessions/2026/10/22/01a16582-e2b1-7be0-accd-e5e34d399cfe/tool-outputs/01a1659c-be22-7110-b55b-35925ebaaec2/call_01a1659cb25975a6838c89d0780ac5ff-tool_patch.json");
}

// ---- Original-Code (muse-code/local-share-muse/sessions/2026/10/22/01a16582-e2b1-7be0-accd-e5e34d399cfe/tool-outputs/01a1659c-be22-7110-b55b-35925ebaaec2/call_01a1659cb25975a6838c89d0780ac5ff-tool_patch.json), unveraendert, als Inline-Doku ----
// {"files":[{"path":"\\\\?\\C:\\Users\\danie\\OneDrive\\github-repos\\infra-pilot\\services\\orchestrator-agent\\living_fleet.py","hunks":[{"oldStart":127,"oldLines":6,"newStart":127,"newLines":9,"lines":["     \"\"\"Deterministic mood derivation. Order matters: ghost first, thriving last.\"\"\"","     if down_minutes >= GHOST_MINUTES:","         return \"ghost\"","+    if signals.get(\"running\") is False:","+        # Confirmed stopped: never thriving/sad/content on vitals alone.","+        return \"sick\"","     if (vitals.get(\"health\") is not None and vitals[\"health\"] <= SICK_MAX) or signals.get(","         \"healthcheck_ok\"","     ) is False:"]}]}]}
