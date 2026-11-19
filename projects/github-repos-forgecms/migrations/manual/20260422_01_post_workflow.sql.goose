// Goose-Port-Spiegel von: projects/github-repos-forgecms/migrations/manual/20260422_01_post_workflow.sql
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/github-repos-forgecms/migrations/manual/20260422_01_post_workflow.sql");
}

// ---- Original-Code (projects/github-repos-forgecms/migrations/manual/20260422_01_post_workflow.sql), unveraendert, als Inline-Doku ----
// -- ForgeCMS manual migration
// -- Feature set: Post workflow states (draft/scheduled/published/archived)
//
// ALTER TABLE post
//     ADD COLUMN status VARCHAR(20) NOT NULL DEFAULT 'draft' AFTER published,
//     ADD COLUMN publish_at DATETIME NULL AFTER status,
//     ADD COLUMN published_at DATETIME NULL AFTER publish_at;
//
// -- Backfill existing rows so current behavior is preserved.
// UPDATE post
// SET
//     status = CASE WHEN published = 1 THEN 'published' ELSE 'draft' END,
//     published_at = CASE WHEN published = 1 THEN COALESCE(created_at, UTC_TIMESTAMP()) ELSE NULL END
// WHERE status IS NULL OR status = '' OR status = 'draft';
//
// -- Helpful index for status-based filtering and scheduling lookups.
// CREATE INDEX ix_post_status_publish_at ON post (status, publish_at);
//
