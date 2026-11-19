// Goose-Port-Spiegel von: muse-code/local-share-muse/sessions/2026/10/22/01a16582-e2b1-7be0-accd-e5e34d399cfe/tool-outputs/01a165a6-2a5b-7fe3-b1b7-1a2457f6882c/call_01a165a61d2e711abe194e1b602187c7-tool_patch.json
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: muse-code/local-share-muse/sessions/2026/10/22/01a16582-e2b1-7be0-accd-e5e34d399cfe/tool-outputs/01a165a6-2a5b-7fe3-b1b7-1a2457f6882c/call_01a165a61d2e711abe194e1b602187c7-tool_patch.json");
}

// ---- Original-Code (muse-code/local-share-muse/sessions/2026/10/22/01a16582-e2b1-7be0-accd-e5e34d399cfe/tool-outputs/01a165a6-2a5b-7fe3-b1b7-1a2457f6882c/call_01a165a61d2e711abe194e1b602187c7-tool_patch.json), unveraendert, als Inline-Doku ----
// {"files":[{"path":"\\\\?\\C:\\Users\\danie\\OneDrive\\github-repos\\infra-pilot\\services\\management-panel\\src\\pages\\Dashboard.tsx","hunks":[{"oldStart":236,"oldLines":7,"newStart":236,"newLines":12,"lines":["                   cpu={Math.floor(Math.random() * 50) + 5}","                   memory={Math.floor(Math.random() * 512) + 128}","                   uptime=\"3d 14h\"","-                  ports={app.ports}","+                  ports={app.ports}","+                  creature={","+                    (app.container_id && creatures[app.container_id]) ||","+                    Object.values(creatures).find((c) => c.display_name === app.name) ||","+                    null","+                  }","                   onClick={() => navigate(`/apps/${app.id}`)}","                 />","               ))}"]}]}]}
