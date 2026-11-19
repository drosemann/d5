// Goose-Port-Spiegel von: projects/startup-business-concepts-agentenplattform/apps/backend/app/db/base.py
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/startup-business-concepts-agentenplattform/apps/backend/app/db/base.py");
}

// ---- Original-Code (projects/startup-business-concepts-agentenplattform/apps/backend/app/db/base.py), unveraendert, als Inline-Doku ----
// """SQLAlchemy-Basis + Session."""
// from sqlalchemy import create_engine
// from sqlalchemy.orm import DeclarativeBase, sessionmaker
// from app.core.config import settings
//
// class Base(DeclarativeBase): pass
//
// engine = create_engine(settings.database_url, pool_pre_ping=True)
// SessionLocal = sessionmaker(bind=engine, expire_on_commit=False)
//
// def get_db():
//     db = SessionLocal()
//     try: yield db
//     finally: db.close()
//
