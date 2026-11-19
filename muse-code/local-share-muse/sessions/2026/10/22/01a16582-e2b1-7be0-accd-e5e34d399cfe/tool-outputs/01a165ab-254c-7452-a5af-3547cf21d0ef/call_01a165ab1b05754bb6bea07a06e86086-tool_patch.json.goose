// Goose-Port-Spiegel von: muse-code/local-share-muse/sessions/2026/10/22/01a16582-e2b1-7be0-accd-e5e34d399cfe/tool-outputs/01a165ab-254c-7452-a5af-3547cf21d0ef/call_01a165ab1b05754bb6bea07a06e86086-tool_patch.json
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: muse-code/local-share-muse/sessions/2026/10/22/01a16582-e2b1-7be0-accd-e5e34d399cfe/tool-outputs/01a165ab-254c-7452-a5af-3547cf21d0ef/call_01a165ab1b05754bb6bea07a06e86086-tool_patch.json");
}

// ---- Original-Code (muse-code/local-share-muse/sessions/2026/10/22/01a16582-e2b1-7be0-accd-e5e34d399cfe/tool-outputs/01a165ab-254c-7452-a5af-3547cf21d0ef/call_01a165ab1b05754bb6bea07a06e86086-tool_patch.json), unveraendert, als Inline-Doku ----
// {"files":[{"path":"\\\\?\\C:\\Users\\danie\\OneDrive\\github-repos\\infra-pilot\\services\\orchestrator-agent\\tests\\unit\\test_living_fleet.py","hunks":[{"oldStart":7,"oldLines":8,"newStart":7,"newLines":9,"lines":[" "," @pytest.fixture()"," def isolated_store(monkeypatch, tmp_path):","-    \"\"\"Point the JSON store at a temp file so tests never touch real data.\"\"\"","-    monkeypatch.setattr(living_fleet, \"STORE_PATH\", str(tmp_path / \"fleet.json\"))","+    \"\"\"Point the SQLite store at a temp DB so tests never touch real data.\"\"\"","+    monkeypatch.setattr(living_fleet, \"DB_PATH\", str(tmp_path / \"fleet.db\"))","+    monkeypatch.setattr(living_fleet, \"STORE_PATH\", str(tmp_path / \"legacy.json\"))","     monkeypatch.setattr(living_fleet, \"ENABLED\", True)","     return tmp_path"," "]}]}]}
