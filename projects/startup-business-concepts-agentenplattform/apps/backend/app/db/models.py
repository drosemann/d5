"""Alle Tabellen: Core, Dateien, Planner, Finanzen, Health, Markt, Safety."""
from __future__ import annotations
import uuid
from datetime import datetime
from sqlalchemy import (String, Text, Boolean, Integer, Float, DateTime, ForeignKey, JSON, UniqueConstraint, Index)
from sqlalchemy.orm import Mapped, mapped_column
from app.db.base import Base

def uid(): return str(uuid.uuid4())
def now(): return datetime.utcnow()

class User(Base):
    __tablename__ = "users"
    id: Mapped[str] = mapped_column(String, primary_key=True, default=uid)
    email: Mapped[str] = mapped_column(String, unique=True, index=True)
    password_hash: Mapped[str] = mapped_column(String)
    created_at: Mapped[datetime] = mapped_column(DateTime, default=now)

class Agent(Base):
    __tablename__ = "agents"
    id: Mapped[str] = mapped_column(String, primary_key=True)  # z.B. planner
    display_name: Mapped[str] = mapped_column(String)
    description: Mapped[str] = mapped_column(Text, default="")
    enabled: Mapped[bool] = mapped_column(Boolean, default=True)
    model_profile: Mapped[str] = mapped_column(String, default="standard")
    last_run_at: Mapped[datetime | None] = mapped_column(DateTime, nullable=True)
    last_error: Mapped[str | None] = mapped_column(Text, nullable=True)

class ModelProvider(Base):
    __tablename__ = "model_providers"
    id: Mapped[str] = mapped_column(String, primary_key=True, default=uid)
    provider_type: Mapped[str] = mapped_column(String)  # ollama|openai|kompatibel
    display_name: Mapped[str] = mapped_column(String)
    base_url: Mapped[str] = mapped_column(String)
    api_key_ref: Mapped[str] = mapped_column(String, default="")  # Secret-Referenz, kein Klartext
    has_secret: Mapped[bool] = mapped_column(Boolean, default=False)
    default_model: Mapped[str] = mapped_column(String, default="")
    timeout_seconds: Mapped[int] = mapped_column(Integer, default=60)
    max_retries: Mapped[int] = mapped_column(Integer, default=2)
    enabled: Mapped[bool] = mapped_column(Boolean, default=True)
    supports_streaming: Mapped[bool] = mapped_column(Boolean, default=False)
    supports_tools: Mapped[bool] = mapped_column(Boolean, default=False)
    supports_json_mode: Mapped[bool] = mapped_column(Boolean, default=False)
    context_window: Mapped[int | None] = mapped_column(Integer, nullable=True)
    extra: Mapped[dict] = mapped_column(JSON, default=dict)

class ModelProfile(Base):
    """Modellprofil pro Agent: Provider, Modell, Parameter, Fallback."""
    __tablename__ = "model_profiles"
    id: Mapped[str] = mapped_column(String, primary_key=True, default=uid)
    agent_id: Mapped[str] = mapped_column(String, unique=True, index=True)
    provider_id: Mapped[str] = mapped_column(String, ForeignKey("model_providers.id"))
    modell: Mapped[str] = mapped_column(String, default="")
    temperatur: Mapped[float] = mapped_column(Float, default=0.3)
    max_tokens: Mapped[int] = mapped_column(Integer, default=800)
    timeout_s: Mapped[int] = mapped_column(Integer, default=60)
    fallback_modell: Mapped[str] = mapped_column(String, default="")
    updated_at: Mapped[datetime] = mapped_column(DateTime, default=now)

class ApiKey(Base):
    """Eigene API-Schlüssel für Fassade/externe Clients (nur Hash gespeichert)."""
    __tablename__ = "api_keys"
    id: Mapped[str] = mapped_column(String, primary_key=True, default=uid)
    name: Mapped[str] = mapped_column(String)
    key_hash: Mapped[str] = mapped_column(String, unique=True, index=True)
    aktiv: Mapped[bool] = mapped_column(Boolean, default=True)
    created_at: Mapped[datetime] = mapped_column(DateTime, default=now)

