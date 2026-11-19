// Goose-Port-Spiegel von: muse-code/local-share-muse/sessions/2026/10/22/01a16582-e2b1-7be0-accd-e5e34d399cfe/tool-outputs/01a165ab-5d23-7570-9530-1b193d2cf03d/call_01a165ab52b1766e89525866df78cd18-tool_patch.json
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: muse-code/local-share-muse/sessions/2026/10/22/01a16582-e2b1-7be0-accd-e5e34d399cfe/tool-outputs/01a165ab-5d23-7570-9530-1b193d2cf03d/call_01a165ab52b1766e89525866df78cd18-tool_patch.json");
}

// ---- Original-Code (muse-code/local-share-muse/sessions/2026/10/22/01a16582-e2b1-7be0-accd-e5e34d399cfe/tool-outputs/01a165ab-5d23-7570-9530-1b193d2cf03d/call_01a165ab52b1766e89525866df78cd18-tool_patch.json), unveraendert, als Inline-Doku ----
// {"files":[{"path":"\\\\?\\C:\\Users\\danie\\OneDrive\\github-repos\\infra-pilot\\services\\management-panel\\src\\components\\AppCard.tsx","hunks":[{"oldStart":101,"oldLines":6,"newStart":101,"newLines":11,"lines":["         </div>","       </div>"," ","+      {/* Living Fleet: why-detail, collapsed by default */}","+      {creature && creature.explanation && creature.explanation.length > 0 && (","+        <FleetWhy creature={creature} />","+      )}","+","       {/* Uptime */}","       {status === 'running' && (","         <p className=\"text-xs text-slate-400 mb-4\">Uptime: {uptime}</p>"]}]}]}
