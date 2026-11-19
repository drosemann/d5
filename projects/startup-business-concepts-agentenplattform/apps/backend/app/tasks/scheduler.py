"""Scheduler-Jobs: Orphan-Erkennung, Demo-Import, Backup-Prüfung, Aufbewahrung.

Läuft im Backend-Prozess (APScheduler, Intervall-Jobs). Schreibt Events und
Notifications; löscht alte Standortdaten nach Aufbewahrungsfrist.
"""
from __future__ import annotations
from datetime import datetime, timedelta
from apscheduler.schedulers.background import BackgroundScheduler
from app.db.base import SessionLocal
from app.db import models
from app.core.logging import get_logger

log = get_logger("scheduler")
_planer = None

def job_verwaiste_jobs():
    db = SessionLocal()
    try:
        from app.services.runner import verwaiste_jobs_aufnehmen
        n = verwaiste_jobs_aufnehmen(db)
        if n: log.info(f"Scheduler: {n} verwaiste Jobs markiert")
    finally: db.close()

def job_backup_pruefung():
    """Meldet fehlendes/ablaufendes Backup (kein echter Backup-Lauf hier)."""
    import os
    db = SessionLocal()
    try:
        ziel = os.environ.get("RESTIC_REPOSITORY", "")
        ok = bool(ziel)
        db.add(models.Event(type="backup.failed" if not ok else "task.completed",
                            source="scheduler", ref_id="backup",
                            payload={"ziel_konfiguriert": ok}))
        db.commit()
        if not ok: log.info("Scheduler: kein Backup-Ziel konfiguriert")
    finally: db.close()

def job_aufbewahrung(tage_standort: int = 90):
    """Löscht Standortpunkte älter als die Frist (Standard 90 Tage)."""
    db = SessionLocal()
    try:
        grenze = datetime.utcnow() - timedelta(days=tage_standort)
        n = db.query(models.LocationSample).filter(models.LocationSample.zeit < grenze).delete()
        db.commit()
        if n: log.info(f"Scheduler: {n} alte Standortpunkte gelöscht")
    finally: db.close()

def job_demo_import():
    """Demo: täglicher Beispiel-Import, damit die Kette sichtbar läuft."""
    from app.core.config import settings
    if not settings.demo_mode: return
    db = SessionLocal()
    try:
        from app.services.quellen import import_lauf
        prof = db.query(models.SearchProfile).first()
        if prof: import_lauf(prof.id, 1000000, db, "demo")
    except Exception as e:  # noqa: BLE001 – Scheduler läuft weiter
        log.info(f"Demo-Import übersprungen: {e}")
    finally: db.close()

def job_mail_abruf():
    """Holt E-Mails alle 5 Min (nur wenn IMAP konfiguriert)."""
    from app.services.mail_eingang import abruf_einmal, konfiguriert
    if not konfiguriert(): return
    db = SessionLocal()
    try:
        erg = abruf_einmal(db)
        if erg.get("neu"): log.info(f"Scheduler: {erg['neu']} neue Mails")
    except Exception as e:  # noqa: BLE001 – Scheduler läuft weiter
        log.info(f"Mail-Abruf übersprungen: {e}")
    finally: db.close()

def job_versand():
    """Versendet ausstehende Notifications alle 2 Min."""
    from app.services.versand import ausstehende_versenden
    db = SessionLocal()
    try: ausstehende_versenden(db)
    except Exception as e:  # noqa: BLE001
        log.info(f"Versand übersprungen: {e}")
    finally: db.close()

def starten() -> BackgroundScheduler:
    global _planer
    if _planer: return _planer
    _planer = BackgroundScheduler()
    _planer.add_job(job_verwaiste_jobs, "interval", minutes=5, id="orphans")
    _planer.add_job(job_backup_pruefung, "interval", hours=6, id="backup")
    _planer.add_job(job_aufbewahrung, "interval", hours=24, id="retention")
    _planer.add_job(job_demo_import, "interval", hours=24, id="demoimport")
    _planer.add_job(job_mail_abruf, "interval", minutes=5, id="mail")
    _planer.add_job(job_versand, "interval", minutes=2, id="versand")
    _planer.start()
    log.info("Scheduler gestartet (orphans/mail/5min, versand/2min, backup/6h, retention+demo/24h).")
    return _planer
