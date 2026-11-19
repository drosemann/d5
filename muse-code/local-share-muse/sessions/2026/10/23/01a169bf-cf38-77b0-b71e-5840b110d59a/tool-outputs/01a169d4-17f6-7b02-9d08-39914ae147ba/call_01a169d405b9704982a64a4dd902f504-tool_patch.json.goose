// Goose-Port-Spiegel von: muse-code/local-share-muse/sessions/2026/10/23/01a169bf-cf38-77b0-b71e-5840b110d59a/tool-outputs/01a169d4-17f6-7b02-9d08-39914ae147ba/call_01a169d405b9704982a64a4dd902f504-tool_patch.json
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: muse-code/local-share-muse/sessions/2026/10/23/01a169bf-cf38-77b0-b71e-5840b110d59a/tool-outputs/01a169d4-17f6-7b02-9d08-39914ae147ba/call_01a169d405b9704982a64a4dd902f504-tool_patch.json");
}

// ---- Original-Code (muse-code/local-share-muse/sessions/2026/10/23/01a169bf-cf38-77b0-b71e-5840b110d59a/tool-outputs/01a169d4-17f6-7b02-9d08-39914ae147ba/call_01a169d405b9704982a64a4dd902f504-tool_patch.json), unveraendert, als Inline-Doku ----
// {"files":[{"path":"\\\\?\\C:\\Users\\danie\\OneDrive\\github-repos\\ai-chat-webui\\workspace.js","hunks":[{"oldStart":6,"oldLines":6,"newStart":6,"newLines":16,"lines":[" import * as data from './data.js';"," import { escapeHtml, truncate, toast } from './utils.js';"," ","+// Phase 3 loads the workspace stylesheet dynamically so index.html stays","+// untouched; the <link> will move into <head> in the Phase 8 cleanup.","+if (!document.querySelector('link[data-workspace-styles]')) {","+  const link = document.createElement('link');","+  link.rel = 'stylesheet';","+  link.href = 'styles.css';","+  link.dataset.workspaceStyles = 'true';","+  document.head.appendChild(link);","+}","+"," let shellBuilt = false;"," let views = {};"," let sidebarEls = {};"]}]}]}
