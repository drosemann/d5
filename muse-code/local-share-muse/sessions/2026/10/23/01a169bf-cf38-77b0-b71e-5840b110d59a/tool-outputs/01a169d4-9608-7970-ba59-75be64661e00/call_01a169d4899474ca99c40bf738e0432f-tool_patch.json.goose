// Goose-Port-Spiegel von: muse-code/local-share-muse/sessions/2026/10/23/01a169bf-cf38-77b0-b71e-5840b110d59a/tool-outputs/01a169d4-9608-7970-ba59-75be64661e00/call_01a169d4899474ca99c40bf738e0432f-tool_patch.json
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: muse-code/local-share-muse/sessions/2026/10/23/01a169bf-cf38-77b0-b71e-5840b110d59a/tool-outputs/01a169d4-9608-7970-ba59-75be64661e00/call_01a169d4899474ca99c40bf738e0432f-tool_patch.json");
}

// ---- Original-Code (muse-code/local-share-muse/sessions/2026/10/23/01a169bf-cf38-77b0-b71e-5840b110d59a/tool-outputs/01a169d4-9608-7970-ba59-75be64661e00/call_01a169d4899474ca99c40bf738e0432f-tool_patch.json), unveraendert, als Inline-Doku ----
// {"files":[{"path":"\\\\?\\C:\\Users\\danie\\OneDrive\\github-repos\\ai-chat-webui\\bootstrap.js","hunks":[{"oldStart":402,"oldLines":7,"newStart":402,"newLines":20,"lines":["     return { isSpam: false };"," }"," ","-window.ChatView = { mountChat };","+function resetChat() {","+    activeConversationId = null;","+    mountedKey = null;","+    isProcessing = false;","+    clearMessages();","+    setWelcomeVisible(true);","+    const { chatInput } = getEls();","+    if (chatInput) {","+        chatInput.value = '';","+        chatInput.style.height = 'auto';","+    }","+}","+","+window.ChatView = { mountChat, reset: resetChat };"," initTheme();"," initComposer();"," initWorkspace();"]}]}]}
