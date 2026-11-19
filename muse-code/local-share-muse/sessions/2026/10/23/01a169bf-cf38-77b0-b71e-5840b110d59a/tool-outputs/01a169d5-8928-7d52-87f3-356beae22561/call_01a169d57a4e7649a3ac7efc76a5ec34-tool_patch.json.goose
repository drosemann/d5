// Goose-Port-Spiegel von: muse-code/local-share-muse/sessions/2026/10/23/01a169bf-cf38-77b0-b71e-5840b110d59a/tool-outputs/01a169d5-8928-7d52-87f3-356beae22561/call_01a169d57a4e7649a3ac7efc76a5ec34-tool_patch.json
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: muse-code/local-share-muse/sessions/2026/10/23/01a169bf-cf38-77b0-b71e-5840b110d59a/tool-outputs/01a169d5-8928-7d52-87f3-356beae22561/call_01a169d57a4e7649a3ac7efc76a5ec34-tool_patch.json");
}

// ---- Original-Code (muse-code/local-share-muse/sessions/2026/10/23/01a169bf-cf38-77b0-b71e-5840b110d59a/tool-outputs/01a169d5-8928-7d52-87f3-356beae22561/call_01a169d57a4e7649a3ac7efc76a5ec34-tool_patch.json), unveraendert, als Inline-Doku ----
// {"files":[{"path":"\\\\?\\C:\\Users\\danie\\OneDrive\\github-repos\\ai-chat-webui\\workspace.js","hunks":[{"oldStart":5,"oldLines":6,"newStart":5,"newLines":8,"lines":[" import { getSupabaseClient, onAuthChange } from './supabaseClient.js';"," import * as data from './data.js';"," import { escapeHtml, truncate, toast } from './utils.js';","+import { renderTasks } from './tasks.js';","+import { renderProjects } from './projects.js';"," "," // Phase 3 loads the workspace stylesheet dynamically so index.html stays"," // untouched; the <link> will move into <head> in the Phase 8 cleanup."]}]}]}
