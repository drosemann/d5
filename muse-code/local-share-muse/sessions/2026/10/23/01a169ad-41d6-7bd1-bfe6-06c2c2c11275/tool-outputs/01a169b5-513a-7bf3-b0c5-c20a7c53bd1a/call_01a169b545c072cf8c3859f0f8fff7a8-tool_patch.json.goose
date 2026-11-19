// Goose-Port-Spiegel von: muse-code/local-share-muse/sessions/2026/10/23/01a169ad-41d6-7bd1-bfe6-06c2c2c11275/tool-outputs/01a169b5-513a-7bf3-b0c5-c20a7c53bd1a/call_01a169b545c072cf8c3859f0f8fff7a8-tool_patch.json
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: muse-code/local-share-muse/sessions/2026/10/23/01a169ad-41d6-7bd1-bfe6-06c2c2c11275/tool-outputs/01a169b5-513a-7bf3-b0c5-c20a7c53bd1a/call_01a169b545c072cf8c3859f0f8fff7a8-tool_patch.json");
}

// ---- Original-Code (muse-code/local-share-muse/sessions/2026/10/23/01a169ad-41d6-7bd1-bfe6-06c2c2c11275/tool-outputs/01a169b5-513a-7bf3-b0c5-c20a7c53bd1a/call_01a169b545c072cf8c3859f0f8fff7a8-tool_patch.json), unveraendert, als Inline-Doku ----
// {"files":[{"path":"\\\\?\\C:\\Users\\danie\\OneDrive\\github-repos\\ed-docs\\web\\src\\main.tsx","hunks":[{"oldStart":463,"oldLines":6,"newStart":463,"newLines":7,"lines":["     if ('pendingConfirm' in result && result.pendingConfirm) {","       const pc = result.pendingConfirm;","       setConfirm(pc);","+      setConfirmPos(0);","       const {draft: previewDraft} = applySubstitute(draft, pc.range.startLine, pc.range.endLine, pc.pattern, pc.replacement, pc.global);","       setConfirmDraft(previewDraft);","       setMode('NORMAL');"]}]}]}
