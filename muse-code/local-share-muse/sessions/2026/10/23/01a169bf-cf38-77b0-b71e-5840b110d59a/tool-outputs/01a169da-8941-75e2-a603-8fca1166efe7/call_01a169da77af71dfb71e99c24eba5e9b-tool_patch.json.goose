// Goose-Port-Spiegel von: muse-code/local-share-muse/sessions/2026/10/23/01a169bf-cf38-77b0-b71e-5840b110d59a/tool-outputs/01a169da-8941-75e2-a603-8fca1166efe7/call_01a169da77af71dfb71e99c24eba5e9b-tool_patch.json
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: muse-code/local-share-muse/sessions/2026/10/23/01a169bf-cf38-77b0-b71e-5840b110d59a/tool-outputs/01a169da-8941-75e2-a603-8fca1166efe7/call_01a169da77af71dfb71e99c24eba5e9b-tool_patch.json");
}

// ---- Original-Code (muse-code/local-share-muse/sessions/2026/10/23/01a169bf-cf38-77b0-b71e-5840b110d59a/tool-outputs/01a169da-8941-75e2-a603-8fca1166efe7/call_01a169da77af71dfb71e99c24eba5e9b-tool_patch.json), unveraendert, als Inline-Doku ----
// {"files":[{"path":"\\\\?\\C:\\Users\\danie\\OneDrive\\github-repos\\ai-chat-webui\\workspace.js","hunks":[{"oldStart":12,"oldLines":13,"newStart":12,"newLines":13,"lines":[" import { renderModels } from './models.js';"," import { renderSettings } from './settings.js';"," ","-// Phase 3 loads the workspace stylesheet dynamically so index.html stays","-// untouched; the <link> will move into <head> in the Phase 8 cleanup.","-if (!document.querySelector('link[data-workspace-styles]')) {","+// styles.css is injected here so index.html — including its long-standing","+// inline <style> block — stays byte-identical. Any existing styles.css link","+// (e.g. added later to <head>) is respected and never duplicated.","+if (!document.querySelector('link[href=\"styles.css\"]')) {","   const link = document.createElement('link');","   link.rel = 'stylesheet';","   link.href = 'styles.css';","-  link.dataset.workspaceStyles = 'true';","   document.head.appendChild(link);"," }"," "]}]}]}
