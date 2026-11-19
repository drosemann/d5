// Goose-Port-Spiegel von: muse-code/local-share-muse/sessions/2026/10/29/01a18967-8f34-75e3-bd91-9db28a27fadd/tool-outputs/01a1896e-9f14-7173-ae0b-d99116d589ab/call_01a1896e8fed71cf9b671b88baca6f4c-tool_patch.json
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: muse-code/local-share-muse/sessions/2026/10/29/01a18967-8f34-75e3-bd91-9db28a27fadd/tool-outputs/01a1896e-9f14-7173-ae0b-d99116d589ab/call_01a1896e8fed71cf9b671b88baca6f4c-tool_patch.json");
}

// ---- Original-Code (muse-code/local-share-muse/sessions/2026/10/29/01a18967-8f34-75e3-bd91-9db28a27fadd/tool-outputs/01a1896e-9f14-7173-ae0b-d99116d589ab/call_01a1896e8fed71cf9b671b88baca6f4c-tool_patch.json), unveraendert, als Inline-Doku ----
// {"files":[{"path":"\\\\?\\C:\\Users\\danie\\OneDrive\\github-repos\\Agentenplattform\\docs\\security.md","hunks":[{"oldStart":1,"oldLines":0,"newStart":1,"newLines":6,"lines":["+# Sicherheit & Konfiguration","+- Keine Default-Passwörter; `.env` nie committen (nur `.env.example`).","+- Secrets als Dateimounts/Docker-Secrets; Anzeige nur „gesetzt/nicht gesetzt\".","+- Rate-Limit am Login, JWT-Sessions, CSRF bei Cookies, Audit-Log für `task.created`, Logins, Freigaben.","+- SSRF-Schutz im Browser-Tool; Upload-Limits (15 MB, Allowlist); Mail-Absender strikt geprüft.","+- Sicherer Standardmodus: externe/kritische Aktionen brauchen Freigabe; Mail- und SOS-Versand standardmäßig aus (Testmodus)."]}]}]}
