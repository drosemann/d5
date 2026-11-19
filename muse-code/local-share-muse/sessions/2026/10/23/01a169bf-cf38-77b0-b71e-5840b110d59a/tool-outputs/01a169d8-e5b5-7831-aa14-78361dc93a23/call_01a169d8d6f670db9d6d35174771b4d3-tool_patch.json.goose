// Goose-Port-Spiegel von: muse-code/local-share-muse/sessions/2026/10/23/01a169bf-cf38-77b0-b71e-5840b110d59a/tool-outputs/01a169d8-e5b5-7831-aa14-78361dc93a23/call_01a169d8d6f670db9d6d35174771b4d3-tool_patch.json
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: muse-code/local-share-muse/sessions/2026/10/23/01a169bf-cf38-77b0-b71e-5840b110d59a/tool-outputs/01a169d8-e5b5-7831-aa14-78361dc93a23/call_01a169d8d6f670db9d6d35174771b4d3-tool_patch.json");
}

// ---- Original-Code (muse-code/local-share-muse/sessions/2026/10/23/01a169bf-cf38-77b0-b71e-5840b110d59a/tool-outputs/01a169d8-e5b5-7831-aa14-78361dc93a23/call_01a169d8d6f670db9d6d35174771b4d3-tool_patch.json), unveraendert, als Inline-Doku ----
// {"files":[{"path":"\\\\?\\C:\\Users\\danie\\OneDrive\\github-repos\\ai-chat-webui\\bootstrap.js","hunks":[{"oldStart":422,"oldLines":6,"newStart":422,"newLines":7,"lines":["         document.documentElement.setAttribute('data-theme', newTheme);","         localStorage.setItem('theme', newTheme);","         if (modeText) modeText.textContent = newTheme === 'dark' ? 'Light Mode' : 'Dark Mode';","+        data.updateSettings({ theme: newTheme }).catch(() => {});","     });"," }"," "]}]}]}
