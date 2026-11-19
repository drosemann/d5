// Goose-Port-Spiegel von: muse-code/local-share-muse/sessions/2026/10/22/01a16582-e2b1-7be0-accd-e5e34d399cfe/tool-outputs/01a1659c-a48f-7391-9535-ebaa35b3dafa/call_01a1659c96fb718d94cce43c9c6940f2-tool_patch.json
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: muse-code/local-share-muse/sessions/2026/10/22/01a16582-e2b1-7be0-accd-e5e34d399cfe/tool-outputs/01a1659c-a48f-7391-9535-ebaa35b3dafa/call_01a1659c96fb718d94cce43c9c6940f2-tool_patch.json");
}

// ---- Original-Code (muse-code/local-share-muse/sessions/2026/10/22/01a16582-e2b1-7be0-accd-e5e34d399cfe/tool-outputs/01a1659c-a48f-7391-9535-ebaa35b3dafa/call_01a1659c96fb718d94cce43c9c6940f2-tool_patch.json), unveraendert, als Inline-Doku ----
// {"files":[{"path":"\\\\?\\C:\\Users\\danie\\OneDrive\\github-repos\\infra-pilot\\services\\management-panel\\src\\components\\FleetPet.tsx","hunks":[{"oldStart":41,"oldLines":6,"newStart":41,"newLines":7,"lines":["   const emoji = MOOD_EMOJI[creature.mood] ?? '❓';","   return (","     <span","+      role=\"img\"","       className=\"fleet-pet\"","       title={`${creature.display_name} is ${creature.mood} (${creature.stage})`}","       aria-label={`${creature.display_name}, mood ${creature.mood}, stage ${creature.stage}`}"]}]}]}
