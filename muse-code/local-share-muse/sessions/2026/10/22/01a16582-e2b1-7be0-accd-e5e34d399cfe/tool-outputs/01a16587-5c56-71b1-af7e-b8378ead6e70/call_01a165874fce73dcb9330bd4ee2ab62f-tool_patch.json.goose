// Goose-Port-Spiegel von: muse-code/local-share-muse/sessions/2026/10/22/01a16582-e2b1-7be0-accd-e5e34d399cfe/tool-outputs/01a16587-5c56-71b1-af7e-b8378ead6e70/call_01a165874fce73dcb9330bd4ee2ab62f-tool_patch.json
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: muse-code/local-share-muse/sessions/2026/10/22/01a16582-e2b1-7be0-accd-e5e34d399cfe/tool-outputs/01a16587-5c56-71b1-af7e-b8378ead6e70/call_01a165874fce73dcb9330bd4ee2ab62f-tool_patch.json");
}

// ---- Original-Code (muse-code/local-share-muse/sessions/2026/10/22/01a16582-e2b1-7be0-accd-e5e34d399cfe/tool-outputs/01a16587-5c56-71b1-af7e-b8378ead6e70/call_01a165874fce73dcb9330bd4ee2ab62f-tool_patch.json), unveraendert, als Inline-Doku ----
// {"files":[{"path":"\\\\?\\C:\\Users\\danie\\OneDrive\\github-repos\\infra-pilot\\services\\discord-service\\index.js","hunks":[{"oldStart":192,"oldLines":7,"newStart":192,"newLines":8,"lines":["     ...TemplateManager.toSpec(),","     ...ResourcePools.toSpec(),","     ...DbManager.toSpec(),","-    ...LegacyCommands.toSpec(),","+    ...LegacyCommands.toSpec(),","+    ...PetCommands.toSpec(),","   ];","   try {","     await client.application.commands.set(allCommands);"]}]}]}
