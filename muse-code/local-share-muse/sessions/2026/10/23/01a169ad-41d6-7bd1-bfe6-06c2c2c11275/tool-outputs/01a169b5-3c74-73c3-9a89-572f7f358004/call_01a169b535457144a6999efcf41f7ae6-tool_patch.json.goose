// Goose-Port-Spiegel von: muse-code/local-share-muse/sessions/2026/10/23/01a169ad-41d6-7bd1-bfe6-06c2c2c11275/tool-outputs/01a169b5-3c74-73c3-9a89-572f7f358004/call_01a169b535457144a6999efcf41f7ae6-tool_patch.json
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: muse-code/local-share-muse/sessions/2026/10/23/01a169ad-41d6-7bd1-bfe6-06c2c2c11275/tool-outputs/01a169b5-3c74-73c3-9a89-572f7f358004/call_01a169b535457144a6999efcf41f7ae6-tool_patch.json");
}

// ---- Original-Code (muse-code/local-share-muse/sessions/2026/10/23/01a169ad-41d6-7bd1-bfe6-06c2c2c11275/tool-outputs/01a169b5-3c74-73c3-9a89-572f7f358004/call_01a169b535457144a6999efcf41f7ae6-tool_patch.json), unveraendert, als Inline-Doku ----
// {"files":[{"path":"\\\\?\\C:\\Users\\danie\\OneDrive\\github-repos\\ed-docs\\web\\src\\main.tsx","hunks":[{"oldStart":47,"oldLines":6,"newStart":47,"newLines":7,"lines":["   const [lastSearch, setLastSearch] = useState('');","   const [confirm, setConfirm] = useState<PendingConfirm | null>(null);","   const [confirmDraft, setConfirmDraft] = useState('');","+  const [confirmPos, setConfirmPos] = useState(0);","   const [pendingReplace, setPendingReplace] = useState(false);","   const editorRef = useRef<HTMLTextAreaElement>(null);","   const commandRef = useRef<HTMLInputElement>(null);"]}]}]}
