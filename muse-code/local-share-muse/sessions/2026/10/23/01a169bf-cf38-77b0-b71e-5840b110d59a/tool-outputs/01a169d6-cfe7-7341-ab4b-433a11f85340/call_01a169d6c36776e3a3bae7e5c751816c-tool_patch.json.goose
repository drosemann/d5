// Goose-Port-Spiegel von: muse-code/local-share-muse/sessions/2026/10/23/01a169bf-cf38-77b0-b71e-5840b110d59a/tool-outputs/01a169d6-cfe7-7341-ab4b-433a11f85340/call_01a169d6c36776e3a3bae7e5c751816c-tool_patch.json
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: muse-code/local-share-muse/sessions/2026/10/23/01a169bf-cf38-77b0-b71e-5840b110d59a/tool-outputs/01a169d6-cfe7-7341-ab4b-433a11f85340/call_01a169d6c36776e3a3bae7e5c751816c-tool_patch.json");
}

// ---- Original-Code (muse-code/local-share-muse/sessions/2026/10/23/01a169bf-cf38-77b0-b71e-5840b110d59a/tool-outputs/01a169d6-cfe7-7341-ab4b-433a11f85340/call_01a169d6c36776e3a3bae7e5c751816c-tool_patch.json), unveraendert, als Inline-Doku ----
// {"files":[{"path":"\\\\?\\C:\\Users\\danie\\OneDrive\\github-repos\\ai-chat-webui\\bootstrap.js","hunks":[{"oldStart":210,"oldLines":6,"newStart":210,"newLines":15,"lines":[" ","     if (!conversationId) {","         setWelcomeVisible(true);","+        const pending = sessionStorage.getItem('pendingPrompt');","+        if (pending) {","+            sessionStorage.removeItem('pendingPrompt');","+            const { chatInput } = getEls();","+            if (chatInput) {","+                chatInput.value = pending;","+                sendMessage();","+            }","+        }","         return;","     }","     try {"]}]}]}
