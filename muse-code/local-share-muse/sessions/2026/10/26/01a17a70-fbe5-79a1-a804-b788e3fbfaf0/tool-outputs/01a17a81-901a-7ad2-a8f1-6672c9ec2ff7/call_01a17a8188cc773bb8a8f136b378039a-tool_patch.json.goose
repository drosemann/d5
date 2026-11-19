// Goose-Port-Spiegel von: muse-code/local-share-muse/sessions/2026/10/26/01a17a70-fbe5-79a1-a804-b788e3fbfaf0/tool-outputs/01a17a81-901a-7ad2-a8f1-6672c9ec2ff7/call_01a17a8188cc773bb8a8f136b378039a-tool_patch.json
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: muse-code/local-share-muse/sessions/2026/10/26/01a17a70-fbe5-79a1-a804-b788e3fbfaf0/tool-outputs/01a17a81-901a-7ad2-a8f1-6672c9ec2ff7/call_01a17a8188cc773bb8a8f136b378039a-tool_patch.json");
}

// ---- Original-Code (muse-code/local-share-muse/sessions/2026/10/26/01a17a70-fbe5-79a1-a804-b788e3fbfaf0/tool-outputs/01a17a81-901a-7ad2-a8f1-6672c9ec2ff7/call_01a17a8188cc773bb8a8f136b378039a-tool_patch.json), unveraendert, als Inline-Doku ----
// {"files":[{"path":"\\\\?\\C:\\Users\\danie\\OneDrive\\github-repos\\infra-pilot\\tests\\cli\\test_feature_flags.py","hunks":[{"oldStart":89,"oldLines":8,"newStart":89,"newLines":10,"lines":["                 calls.append((args, kwargs))","                 response = MagicMock()","                 response.status_code = 200","+                response.content = b\"{}\"","                 response.json.return_value = {}","                 response.text = \"{}\"","+                response.raise_for_status.return_value = None","                 return response"," ","         api = client_module.ApiClient(\"http://localhost:3001\", \"tok\")"]}]}]}
