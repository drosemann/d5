// Goose-Port-Spiegel von: muse-code/local-share-muse/sessions/2026/10/23/01a169bf-cf38-77b0-b71e-5840b110d59a/tool-outputs/01a169d6-cfc0-75c0-8c7b-949d4b509329/call_01a169d6bed073479139b88c1e320476-tool_patch.json
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: muse-code/local-share-muse/sessions/2026/10/23/01a169bf-cf38-77b0-b71e-5840b110d59a/tool-outputs/01a169d6-cfc0-75c0-8c7b-949d4b509329/call_01a169d6bed073479139b88c1e320476-tool_patch.json");
}

// ---- Original-Code (muse-code/local-share-muse/sessions/2026/10/23/01a169bf-cf38-77b0-b71e-5840b110d59a/tool-outputs/01a169d6-cfc0-75c0-8c7b-949d4b509329/call_01a169d6bed073479139b88c1e320476-tool_patch.json), unveraendert, als Inline-Doku ----
// {"files":[{"path":"\\\\?\\C:\\Users\\danie\\OneDrive\\github-repos\\ai-chat-webui\\workspace.js","hunks":[{"oldStart":178,"oldLines":6,"newStart":178,"newLines":17,"lines":["   });","   for (const name of VIEW_NAMES) views[name].hidden = name !== view;"," ","+  const rail = document.getElementById('rail');","+  const railVisible = view === 'home' || view === 'chat';","+  if (rail) rail.hidden = !railVisible;","+  if (rail && railVisible) {","+    try {","+      await renderRail(rail);","+    } catch (error) {","+      console.error('Rail render failed:', error);","+    }","+  }","+","   try {","     if (view === 'chat') {","       if (window.ChatView?.mountChat) {"]}]}]}
