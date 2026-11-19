// Goose-Port-Spiegel von: muse-code/local-share-muse/sessions/2026/10/24/01a16af4-0730-77d2-b279-88f654bfb01e/tool-outputs/01a16afe-fc94-7293-a78f-ff71c418e5b3/call_01a16afef3f674fabb97ce17f197997b-tool_patch.json
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: muse-code/local-share-muse/sessions/2026/10/24/01a16af4-0730-77d2-b279-88f654bfb01e/tool-outputs/01a16afe-fc94-7293-a78f-ff71c418e5b3/call_01a16afef3f674fabb97ce17f197997b-tool_patch.json");
}

// ---- Original-Code (muse-code/local-share-muse/sessions/2026/10/24/01a16af4-0730-77d2-b279-88f654bfb01e/tool-outputs/01a16afe-fc94-7293-a78f-ff71c418e5b3/call_01a16afef3f674fabb97ce17f197997b-tool_patch.json), unveraendert, als Inline-Doku ----
// {"files":[{"path":"\\\\?\\C:\\Users\\danie\\OneDrive\\github-repos\\infra-pilot\\.github\\workflows\\screenshots.yml","hunks":[{"oldStart":69,"oldLines":7,"newStart":69,"newLines":7,"lines":["           git add docs/screenshots/*.png docs/screenshots/tour.gif","           git diff --cached --quiet && echo \"Screenshots unchanged\" && exit 0","           git commit -m \"docs(screenshots): refresh panel captures [skip ci]\"","-          git push","+          git push origin HEAD:${{ github.head_ref || github.ref_name }}"," ","       - name: Upload screenshots","         if: always()"]}]}]}
