// Goose-Port-Spiegel von: muse-code/local-share-muse/sessions/2026/10/24/01a16af4-0730-77d2-b279-88f654bfb01e/tool-outputs/01a16afe-db34-78a1-b3dd-256ca85ca323/call_01a16afed22276b685e036c396d22fe9-tool_patch.json
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: muse-code/local-share-muse/sessions/2026/10/24/01a16af4-0730-77d2-b279-88f654bfb01e/tool-outputs/01a16afe-db34-78a1-b3dd-256ca85ca323/call_01a16afed22276b685e036c396d22fe9-tool_patch.json");
}

// ---- Original-Code (muse-code/local-share-muse/sessions/2026/10/24/01a16af4-0730-77d2-b279-88f654bfb01e/tool-outputs/01a16afe-db34-78a1-b3dd-256ca85ca323/call_01a16afed22276b685e036c396d22fe9-tool_patch.json), unveraendert, als Inline-Doku ----
// {"files":[{"path":"\\\\?\\C:\\Users\\danie\\OneDrive\\github-repos\\infra-pilot\\.github\\workflows\\screenshots.yml","hunks":[{"oldStart":60,"oldLines":6,"newStart":60,"newLines":7,"lines":["           python3 -c \"from PIL import Image; from pathlib import Path; p=Path('docs/screenshots'); f=[Image.open(p / n).convert('RGB').resize((800, 450)).convert('P', palette=Image.Palette.ADAPTIVE) for n in ['01-dashboard.png', '02-monitoring.png', '03-applications.png', '04-backups.png', '05-cli-gitops.png', '06-deployments.png']]; f[0].save(p / 'tour.gif', save_all=True, append_images=f[1:], duration=1800, loop=0, optimize=True)\""," ","       - name: Commit updated screenshots","+        if: github.event.pull_request.head.repo.full_name == github.repository || github.event_name == 'workflow_dispatch'","         run: |","           git config user.name \"github-actions[bot]\"","           git config user.email \"github-actions[bot]@users.noreply.github.com\""]}]}]}
