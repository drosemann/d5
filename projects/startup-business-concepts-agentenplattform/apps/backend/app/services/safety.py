"""SOS: deterministisch, idempotent, Standard = Testmodus ohne Versand."""
def sos_validieren(lat: float, lon: float) -> tuple[bool, str]:
    if not (-90 <= lat <= 90 and -180 <= lon <= 180): return False, "Koordinaten ungültig"
    return True, "ok"
SOS_STATUS = ["test","ausgeloest","bestaetigt"]
