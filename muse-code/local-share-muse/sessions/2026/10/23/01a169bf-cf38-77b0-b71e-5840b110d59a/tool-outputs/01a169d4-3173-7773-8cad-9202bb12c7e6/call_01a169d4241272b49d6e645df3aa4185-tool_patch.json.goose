// Goose-Port-Spiegel von: muse-code/local-share-muse/sessions/2026/10/23/01a169bf-cf38-77b0-b71e-5840b110d59a/tool-outputs/01a169d4-3173-7773-8cad-9202bb12c7e6/call_01a169d4241272b49d6e645df3aa4185-tool_patch.json
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: muse-code/local-share-muse/sessions/2026/10/23/01a169bf-cf38-77b0-b71e-5840b110d59a/tool-outputs/01a169d4-3173-7773-8cad-9202bb12c7e6/call_01a169d4241272b49d6e645df3aa4185-tool_patch.json");
}

// ---- Original-Code (muse-code/local-share-muse/sessions/2026/10/23/01a169bf-cf38-77b0-b71e-5840b110d59a/tool-outputs/01a169d4-3173-7773-8cad-9202bb12c7e6/call_01a169d4241272b49d6e645df3aa4185-tool_patch.json), unveraendert, als Inline-Doku ----
// {"files":[{"path":"\\\\?\\C:\\Users\\danie\\OneDrive\\github-repos\\ai-chat-webui\\auth.js","hunks":[{"oldStart":24,"oldLines":9,"newStart":24,"newLines":19,"lines":[" }"," "," function setAppVisible(visible) {","-  document.querySelectorAll('header, main').forEach((el) => {","-    el.hidden = !visible;","-  });","+  // Phase 3: the workspace shell owns visibility. Before the shell exists","+  // (very first load), fall back to hiding the legacy header/main nodes.","+  const shell = document.getElementById('shell');","+  if (shell) {","+    shell.hidden = !visible;","+  } else {","+    document.querySelectorAll('header, main').forEach((el) => {","+      el.hidden = !visible;","+    });","+  }","+  if (window.Workspace?.setSignedIn) {","+    window.Workspace.setSignedIn(visible);","+  }"," }"," "," function showError(overlay, message) {"]}]}]}
