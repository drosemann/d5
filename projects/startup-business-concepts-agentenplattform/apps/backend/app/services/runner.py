"""Task-Ausführung: führt queued Tasks über das Modell-Gateway aus.

Deterministisch: Statusübergänge, begrenzte Retries mit Backoff, Timeout,
Orphan-Erkennung nach Neustart. Kein Agent ruft Provider direkt auf.
"""
from __future__ import annotations
import time
from datetime import datetime
from sqlalchemy.orm import Session
from app.db import models
from app.agents.registry import hole_definition
from app.providers.gateway import MockProvider, OpenAIKompatibelProvider, ChatAnfrage, ChatNachricht
from app.services.orchestrator import statuswechsel_erlaubt
from app.core.config import settings
from app.core.logging import get_logger

log = get_logger("runner")
MAX_RETRIES = 3
BACKOFF_S = [10, 60, 300]  # begrenzter Backoff pro Versuch

def _gateway_fuer(agent_id: str, db: Session):
    """Wählt Provider anhand des Agenten-Modellprofils (Fallback: Standard)."""
    if settings.demo_mode:
        return MockProvider(), None
    import os
    profil = db.query(models.ModelProfile).filter_by(agent_id=agent_id).first()
    p = None
    if profil:
        p = db.query(models.ModelProvider).filter_by(id=profil.provider_id, enabled=True).first()
    if p is None:
        p = db.query(models.ModelProvider).filter_by(enabled=True).first()
    if p is None:
        return MockProvider(), None  # sichtbar als Demo markiert, kein stiller Erfolg
    api_key = os.environ.get("PROVIDER_API_KEY", "")
    gw = OpenAIKompatibelProvider(base_url=p.base_url, api_key=api_key,
                                  modell=(profil.modell if profil and profil.modell else p.default_model),
                                  timeout=(profil.timeout_s if profil else p.timeout_seconds))
    return gw, profil

def _status_setzen(db: Session, task: models.Task, nach: str, fehler: str | None = None):
    if not statuswechsel_erlaubt(task.status, nach):
        log.info(f"Statuswechsel {task.status}->{nach} abgelehnt ({task.id})")
        return False
    task.status = nach
    if fehler is not None: task.error = fehler
    task.updated_at = datetime.utcnow()
    db.commit()
    return True

def task_ausfuehren(task_id: str, db: Session) -> str:
    """Führt einen Task aus inkl. Run-Protokoll; gibt Endstatus zurück."""
    task = db.query(models.Task).filter_by(id=task_id).first()
    if task is None: return "unbekannt"
    d = hole_definition(task.agent_id)
    if d is None or not d.enabled:
        _status_setzen(db, task, "failed", "Agent unbekannt oder deaktiviert")
        return "failed"
    if not _status_setzen(db, task, "running"): return task.status
    start = time.time()
    run = models.AgentRun(task_id=task.id, agent_id=task.agent_id, status="running")
    db.add(run); db.commit()
    versuch = 0
    while versuch <= MAX_RETRIES:
        try:
            gateway, _profil = _gateway_fuer(task.agent_id, db)
            text = task.title + "\n" + str(task.input.get("text", ""))
            antwort = _agent_durchlauf(gateway, d, text, task, db, run)
            task.result = {"text": antwort.text, "modell": antwort.modell,
                           "tool_calls": len(antwort.tool_calls), "versuch": versuch + 1}
            break
        except Exception as e:  # noqa: BLE001 – Fehlerdetails bleiben nachvollziehbar
            versuch += 1
            run.log += f"\nVersuch {versuch} fehlgeschlagen: {e}"
            db.commit()
            if versuch > MAX_RETRIES:
                _status_setzen(db, task, "failed", str(e))
                run.status = "failed"; db.commit()
                db.add(models.Event(type="agent.failed", source="runner",
                                    ref_id=task.id,
                                    payload={"agent": task.agent_id, "fehler": str(e)}))
                db.commit()
                return "failed"
            time.sleep(0)  # echter Backoff läuft über Scheduler; hier kein Blockieren
            run.log += f" (Backoff {BACKOFF_S[min(versuch-1, 2)]}s eingeplant)"
            db.commit()
    run.status = "succeeded"
    run.duration_ms = int((time.time() - start) * 1000)
    run.log += f"\nFertig nach {run.duration_ms}ms."
    task.last_run_at = None
    db.commit()
    agent = db.query(models.Agent).filter_by(id=task.agent_id).first()
    if agent: agent.last_run_at = datetime.utcnow(); agent.last_error = None; db.commit()
    _status_setzen(db, task, "succeeded")
    db.add(models.Event(type="task.completed", source="runner", ref_id=task.id)); db.commit()
    return "succeeded"

