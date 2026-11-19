// Goose-Port-Spiegel von: muse-code/local-share-muse/sessions/2026/10/26/01a17a70-fbe5-79a1-a804-b788e3fbfaf0/tool-outputs/01a17a81-d97f-7ca1-b91b-0451e6466531/call_01a17a81d0d376d1bda9b2dff4fa6922-tool_patch.json
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: muse-code/local-share-muse/sessions/2026/10/26/01a17a70-fbe5-79a1-a804-b788e3fbfaf0/tool-outputs/01a17a81-d97f-7ca1-b91b-0451e6466531/call_01a17a81d0d376d1bda9b2dff4fa6922-tool_patch.json");
}

// ---- Original-Code (muse-code/local-share-muse/sessions/2026/10/26/01a17a70-fbe5-79a1-a804-b788e3fbfaf0/tool-outputs/01a17a81-d97f-7ca1-b91b-0451e6466531/call_01a17a81d0d376d1bda9b2dff4fa6922-tool_patch.json), unveraendert, als Inline-Doku ----
// {"files":[{"path":"\\\\?\\C:\\Users\\danie\\OneDrive\\github-repos\\infra-pilot\\scripts\\flag-hygiene.py","hunks":[{"oldStart":25,"oldLines":7,"newStart":25,"newLines":7,"lines":["     try:","         return datetime.datetime.fromisoformat(str(value).replace(\"Z\", \"+00:00\"))","     except ValueError:","-        return False  # type: ignore[return-value]","+        return None"," "," "," def newest_touch(flag: Dict[str, Any]) -> datetime.datetime | None:"]}]}]}
