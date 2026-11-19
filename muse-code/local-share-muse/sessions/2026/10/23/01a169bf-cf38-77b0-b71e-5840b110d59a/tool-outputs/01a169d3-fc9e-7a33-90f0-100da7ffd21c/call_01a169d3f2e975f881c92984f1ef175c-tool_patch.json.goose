// Goose-Port-Spiegel von: muse-code/local-share-muse/sessions/2026/10/23/01a169bf-cf38-77b0-b71e-5840b110d59a/tool-outputs/01a169d3-fc9e-7a33-90f0-100da7ffd21c/call_01a169d3f2e975f881c92984f1ef175c-tool_patch.json
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: muse-code/local-share-muse/sessions/2026/10/23/01a169bf-cf38-77b0-b71e-5840b110d59a/tool-outputs/01a169d3-fc9e-7a33-90f0-100da7ffd21c/call_01a169d3f2e975f881c92984f1ef175c-tool_patch.json");
}

// ---- Original-Code (muse-code/local-share-muse/sessions/2026/10/23/01a169bf-cf38-77b0-b71e-5840b110d59a/tool-outputs/01a169d3-fc9e-7a33-90f0-100da7ffd21c/call_01a169d3f2e975f881c92984f1ef175c-tool_patch.json), unveraendert, als Inline-Doku ----
// {"files":[{"path":"\\\\?\\C:\\Users\\danie\\OneDrive\\github-repos\\ai-chat-webui\\bootstrap.js","hunks":[{"oldStart":36,"oldLines":7,"newStart":36,"newLines":6,"lines":["         <button type=\"button\" class=\"btn\" data-chat-action=\"rename\">Rename</button>","         <button type=\"button\" class=\"btn\" data-chat-action=\"delete\">Delete</button>`;","     toolbar.addEventListener('click', (event) => {","-        const action = event.target closest ? null : null;","         const btn = event.target.closest('[data-chat-action]');","         if (!btn) return;","         handleToolbarAction(btn.dataset.chatAction).catch((error) => toast(error?.message || 'Action failed.'));"]}]}]}
