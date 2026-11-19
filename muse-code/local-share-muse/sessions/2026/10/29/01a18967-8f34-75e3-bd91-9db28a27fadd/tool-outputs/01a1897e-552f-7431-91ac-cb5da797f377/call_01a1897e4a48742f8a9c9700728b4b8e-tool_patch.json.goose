// Goose-Port-Spiegel von: muse-code/local-share-muse/sessions/2026/10/29/01a18967-8f34-75e3-bd91-9db28a27fadd/tool-outputs/01a1897e-552f-7431-91ac-cb5da797f377/call_01a1897e4a48742f8a9c9700728b4b8e-tool_patch.json
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: muse-code/local-share-muse/sessions/2026/10/29/01a18967-8f34-75e3-bd91-9db28a27fadd/tool-outputs/01a1897e-552f-7431-91ac-cb5da797f377/call_01a1897e4a48742f8a9c9700728b4b8e-tool_patch.json");
}

// ---- Original-Code (muse-code/local-share-muse/sessions/2026/10/29/01a18967-8f34-75e3-bd91-9db28a27fadd/tool-outputs/01a1897e-552f-7431-91ac-cb5da797f377/call_01a1897e4a48742f8a9c9700728b4b8e-tool_patch.json), unveraendert, als Inline-Doku ----
// {"files":[{"path":"\\\\?\\C:\\Users\\danie\\OneDrive\\github-repos\\Agentenplattform\\apps\\backend\\app\\main.py","hunks":[{"oldStart":179,"oldLines":7,"newStart":179,"newLines":7,"lines":["         try:","             s = models.FinancialSnapshot(","                 datum=datetime.fromisoformat(str(zeile.get(\"datum\", \"\"))),","-                vermoegen=float(str(zeile.get(\"vermoegen\", \"0\")).replace(\",\", \".\") if False else float(str(zeile.get(\"vermoegen\", \"0\")).replace(\".\", \"\").replace(\",\", \".\")) if \",\" in str(zeile.get(\"vermoegen\", \"0\")) else float(str(zeile.get(\"vermoegen\", \"0\"))),","+                vermoegen=_betrag(str(zeile.get(\"vermoegen\", \"0\"))),","                 notiz=str(zeile.get(\"notiz\", \"\"))[:200])","             db.add(s); angelegt += 1","         except (ValueError, KeyError): continue  # fehlerhafte Zeilen überspringen, Rest zählt"]}]}]}
