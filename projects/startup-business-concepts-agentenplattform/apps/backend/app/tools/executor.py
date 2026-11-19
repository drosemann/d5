"""Tool-Ausführung: ruft nur registrierte Handler mit validierten Argumenten auf.

Ablauf: darf_tool() prüft Berechtigung → Handler läuft serverseitig →
Ergebnis geht zurück an den Agenten. Externe/kritische Tools brauchen
eine genehmigte Freigabe (Approval-ID). Unbekannte Tools werden abgelehnt.
"""
from __future__ import annotations
from sqlalchemy.orm import Session
from app.db import models
from app.tools.registry import darf_tool
from app.core.logging import get_logger

log = get_logger("tools")

def _docs_suchen(db: Session, args: dict) -> dict:
    q = str(args.get("query", ""))[:200]
    treffer = (db.query(models.Document).filter(models.Document.titel.contains(q)).limit(5).all()
               if q else db.query(models.Document).order_by(models.Document.created_at.desc()).limit(5).all())
    return {"treffer": [{"titel": d.titel, "quelle": d.quelle,
                         "auszug": d.inhalt[:500]} for d in treffer]}

def _plan_erstellen(db: Session, args: dict) -> dict:
    from app.services.planung import tagesplan_bauen
    return tagesplan_bauen(db)

def _listing_import(db: Session, args: dict) -> dict:
    from app.services.quellen import import_lauf
    return import_lauf(str(args.get("profil_id", "")), float(args.get("max_preis", 1000000)),
                       db, str(args.get("quelle", "demo")), str(args.get("feed_url", "")))

def _web_abrufen(db: Session, args: dict) -> dict:
    from workers.browser.worker import abrufen
    return {"inhalt": abrufen(str(args.get("url", "")))[:2000]}

def _kalender_eintragen(db: Session, args: dict) -> dict:
    from datetime import datetime
    titel = str(args.get("titel", ""))[:200]
    if not titel or not args.get("beginn") or not args.get("ende"):
        return {"fehler": "titel/beginn/ende erforderlich (ISO-Format)."}
    e = models.CalendarItem(titel=titel, beginn=datetime.fromisoformat(str(args["beginn"])),
                            ende=datetime.fromisoformat(str(args["ende"])), fix=False)
    db.add(e); db.commit()
    return {"id": e.id, "hinweis": "Entwurf – sichtbar, kein fixer Termin."}

HANDLER = {"docs.suchen": _docs_suchen, "plan.erstellen": _plan_erstellen,
           "listing.import": _listing_import, "web.abrufen": _web_abrufen,
           "kalender.eintragen": _kalender_eintragen,
           "mail.senden": None, "sos.versenden": None, "shell.ausfuehren": None}
# None = kein automatischer Handler: nur mit Freigabe, Ausführung über separaten Ablauf.

def tool_ausfuehren(agent_id: str, tool_id: str, args: dict, db: Session,
                    approval_id: str | None = None) -> dict:
    """Führt ein Tool nach Berechtigungsprüfung aus. Gibt Ergebnis oder Fehler zurück."""
    freigegeben = False
    if approval_id:
        a = db.query(models.Approval).filter_by(id=approval_id).first()
        freigegeben = bool(a and a.status == "genehmigt")
    ok, grund = darf_tool(agent_id, tool_id, freigegeben, sicherer_modus=True)
    if not ok:
        log.info(f"Tool abgelehnt: {agent_id}/{tool_id}: {grund}")
        # Ablehnung als ausstehende Freigabe anlegen (für externe/kritische Aktionen)
        if "Freigabe" in grund:
            ap = models.Approval(task_id=str(args.get("_task_id", "")), zweck=f"{agent_id} möchte {tool_id} ausführen: {grund}")
            db.add(ap); db.commit()
            return {"fehler": grund, "approval_id": ap.id,
                    "hinweis": "Freigabe angelegt – nach Genehmigung erneut aufrufen."}
        return {"fehler": grund}
    handler = HANDLER.get(tool_id)
    if handler is None:
        return {"fehler": f"{tool_id} braucht manuelle Freigabe-Ausführung (kein Auto-Handler).",
                "approval_id": approval_id}
    try:
        ergebnis = handler(db, args)
        db.add(models.AuditLog(actor=agent_id, aktion=f"tool.{tool_id}", detail=str(args)[:500]))
        db.commit()
        if isinstance(ergebnis, dict) and "fehler" in ergebnis:
            return ergebnis  # Handler-Fehler ehrlich weitergeben, nicht als Erfolg
        return {"ergebnis": ergebnis}
    except Exception as e:  # noqa: BLE001 – Fehler gehen an den Agenten, nicht ins Nichts
        return {"fehler": f"{tool_id} fehlgeschlagen: {e}"}
