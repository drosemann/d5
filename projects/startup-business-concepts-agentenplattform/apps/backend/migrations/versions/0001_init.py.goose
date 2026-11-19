// Goose-Port-Spiegel von: projects/startup-business-concepts-agentenplattform/apps/backend/migrations/versions/0001_init.py
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/startup-business-concepts-agentenplattform/apps/backend/migrations/versions/0001_init.py");
}

// ---- Original-Code (projects/startup-business-concepts-agentenplattform/apps/backend/migrations/versions/0001_init.py), unveraendert, als Inline-Doku ----
// """Erstmigration: erzeugt alle Tabellen aus app.db.models."""
// revision = "0001"; down_revision = None
// from alembic import op  # noqa
// def upgrade():
//     from app.db.base import Base, engine
//     import app.db.models  # noqa
//     Base.metadata.create_all(bind=engine)
// def downgrade(): pass
//