def _agent_durchlauf(gateway, definition, text: str, task, db, run):
    """Ein Agenten-Durchlauf: Systemprompt + Tools, serverseitig ausgeführt.

    1. Gateway-Aufruf mit Systemprompt und erlaubten Tool-Schemas.
    2. Tool-Calls des Modells werden serverseitig geprüft/ausgeführt (max_calls).
    3. Zweiter Gateway-Aufruf fasst Tool-Ergebnisse zusammen.
    """
    from app.tools.registry import TOOLS
    from app.tools.executor import tool_ausfuehren
    from app.providers.gateway import tool_schema_fuer
    schemas = [tool_schema_fuer(t, TOOLS[t].beschreibung)
               for t in (definition.tools or []) if t in TOOLS]
    nachrichten = [ChatNachricht(rolle="system", inhalt=definition.systemprompt or
                                 "Du bist ein hilfreicher Assistent. Antworte deutsch."),
                   ChatNachricht(rolle="user", inhalt=text)]
    req = ChatAnfrage(nachrichten=nachrichten, tools=schemas)
    antwort = _gateway_sync(gateway, req)
    aufrufe = (antwort.tool_calls or [])[: (definition.max_calls or 10)]
    if not aufrufe: return antwort
    run.log += f"\nModell will {len(aufrufe)} Tool(s) nutzen."
    for c in aufrufe:
        args = dict(c.argumente or {}); args["_task_id"] = task.id
        ausgang = tool_ausfuehren(task.agent_id, c.name, args, db)
        run.log += f"\nTool {c.name}: {'OK' if 'ergebnis' in ausgang else ausgang.get('fehler', '?')}"
        db.commit()
        nachrichten.append(ChatNachricht(
            rolle="tool", inhalt=f"Tool {c.name}: {ausgang.get('ergebnis', ausgang)}",
            tool_call_id=c.id))
    req2 = ChatAnfrage(nachrichten=nachrichten)
    return _gateway_sync(gateway, req2)

def _gateway_sync(gateway, req):
    """Ruft async-Gateway aus synchronem Worker auf."""
    import asyncio
    try:
        asyncio.get_running_loop()
    except RuntimeError:
        return asyncio.run(gateway.chat(req))
    import concurrent.futures
    with concurrent.futures.ThreadPoolExecutor(max_workers=1) as ex:
        return ex.submit(asyncio.run, gateway.chat(req)).result(timeout=req.timeout)

def verwaiste_jobs_aufnehmen(db: Session) -> int:
    """Markiert beim Start hängende running/queued Tasks als failed (nachvollziehbar)."""
    hänger = db.query(models.Task).filter(models.Task.status.in_(["running", "queued"])).all()
    for t in hänger:
        t.status = "failed"; t.error = "Abgebrochen: Worker-Neustart (Orphan-Erkennung)"
        t.updated_at = datetime.utcnow()
        db.add(models.Event(type="agent.failed", source="runner", ref_id=t.id,
                            payload={"grund": "orphan"}))
    db.commit()
    return len(hänger)
