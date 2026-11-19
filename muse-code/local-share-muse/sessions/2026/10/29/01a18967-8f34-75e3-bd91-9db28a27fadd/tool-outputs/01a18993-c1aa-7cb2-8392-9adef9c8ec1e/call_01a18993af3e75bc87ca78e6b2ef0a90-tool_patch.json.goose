// Goose-Port-Spiegel von: muse-code/local-share-muse/sessions/2026/10/29/01a18967-8f34-75e3-bd91-9db28a27fadd/tool-outputs/01a18993-c1aa-7cb2-8392-9adef9c8ec1e/call_01a18993af3e75bc87ca78e6b2ef0a90-tool_patch.json
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: muse-code/local-share-muse/sessions/2026/10/29/01a18967-8f34-75e3-bd91-9db28a27fadd/tool-outputs/01a18993-c1aa-7cb2-8392-9adef9c8ec1e/call_01a18993af3e75bc87ca78e6b2ef0a90-tool_patch.json");
}

// ---- Original-Code (muse-code/local-share-muse/sessions/2026/10/29/01a18967-8f34-75e3-bd91-9db28a27fadd/tool-outputs/01a18993-c1aa-7cb2-8392-9adef9c8ec1e/call_01a18993af3e75bc87ca78e6b2ef0a90-tool_patch.json), unveraendert, als Inline-Doku ----
// {"files":[{"path":"\\\\?\\C:\\Users\\danie\\OneDrive\\github-repos\\Agentenplattform\\infra\\backup\\restore.sh","hunks":[{"oldStart":1,"oldLines":0,"newStart":1,"newLines":16,"lines":["+#!/bin/sh","+# Restore: listet Snapshots, stellt gewählten Snapshot nach /tmp/restore wieder her.","+# Echte Wiederherstellung (DB-Import) nur bewusst durch den Besitzer:","+#   1. sh restore.sh snapshots        → Snapshot-ID wählen","+#   2. sh restore.sh restore <ID>     → Dateien nach /tmp/restore/<ID>","+#   3. DB-Dump manuell prüfen, dann: psql \"$DATABASE_URL\" < /tmp/restore/<ID>/db_*.sql","+set -eu","+if [ -z \"${RESTIC_REPOSITORY:-}\" ] || [ -z \"${RESTIC_PASSWORD:-}\" ]; then","+  echo \"Kein Backup-Ziel konfiguriert.\"","+  exit 0","+fi","+case \"${1:-snapshots}\" in","+  snapshots) restic snapshots ;;","+  restore) restic restore \"${2:?Snapshot-ID fehlt}\" --target \"/tmp/restore/${2}\" ;;","+  *) echo \"Nutze: restore.sh [snapshots|restore <ID>]\" ;;","+esac"]}]}]}
