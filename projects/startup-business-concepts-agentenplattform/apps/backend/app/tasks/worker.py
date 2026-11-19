"""Worker: holt queued Tasks aus PostgreSQL und führt sie via runner aus.

Läuft auch ohne Redis (direktes Polling, 5s). Mit Redis kann dieselbe
Funktion als Queue-Consumer betrieben werden – DB bleibt Wahrheit.
"""
import time
from app.db.base import SessionLocal
from app.db import models
from app.services.runner import task_ausfuehren, verwaiste_jobs_aufnehmen
from app.core.logging import get_logger

log = get_logger("worker")
POLL_S = 5

def main():
    db = SessionLocal()
    n = verwaiste_jobs_aufnehmen(db)
    if n: log.info(f"{n} verwaiste Jobs als failed markiert")
    db.close()
    log.info("Worker gestartet (Polling alle 5s).")
    try:
        while True:
            try:
                with open("/tmp/worker_heartbeat.txt", "w") as f:
                    from datetime import datetime; f.write(f"worker ok {datetime.utcnow().isoformat()}")
            except Exception: pass
            db = SessionLocal()
            try:
                nxt = (db.query(models.Task).filter_by(status="queued")
                       .order_by(models.Task.created_at).first())
                if nxt:
                    tid = nxt.id; db.close()
                    db2 = SessionLocal()
                    try: log.info(f"Führe Task {tid} aus → {task_ausfuehren(tid, db2)}")
                    finally: db2.close()
                    continue
                db.close()
            except Exception as e:  # noqa: BLE001 – Worker darf nie still sterben
                log.info(f"Worker-Fehler (läuft weiter): {e}")
                try: db.close()
                except Exception: pass
            time.sleep(POLL_S)
    except KeyboardInterrupt: pass

if __name__ == "__main__": main()
