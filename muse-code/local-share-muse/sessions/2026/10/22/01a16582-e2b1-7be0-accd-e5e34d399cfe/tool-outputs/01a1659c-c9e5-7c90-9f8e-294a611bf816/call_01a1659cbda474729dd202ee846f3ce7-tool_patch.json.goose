// Goose-Port-Spiegel von: muse-code/local-share-muse/sessions/2026/10/22/01a16582-e2b1-7be0-accd-e5e34d399cfe/tool-outputs/01a1659c-c9e5-7c90-9f8e-294a611bf816/call_01a1659cbda474729dd202ee846f3ce7-tool_patch.json
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: muse-code/local-share-muse/sessions/2026/10/22/01a16582-e2b1-7be0-accd-e5e34d399cfe/tool-outputs/01a1659c-c9e5-7c90-9f8e-294a611bf816/call_01a1659cbda474729dd202ee846f3ce7-tool_patch.json");
}

// ---- Original-Code (muse-code/local-share-muse/sessions/2026/10/22/01a16582-e2b1-7be0-accd-e5e34d399cfe/tool-outputs/01a1659c-c9e5-7c90-9f8e-294a611bf816/call_01a1659cbda474729dd202ee846f3ce7-tool_patch.json), unveraendert, als Inline-Doku ----
// {"files":[{"path":"\\\\?\\C:\\Users\\danie\\OneDrive\\github-repos\\infra-pilot\\services\\orchestrator-agent\\living_fleet.py","hunks":[{"oldStart":297,"oldLines":7,"newStart":297,"newLines":11,"lines":["         return web.json_response({\"error\": \"living fleet disabled\"}, status=404)","     data = _load_all()","     return web.json_response(","-        [public_view(c) for c in data.values() if not c.get(\"retired\")]","+        [","+            public_view(c, c.get(\"last_signals\") or {})","+            for c in data.values()","+            if not c.get(\"retired\")","+        ]","     )"," "," "]}]}]}
