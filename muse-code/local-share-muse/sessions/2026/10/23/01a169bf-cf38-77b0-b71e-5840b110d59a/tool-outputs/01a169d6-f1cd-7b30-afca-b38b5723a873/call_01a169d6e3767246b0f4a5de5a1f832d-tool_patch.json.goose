// Goose-Port-Spiegel von: muse-code/local-share-muse/sessions/2026/10/23/01a169bf-cf38-77b0-b71e-5840b110d59a/tool-outputs/01a169d6-f1cd-7b30-afca-b38b5723a873/call_01a169d6e3767246b0f4a5de5a1f832d-tool_patch.json
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: muse-code/local-share-muse/sessions/2026/10/23/01a169bf-cf38-77b0-b71e-5840b110d59a/tool-outputs/01a169d6-f1cd-7b30-afca-b38b5723a873/call_01a169d6e3767246b0f4a5de5a1f832d-tool_patch.json");
}

// ---- Original-Code (muse-code/local-share-muse/sessions/2026/10/23/01a169bf-cf38-77b0-b71e-5840b110d59a/tool-outputs/01a169d6-f1cd-7b30-afca-b38b5723a873/call_01a169d6e3767246b0f4a5de5a1f832d-tool_patch.json), unveraendert, als Inline-Doku ----
// {"files":[{"path":"\\\\?\\C:\\Users\\danie\\OneDrive\\github-repos\\ai-chat-webui\\bootstrap.js","hunks":[{"oldStart":227,"oldLines":6,"newStart":227,"newLines":15,"lines":["         for (const m of messages) {","             renderMessage(m.content, m.role === 'user', m.created_at ? new Date(m.created_at).toLocaleTimeString() : null);","         }","+        const pending = sessionStorage.getItem('pendingPrompt');","+        if (pending && messages.length === 0) {","+            sessionStorage.removeItem('pendingPrompt');","+            const { chatInput } = getEls();","+            if (chatInput) {","+                chatInput.value = pending;","+                sendMessage();","+            }","+        }","     } catch (error) {","         console.error('Failed to load conversation:', error);","         toast('Could not load this conversation.');"]}]}]}
