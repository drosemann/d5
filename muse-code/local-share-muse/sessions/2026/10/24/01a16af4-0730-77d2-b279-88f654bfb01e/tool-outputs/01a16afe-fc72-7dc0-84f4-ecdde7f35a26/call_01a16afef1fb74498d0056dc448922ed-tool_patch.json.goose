// Goose-Port-Spiegel von: muse-code/local-share-muse/sessions/2026/10/24/01a16af4-0730-77d2-b279-88f654bfb01e/tool-outputs/01a16afe-fc72-7dc0-84f4-ecdde7f35a26/call_01a16afef1fb74498d0056dc448922ed-tool_patch.json
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: muse-code/local-share-muse/sessions/2026/10/24/01a16af4-0730-77d2-b279-88f654bfb01e/tool-outputs/01a16afe-fc72-7dc0-84f4-ecdde7f35a26/call_01a16afef1fb74498d0056dc448922ed-tool_patch.json");
}

// ---- Original-Code (muse-code/local-share-muse/sessions/2026/10/24/01a16af4-0730-77d2-b279-88f654bfb01e/tool-outputs/01a16afe-fc72-7dc0-84f4-ecdde7f35a26/call_01a16afef1fb74498d0056dc448922ed-tool_patch.json), unveraendert, als Inline-Doku ----
// {"files":[{"path":"\\\\?\\C:\\Users\\danie\\OneDrive\\github-repos\\infra-pilot\\.github\\workflows\\screenshots.yml","hunks":[{"oldStart":25,"oldLines":6,"newStart":25,"newLines":8,"lines":["     name: Capture panel screenshots","     steps:","       - uses: actions/checkout@v7","+        with:","+          ref: ${{ github.event.pull_request.head.sha || github.ref }}"," ","       - uses: actions/setup-node@v4","         with:"]}]}]}
