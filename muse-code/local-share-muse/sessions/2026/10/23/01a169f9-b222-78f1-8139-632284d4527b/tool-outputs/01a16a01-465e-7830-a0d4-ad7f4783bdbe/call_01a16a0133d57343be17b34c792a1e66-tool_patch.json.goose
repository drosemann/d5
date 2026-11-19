// Goose-Port-Spiegel von: muse-code/local-share-muse/sessions/2026/10/23/01a169f9-b222-78f1-8139-632284d4527b/tool-outputs/01a16a01-465e-7830-a0d4-ad7f4783bdbe/call_01a16a0133d57343be17b34c792a1e66-tool_patch.json
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: muse-code/local-share-muse/sessions/2026/10/23/01a169f9-b222-78f1-8139-632284d4527b/tool-outputs/01a16a01-465e-7830-a0d4-ad7f4783bdbe/call_01a16a0133d57343be17b34c792a1e66-tool_patch.json");
}

// ---- Original-Code (muse-code/local-share-muse/sessions/2026/10/23/01a169f9-b222-78f1-8139-632284d4527b/tool-outputs/01a16a01-465e-7830-a0d4-ad7f4783bdbe/call_01a16a0133d57343be17b34c792a1e66-tool_patch.json), unveraendert, als Inline-Doku ----
// {"files":[{"path":"\\\\?\\C:\\Users\\danie\\OneDrive\\github-repos\\forum-for-nerds\\docker-compose.yml","hunks":[{"oldStart":1,"oldLines":0,"newStart":1,"newLines":23,"lines":["+services:","+  app:","+    build: .","+    ports:","+      - \"3000:3000\"","+    env_file: .env","+    environment:","+      DATABASE_URL: ${DATABASE_URL:-file:./dev.db}","+    depends_on:","+      - mariadb","+  mariadb:","+    image: mariadb:10.5","+    restart: unless-stopped","+    environment:","+      MARIADB_ROOT_PASSWORD: ${MARIADB_ROOT_PASSWORD:-change-me}","+      MARIADB_DATABASE: forum_for_nerds","+      MARIADB_USER: forum","+      MARIADB_PASSWORD: ${MARIADB_PASSWORD:-change-me}","+    volumes:","+      - mariadb-data:/var/lib/mysql","+","+volumes:","+  mariadb-data:"]}]}]}
