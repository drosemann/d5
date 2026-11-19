// Goose-Port-Spiegel von: muse-code/local-share-muse/sessions/2026/10/29/01a18967-8f34-75e3-bd91-9db28a27fadd/tool-outputs/01a18969-52db-7e11-b5a4-46185195c315/call_01a18969490c73d9ad10255044d12dde-tool_patch.json
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: muse-code/local-share-muse/sessions/2026/10/29/01a18967-8f34-75e3-bd91-9db28a27fadd/tool-outputs/01a18969-52db-7e11-b5a4-46185195c315/call_01a18969490c73d9ad10255044d12dde-tool_patch.json");
}

// ---- Original-Code (muse-code/local-share-muse/sessions/2026/10/29/01a18967-8f34-75e3-bd91-9db28a27fadd/tool-outputs/01a18969-52db-7e11-b5a4-46185195c315/call_01a18969490c73d9ad10255044d12dde-tool_patch.json), unveraendert, als Inline-Doku ----
// {"files":[{"path":"\\\\?\\C:\\Users\\danie\\OneDrive\\github-repos\\Agentenplattform\\apps\\backend\\Dockerfile","hunks":[{"oldStart":1,"oldLines":0,"newStart":1,"newLines":6,"lines":["+FROM python:3.12-slim","+WORKDIR /code","+COPY requirements.txt .","+RUN pip install --no-cache-dir -r requirements.txt","+COPY . .","+CMD [\"uvicorn\",\"app.main:app\",\"--host\",\"0.0.0.0\",\"--port\",\"8000\"]"]}]}]}
