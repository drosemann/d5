"""Orchestrator: Routing, Statusmaschine, Timeouts, Delegationsgrenze."""
import uuid, time
from app.agents.registry import routing_stichwort, hole_definition

STATUS = ["pending","queued","running","waiting_for_approval","succeeded","failed","cancelled"]
ERLAUBT: dict[str,set[str]] = {
    "pending": {"queued","cancelled"}, "queued": {"running","cancelled"},
    "running": {"waiting_for_approval","succeeded","failed","cancelled"},
    "waiting_for_approval": {"running","cancelled","failed"}, "succeeded": set(), "failed": set(), "cancelled": set(),
}
def statuswechsel_erlaubt(von: str, nach: str) -> bool: return nach in ERLAUBT.get(von, set())

def auftrag_anlegen(agent_id: str | None, titel: str, eingabe: dict) -> dict:
    """Legt persistenten Task-Datensatz an (DB-Schicht füllt Idempotenz)."""
    aid = agent_id or routing_stichwort(titel + " " + str(eingabe))
    d = hole_definition(aid)
    if d is None or not d.enabled: return {"agent_id": "orchestrator", "hinweis": "Agent unbekannt/deaktiviert – Orchestrator übernimmt."}
    if d.id == "safety": return {"agent_id": aid, "hinweis": "Safety läuft deterministisch, ohne LLM-Abhängigkeit."}
    return {"agent_id": aid, "hinweis": ""}

def delegierentiefe_pruefen(kette: list[str], max_tiefe: int = 3) -> bool:
    """Verhindert Endlosschleifen/rekursive Delegation."""
    return len(kette) <= max_tiefe and len(set(kette)) == len(kette)

def neue_idempotenz() -> str: return str(uuid.uuid4())
