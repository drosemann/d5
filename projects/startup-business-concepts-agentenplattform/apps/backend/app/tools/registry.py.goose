// Goose-Port-Spiegel von: projects/startup-business-concepts-agentenplattform/apps/backend/app/tools/registry.py
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/startup-business-concepts-agentenplattform/apps/backend/app/tools/registry.py");
}

// ---- Original-Code (projects/startup-business-concepts-agentenplattform/apps/backend/app/tools/registry.py), unveraendert, als Inline-Doku ----
// """Tool-Registry mit Side-Effect-Klassen und Freigabepflicht."""
// from pydantic import BaseModel
//
// class Tool(BaseModel):
//     id: str; beschreibung: str; side_effect: str  # read_only|internal_write|external_write|critical
//     freigabe_noetig: bool = False; agenten: list[str] = []
//
// TOOLS: dict[str, Tool] = {
//     "docs.suchen": Tool(id="docs.suchen", beschreibung="Freigegebene Dokumente durchsuchen", side_effect="read_only"),
//     "plan.erstellen": Tool(id="plan.erstellen", beschreibung="Tagesplan berechnen (intern)", side_effect="internal_write"),
//     "kalender.eintragen": Tool(id="kalender.eintragen", beschreibung="Kalendereintrag anlegen (nur mit Freigabe)", side_effect="internal_write", freigabe_noetig=True, agenten=["planner", "school"]),
//     "listing.import": Tool(id="listing.import", beschreibung="Inserat speichern (intern)", side_effect="internal_write", agenten=["wohnung","auto","deals"]),
//     "mail.senden": Tool(id="mail.senden", beschreibung="E-Mail versenden (extern)", side_effect="external_write", freigabe_noetig=True),
//     "sos.versenden": Tool(id="sos.versenden", beschreibung="Echte SOS-Zustellung", side_effect="critical", freigabe_noetig=True),
//     "shell.ausfuehren": Tool(id="shell.ausfuehren", beschreibung="Isolierter Coding-Workspace", side_effect="critical", freigabe_noetig=True, agenten=["coding"]),
//     "web.abrufen": Tool(id="web.abrufen", beschreibung="URL abrufen (SSRF-geprüft)", side_effect="read_only", agenten=["browser","technews"]),
// }
//
// def darf_tool(agent_id: str, tool_id: str, freigegeben: bool, sicherer_modus: bool = True) -> tuple[bool, str]:
//     """Serverseitige Prüfung. Systemprompts sind keine Sicherheitsgrenze."""
//     t = TOOLS.get(tool_id)
//     if not t: return False, f"Unbekanntes Tool: {tool_id}"
//     if t.agenten and agent_id not in t.agenten and agent_id != "orchestrator":
//         return False, f"Agent {agent_id} darf {tool_id} nicht nutzen"
//     if sicherer_modus and t.side_effect in ("external_write", "critical") and not freigegeben:
//         return False, "Sicherer Modus: externe/kritische Aktion braucht Freigabe"
//     if t.freigabe_noetig and not freigegeben: return False, "Freigabe erforderlich"
//     return True, "ok"
//
// def ssrf_geprueft(url: str) -> bool:
//     u = url.lower()
//     for verboten in ["localhost", "127.", "169.254.", "10.", "192.168.", "172.16.", "172.17.", "metadata"]:
//         if verboten in u: return False
//     return u.startswith("http://") or u.startswith("https://")
//
