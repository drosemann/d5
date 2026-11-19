// Goose-Port-Spiegel von: muse-code/local-share-muse/sessions/2026/10/22/01a16582-e2b1-7be0-accd-e5e34d399cfe/tool-outputs/01a165a6-0b61-79f3-bbc5-51909204c29f/call_01a165a60341734d964d33a60c6f0c68-tool_patch.json
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: muse-code/local-share-muse/sessions/2026/10/22/01a16582-e2b1-7be0-accd-e5e34d399cfe/tool-outputs/01a165a6-0b61-79f3-bbc5-51909204c29f/call_01a165a60341734d964d33a60c6f0c68-tool_patch.json");
}

// ---- Original-Code (muse-code/local-share-muse/sessions/2026/10/22/01a16582-e2b1-7be0-accd-e5e34d399cfe/tool-outputs/01a165a6-0b61-79f3-bbc5-51909204c29f/call_01a165a60341734d964d33a60c6f0c68-tool_patch.json), unveraendert, als Inline-Doku ----
// {"files":[{"path":"\\\\?\\C:\\Users\\danie\\OneDrive\\github-repos\\infra-pilot\\services\\management-panel\\src\\components\\AppCard.tsx","hunks":[{"oldStart":85,"oldLines":7,"newStart":85,"newLines":10,"lines":["             {getAppIcon()}","           </div>","           <div className=\"flex-1 min-w-0\">","-            <h3 className=\"font-semibold text-white truncate\">{name}</h3>","+            <h3 className=\"font-semibold text-white truncate\">","+              {name}{' '}","+              {creature && <FleetPet creature={creature} />}","+            </h3>","             <p className=\"text-xs text-slate-400 truncate\">{image}</p>","           </div>","         </div>"]}]}]}
