// Goose-Port-Spiegel von: muse-code/local-share-muse/sessions/2026/10/22/01a16582-e2b1-7be0-accd-e5e34d399cfe/tool-outputs/01a1659c-5a3a-7831-911a-b4438e4cafab/call_01a1659c518370909aafc1aab9d96093-tool_patch.json
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: muse-code/local-share-muse/sessions/2026/10/22/01a16582-e2b1-7be0-accd-e5e34d399cfe/tool-outputs/01a1659c-5a3a-7831-911a-b4438e4cafab/call_01a1659c518370909aafc1aab9d96093-tool_patch.json");
}

// ---- Original-Code (muse-code/local-share-muse/sessions/2026/10/22/01a16582-e2b1-7be0-accd-e5e34d399cfe/tool-outputs/01a1659c-5a3a-7831-911a-b4438e4cafab/call_01a1659c518370909aafc1aab9d96093-tool_patch.json), unveraendert, als Inline-Doku ----
// {"files":[{"path":"\\\\?\\C:\\Users\\danie\\OneDrive\\github-repos\\infra-pilot\\cli\\ipilot\\client.py","hunks":[{"oldStart":720,"oldLines":6,"newStart":720,"newLines":6,"lines":["         \"\"\"Rename a creature (the only allowed mutation).\"\"\"","         return self._request(","             \"POST\",","-            f\"/api/v1/fleet/creatures/{workload_id}/rename\",","+            f\"/v1/fleet/creatures/{workload_id}/rename\",","             {\"display_name\": display_name},","         )"]}]}]}
