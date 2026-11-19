"""Isolierter Coding-Worker: separater Workspace, nur mit Freigabe."""
def vorschlag_erstellen(repo: str, beschreibung: str, freigegeben: bool) -> str:
    if not freigegeben: raise PermissionError("Coding-Eingriffe brauchen Freigabe")
    return f"[Platzhalter] Änderungsbericht für {repo}: {beschreibung}"
