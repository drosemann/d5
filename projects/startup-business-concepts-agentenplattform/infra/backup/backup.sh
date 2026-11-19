#!/bin/sh
# Backup: PostgreSQL-Dump + uploads + Konfiguration, verschlüsselt via restic.
# Bedarf: RESTIC_REPOSITORY, RESTIC_PASSWORD (Umgebung/Datei), .env ist eingerichtet.
# Ohne Ziel: Status „nicht konfiguriert" (Scheduler meldet das ehrlich).
set -eu
if [ -z "${RESTIC_REPOSITORY:-}" ] || [ -z "${RESTIC_PASSWORD:-}" ]; then
  echo "Backup übersprungen: RESTIC_REPOSITORY/RESTIC_PASSWORD nicht gesetzt."
  exit 0
fi
STAMP=$(date +%Y%m%d_%H%M%S)
pg_dump "${DATABASE_URL:-postgresql://agent:agent@db:5432/agentenplattform}" > "/tmp/db_$STAMP.sql"
restic backup "/tmp/db_$STAMP.sql" uploads config compose.yaml .env.example \
  --tag "agentenplattform,$STAMP" 2>&1 | tail -5
rm -f "/tmp/db_$STAMP.sql"
restic forget --keep-daily 7 --keep-weekly 4 --prune 2>&1 | tail -3
echo "Backup fertig: $STAMP"
