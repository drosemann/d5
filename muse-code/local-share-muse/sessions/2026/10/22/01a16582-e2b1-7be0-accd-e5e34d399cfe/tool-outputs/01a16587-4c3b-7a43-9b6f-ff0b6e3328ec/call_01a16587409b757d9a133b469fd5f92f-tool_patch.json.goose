// Goose-Port-Spiegel von: muse-code/local-share-muse/sessions/2026/10/22/01a16582-e2b1-7be0-accd-e5e34d399cfe/tool-outputs/01a16587-4c3b-7a43-9b6f-ff0b6e3328ec/call_01a16587409b757d9a133b469fd5f92f-tool_patch.json
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: muse-code/local-share-muse/sessions/2026/10/22/01a16582-e2b1-7be0-accd-e5e34d399cfe/tool-outputs/01a16587-4c3b-7a43-9b6f-ff0b6e3328ec/call_01a16587409b757d9a133b469fd5f92f-tool_patch.json");
}

// ---- Original-Code (muse-code/local-share-muse/sessions/2026/10/22/01a16582-e2b1-7be0-accd-e5e34d399cfe/tool-outputs/01a16587-4c3b-7a43-9b6f-ff0b6e3328ec/call_01a16587409b757d9a133b469fd5f92f-tool_patch.json), unveraendert, als Inline-Doku ----
// {"files":[{"path":"\\\\?\\C:\\Users\\danie\\OneDrive\\github-repos\\infra-pilot\\services\\discord-service\\index.js","hunks":[{"oldStart":23,"oldLines":7,"newStart":23,"newLines":8,"lines":[" const TemplateManager = require('./modules/templateManager');"," const ResourcePools = require('./modules/resourcePools');"," const DbManager = require('./modules/dbManager');","-const LegacyCommands = require('./modules/legacyCommands');","+const LegacyCommands = require('./modules/legacyCommands');","+const PetCommands = require('./modules/petCommands');"," "," const COMMAND_MODULES = [","   { name: 'VPSCommands', module: VPSCommands },"]}]}]}