class Task(Base):
    __tablename__ = "tasks"
    id: Mapped[str] = mapped_column(String, primary_key=True, default=uid)
    agent_id: Mapped[str] = mapped_column(String, ForeignKey("agents.id"))
    title: Mapped[str] = mapped_column(String)
    input: Mapped[dict] = mapped_column(JSON, default=dict)
    status: Mapped[str] = mapped_column(String, default="pending", index=True)  # pending|queued|running|waiting_for_approval|succeeded|failed|cancelled
    idempotency_key: Mapped[str] = mapped_column(String, unique=True, index=True)
    result: Mapped[dict | None] = mapped_column(JSON, nullable=True)
    error: Mapped[str | None] = mapped_column(Text, nullable=True)
    created_at: Mapped[datetime] = mapped_column(DateTime, default=now, index=True)
    updated_at: Mapped[datetime] = mapped_column(DateTime, default=now)

class AgentRun(Base):
    __tablename__ = "agent_runs"
    id: Mapped[str] = mapped_column(String, primary_key=True, default=uid)
    task_id: Mapped[str] = mapped_column(String, ForeignKey("tasks.id"), index=True)
    agent_id: Mapped[str] = mapped_column(String, index=True)
    status: Mapped[str] = mapped_column(String, default="running")
    log: Mapped[str] = mapped_column(Text, default="")
    duration_ms: Mapped[int] = mapped_column(Integer, default=0)
    created_at: Mapped[datetime] = mapped_column(DateTime, default=now)

class Event(Base):
    __tablename__ = "events"
    id: Mapped[str] = mapped_column(String, primary_key=True, default=uid)
    type: Mapped[str] = mapped_column(String, index=True)
    source: Mapped[str] = mapped_column(String, default="")
    correlation_id: Mapped[str] = mapped_column(String, default="", index=True)
    ref_id: Mapped[str] = mapped_column(String, default="")
    schema_version: Mapped[int] = mapped_column(Integer, default=1)
    payload: Mapped[dict] = mapped_column(JSON, default=dict)
    created_at: Mapped[datetime] = mapped_column(DateTime, default=now, index=True)

class Approval(Base):
    __tablename__ = "approvals"
    id: Mapped[str] = mapped_column(String, primary_key=True, default=uid)
    task_id: Mapped[str] = mapped_column(String, index=True)
    zweck: Mapped[str] = mapped_column(Text)  # deutsch: Zweck/Auswirkung
    status: Mapped[str] = mapped_column(String, default="offen")  # offen|genehmigt|abgelehnt|abgelaufen
    created_at: Mapped[datetime] = mapped_column(DateTime, default=now)
    expires_at: Mapped[datetime | None] = mapped_column(DateTime, nullable=True)

class Notification(Base):
    __tablename__ = "notifications"
    id: Mapped[str] = mapped_column(String, primary_key=True, default=uid)
    kanal: Mapped[str] = mapped_column(String, default="pwa")
    text: Mapped[str] = mapped_column(Text)
    status: Mapped[str] = mapped_column(String, default="pending")  # pending|sent|failed|suppressed
    created_at: Mapped[datetime] = mapped_column(DateTime, default=now)

class AuditLog(Base):
    __tablename__ = "audit_log"
    id: Mapped[int] = mapped_column(Integer, primary_key=True, autoincrement=True)
    actor: Mapped[str] = mapped_column(String)
    aktion: Mapped[str] = mapped_column(String)
    detail: Mapped[str] = mapped_column(Text, default="")
    created_at: Mapped[datetime] = mapped_column(DateTime, default=now, index=True)

class SystemSetting(Base):
    __tablename__ = "system_settings"
    key: Mapped[str] = mapped_column(String, primary_key=True)
    value: Mapped[dict] = mapped_column(JSON, default=dict)

