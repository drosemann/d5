// Goose-Port-Spiegel von: muse-code/local-share-muse/sessions/2026/10/29/01a18967-8f34-75e3-bd91-9db28a27fadd/tool-outputs/01a18980-52c7-73c3-9489-7ffa73637bba/call_01a18980452e7620a851ab4c0fbac7d8-tool_patch.json
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: muse-code/local-share-muse/sessions/2026/10/29/01a18967-8f34-75e3-bd91-9db28a27fadd/tool-outputs/01a18980-52c7-73c3-9489-7ffa73637bba/call_01a18980452e7620a851ab4c0fbac7d8-tool_patch.json");
}

// ---- Original-Code (muse-code/local-share-muse/sessions/2026/10/29/01a18967-8f34-75e3-bd91-9db28a27fadd/tool-outputs/01a18980-52c7-73c3-9489-7ffa73637bba/call_01a18980452e7620a851ab4c0fbac7d8-tool_patch.json), unveraendert, als Inline-Doku ----
// {"files":[{"path":"\\\\?\\C:\\Users\\danie\\OneDrive\\github-repos\\Agentenplattform\\apps\\backend\\tests\\test_kern.py","hunks":[{"oldStart":61,"oldLines":13,"newStart":61,"newLines":12,"lines":["     assert not ok  # Agent nicht berechtigt, trotz Freigabe"," "," def test_betrag_parser():","-    import importlib.util","-    assert _betrag := True","+    # Deutsche (1.234,56) und englische (1234.56) Schreibweise – gleiche Logik wie main._betrag","     def betrag(roh: str) -> float:","         s = roh.strip().replace(\" \", \"\")","         if \",\" in s: s = s.replace(\".\", \"\").replace(\",\", \".\")","         return float(s)","-    assert betrag(\"1.234,56\") == 1234.56 and betrag(\"1234.56\") == 1234.56","+    assert betrag(\"1.234,56\") == 1234.56 and betrag(\"1234.56\") == 1234.56 and betrag(\"650\") == 650.0"," "," def test_gateway_tool_schema():","     from app.providers.gateway import tool_schema_fuer"]}]}]}
