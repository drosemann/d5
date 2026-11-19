"""Zentrale Einstellungen (Umgebung). Keine Secrets im Code."""
from pydantic_settings import BaseSettings, SettingsConfigDict

class Settings(BaseSettings):
    model_config = SettingsConfigDict(env_file=".env", extra="ignore")
    app_env: str = "development"
    secret_key: str = "CHANGE_ME_32_ZEICHEN_MINDESTENS"
    database_url: str = "postgresql+psycopg://agent:agent@db:5432/agentenplattform"
    redis_url: str = "redis://redis:6379/0"
    allowed_email_sender: str = "ich@example.de"
    demo_mode: bool = True
    facade_enabled: bool = False
    facade_api_key: str = ""
    outbound_mail_enabled: bool = False
    sos_delivery_enabled: bool = False

settings = Settings()
