// Goose-Port-Spiegel von: muse-code/local-share-muse/sessions/2026/10/29/01a18967-8f34-75e3-bd91-9db28a27fadd/tool-outputs/01a1896b-1afe-7053-ae57-5ad1f876bc97/call_01a1896b091c777f9c666a1bff4c0303-tool_patch.json
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: muse-code/local-share-muse/sessions/2026/10/29/01a18967-8f34-75e3-bd91-9db28a27fadd/tool-outputs/01a1896b-1afe-7053-ae57-5ad1f876bc97/call_01a1896b091c777f9c666a1bff4c0303-tool_patch.json");
}

// ---- Original-Code (muse-code/local-share-muse/sessions/2026/10/29/01a18967-8f34-75e3-bd91-9db28a27fadd/tool-outputs/01a1896b-1afe-7053-ae57-5ad1f876bc97/call_01a1896b091c777f9c666a1bff4c0303-tool_patch.json), unveraendert, als Inline-Doku ----
// {"files":[{"path":"\\\\?\\C:\\Users\\danie\\OneDrive\\github-repos\\Agentenplattform\\apps\\backend\\app\\services\\markt.py","hunks":[{"oldStart":1,"oldLines":0,"newStart":1,"newLines":10,"lines":["+\"\"\"Deduplizierung + Ranking für Markt-Agenten (Wohnung/Auto/Deals).\"\"\"","+import re","+def normiere_url(u: str) -> str:","+    return re.sub(r\"[?#].*$\", \"\", (u or \"\").strip().lower().rstrip(\"/\"))","+def ist_duplikat(url1: str, url2: str) -> bool: return normiere_url(url1) == normiere_url(url2)","+def ranking(preis: float | None, max_preis: float, favorit_bonus: float = 0.0) -> float:","+    \"\"\"0..1: günstiger relativ zum Limit = besser. Fehlender Preis = 0.3.\"\"\"","+    if preis is None or max_preis <= 0: return 0.3","+    score = max(0.0, min(1.0, 1.0 - preis / (2 * max_preis)))","+    return round(min(1.0, score + favorit_bonus), 3)"]}]}]}