class Document(Base):
    __tablename__ = "documents"
    id: Mapped[str] = mapped_column(String, primary_key=True, default=uid)
    titel: Mapped[str] = mapped_column(String)
    quelle: Mapped[str] = mapped_column(String, default="")
    inhalt: Mapped[str] = mapped_column(Text, default="")
    created_at: Mapped[datetime] = mapped_column(DateTime, default=now)

class CalendarItem(Base):
    __tablename__ = "calendar_items"
    id: Mapped[str] = mapped_column(String, primary_key=True, default=uid)
    titel: Mapped[str] = mapped_column(String)
    beginn: Mapped[datetime] = mapped_column(DateTime, index=True)
    ende: Mapped[datetime] = mapped_column(DateTime)
    fix: Mapped[bool] = mapped_column(Boolean, default=True)

class FinancialSnapshot(Base):
    __tablename__ = "financial_snapshots"
    id: Mapped[str] = mapped_column(String, primary_key=True, default=uid)
    datum: Mapped[datetime] = mapped_column(DateTime, default=now, index=True)
    vermoegen: Mapped[float] = mapped_column(Float, default=0.0)
    notiz: Mapped[str] = mapped_column(String, default="")
    demo: Mapped[bool] = mapped_column(Boolean, default=False)  # Demo-Kennzeichnung

class HealthMeasurement(Base):
    __tablename__ = "health_measurements"
    id: Mapped[str] = mapped_column(String, primary_key=True, default=uid)
    typ: Mapped[str] = mapped_column(String, index=True)  # schritte|schlaf_min|puls|gewicht
    wert: Mapped[float] = mapped_column(Float)
    zeit: Mapped[datetime] = mapped_column(DateTime, default=now, index=True)

class SearchProfile(Base):
    __tablename__ = "search_profiles"
    id: Mapped[str] = mapped_column(String, primary_key=True, default=uid)
    agent_id: Mapped[str] = mapped_column(String, default="wohnung")
    name: Mapped[str] = mapped_column(String)
    kriterien: Mapped[dict] = mapped_column(JSON, default=dict)
    aktiv: Mapped[bool] = mapped_column(Boolean, default=True)

class Listing(Base):
    __tablename__ = "listings"
    id: Mapped[str] = mapped_column(String, primary_key=True, default=uid)
    profil_id: Mapped[str] = mapped_column(String, ForeignKey("search_profiles.id"), index=True)
    titel: Mapped[str] = mapped_column(String)
    preis: Mapped[float | None] = mapped_column(Float, nullable=True)
    url: Mapped[str] = mapped_column(String, default="")
    ranking: Mapped[float] = mapped_column(Float, default=0.0)
    favorit: Mapped[bool] = mapped_column(Boolean, default=False)
    abrufzeit: Mapped[datetime] = mapped_column(DateTime, default=now)
    __table_args__ = (UniqueConstraint("profil_id", "url", name="uq_profil_url"),)

class Device(Base):
    __tablename__ = "registered_devices"
    id: Mapped[str] = mapped_column(String, primary_key=True, default=uid)
    name: Mapped[str] = mapped_column(String)
    token_hash: Mapped[str] = mapped_column(String)

class LocationSample(Base):
    __tablename__ = "location_samples"
    id: Mapped[int] = mapped_column(Integer, primary_key=True, autoincrement=True)
    device_id: Mapped[str] = mapped_column(String, index=True)
    lat: Mapped[float] = mapped_column(Float)
    lon: Mapped[float] = mapped_column(Float)
    genauigkeit_m: Mapped[float] = mapped_column(Float, default=0)
    zeit: Mapped[datetime] = mapped_column(DateTime, default=now, index=True)
    __table_args__ = (Index("ix_loc_device_zeit", "device_id", "zeit"),)

class SosEvent(Base):
    __tablename__ = "sos_events"
    id: Mapped[str] = mapped_column(String, primary_key=True, default=uid)
    device_id: Mapped[str] = mapped_column(String, default="")
    status: Mapped[str] = mapped_column(String, default="test")  # test|ausgeloest|bestaetigt
    idempotency_key: Mapped[str] = mapped_column(String, unique=True)
    created_at: Mapped[datetime] = mapped_column(DateTime, default=now)
