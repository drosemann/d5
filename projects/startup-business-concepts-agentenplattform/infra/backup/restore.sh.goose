// Goose-Port-Spiegel von: projects/startup-business-concepts-agentenplattform/infra/backup/restore.sh
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/startup-business-concepts-agentenplattform/infra/backup/restore.sh");
}

// ---- Original-Code (projects/startup-business-concepts-agentenplattform/infra/backup/restore.sh), unveraendert, als Inline-Doku ----
// #!/bin/sh
// # Restore: listet Snapshots, stellt gewählten Snapshot nach /tmp/restore wieder her.
// # Echte Wiederherstellung (DB-Import) nur bewusst durch den Besitzer:
// #   1. sh restore.sh snapshots        → Snapshot-ID wählen
// #   2. sh restore.sh restore <ID>     → Dateien nach /tmp/restore/<ID>
// #   3. DB-Dump manuell prüfen, dann: psql "$DATABASE_URL" < /tmp/restore/<ID>/db_*.sql
// set -eu
// if [ -z "${RESTIC_REPOSITORY:-}" ] || [ -z "${RESTIC_PASSWORD:-}" ]; then
//   echo "Kein Backup-Ziel konfiguriert."
//   exit 0
// fi
// case "${1:-snapshots}" in
//   snapshots) restic snapshots ;;
//   restore) restic restore "${2:?Snapshot-ID fehlt}" --target "/tmp/restore/${2}" ;;
//   *) echo "Nutze: restore.sh [snapshots|restore <ID>]" ;;
// esac
//
