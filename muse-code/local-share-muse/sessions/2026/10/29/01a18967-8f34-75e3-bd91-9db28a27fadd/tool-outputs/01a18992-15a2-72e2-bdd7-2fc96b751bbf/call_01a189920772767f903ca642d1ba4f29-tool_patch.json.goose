// Goose-Port-Spiegel von: muse-code/local-share-muse/sessions/2026/10/29/01a18967-8f34-75e3-bd91-9db28a27fadd/tool-outputs/01a18992-15a2-72e2-bdd7-2fc96b751bbf/call_01a189920772767f903ca642d1ba4f29-tool_patch.json
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: muse-code/local-share-muse/sessions/2026/10/29/01a18967-8f34-75e3-bd91-9db28a27fadd/tool-outputs/01a18992-15a2-72e2-bdd7-2fc96b751bbf/call_01a189920772767f903ca642d1ba4f29-tool_patch.json");
}

// ---- Original-Code (muse-code/local-share-muse/sessions/2026/10/29/01a18967-8f34-75e3-bd91-9db28a27fadd/tool-outputs/01a18992-15a2-72e2-bdd7-2fc96b751bbf/call_01a189920772767f903ca642d1ba4f29-tool_patch.json), unveraendert, als Inline-Doku ----
// {"files":[{"path":"\\\\?\\C:\\Users\\danie\\OneDrive\\github-repos\\Agentenplattform\\apps\\android-safety\\README.md","hunks":[{"oldStart":1,"oldLines":4,"newStart":1,"newLines":7,"lines":[" # Android-Begleit-App (Kotlin, Foreground-Service, 10-Min-Intervall)","+Quellen: `app/StandortService.kt`, `app/StandortQueue.kt`, `app/AndroidManifest.xml`, `app/build.gradle`.","+- Registrierung + Geräte-Token an `/api/v1/location`; SOS an `/api/v1/safety/sos` (idempotent)","+- Offline-Queue, Sync-Status („letzte Sync\"), manueller SOS-Button (UI folgt im App-Modul)"," - Registrierung + Gerätebindung an `/api/v1/location`"," - SOS-Button → `POST /api/v1/safety/sos` mit Idempotenzschlüssel"," - Lokale Warteschlange bei Offline, spätere Synchronisation"]}]}]}
