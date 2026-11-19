"""Erstmigration: erzeugt alle Tabellen aus app.db.models."""
revision = "0001"; down_revision = None
from alembic import op  # noqa
def upgrade():
    from app.db.base import Base, engine
    import app.db.models  # noqa
    Base.metadata.create_all(bind=engine)
def downgrade(): pass
