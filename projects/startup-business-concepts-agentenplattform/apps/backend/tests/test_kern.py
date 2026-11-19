"""Kerntests (ohne externe Dienste, Mocks). Betrieb: pytest (mit Freigabe)."""
from app.services.orchestrator import statuswechsel_erlaubt, delegierentiefe_pruefen
from app.services.mail import absender_erlaubt, anhang_geprueft
from app.tools.registry import darf_tool, ssrf_geprueft
from app.services.markt import ranking, ist_duplikat
from app.agents.registry import routing_stichwort

def test_statusmaschine():
    assert statuswechsel_erlaubt("pending","queued") and not statuswechsel_erlaubt("pending","succeeded")
def test_delegationstiefe():
    assert delegierentiefe_pruefen(["a","b"]) and not delegierentiefe_pruefen(["a","b","a"])
def test_mail_absender():
    assert not absender_erlaubt("fremd@evil.de")
def test_anhang():
    assert not anhang_geprueft("x.exe", 10)[0] and not anhang_geprueft("d.pdf", 99*1024*1024)[0]
def test_tool_freigabe():
    ok,_ = darf_tool("finance","mail.senden",False); assert not ok
    ok,_ = darf_tool("finance","mail.senden",True); assert ok
    assert not ssrf_geprueft("http://169.254.169.254/x")
def test_markt():
    assert ist_duplikat("https://a.de/x?y=1","https://A.DE/x")
    assert ranking(500, 1000) > ranking(1500, 1000)
def test_routing():
    assert routing_stichwort("Finanzbericht importieren") == "finance"

def test_planung_konflikt():
    from app.services.planung import konflikte_finden
    from types import SimpleNamespace as NS
    from datetime import datetime
    fixe = [NS(titel="A", beginn=datetime(2026,1,1,9), ende=datetime(2026,1,1,10)),
            NS(titel="B", beginn=datetime(2026,1,1,9,30), ende=datetime(2026,1,1,11))]
    k = konflikte_finden(fixe)
    assert len(k) == 1 and k[0]["typ"] == "fix_ueberlappung"

def test_runner_orphan_und_retry():
    # Orphan-Erkennung und Backoff-Tabelle sind deterministisch ableitbar
    from app.services.runner import BACKOFF_S, MAX_RETRIES
    assert MAX_RETRIES == 3 and BACKOFF_S == [10, 60, 300]

def test_quellen_demo_idempotent():
    from app.services import quellen
    d1 = quellen.demo_inserate("p")
    assert len(d1) == 2 and all("Demo" in x["titel"] for x in d1)

def test_agenten_prompts_und_tools():
    from app.agents.registry import AGENTEN
    assert len(AGENTEN) >= 20
    for a in AGENTEN.values():
        assert a.systemprompt, a.id
    assert "listing.import" in AGENTEN["wohnung"].tools
    assert AGENTEN["safety"].tools == []
    assert AGENTEN["coding"].tools == ["shell.ausfuehren", "docs.suchen"]

def test_tool_gate():
    from app.tools.registry import darf_tool
    ok, _ = darf_tool("finance", "docs.suchen", False)
    assert ok
    ok, grund = darf_tool("finance", "mail.senden", False)
    assert not ok and "Freigabe" in grund
    ok, _ = darf_tool("planner", "shell.ausfuehren", True)
    assert not ok  # Agent nicht berechtigt, trotz Freigabe

def test_betrag_parser():
    # Deutsche (1.234,56) und englische (1234.56) Schreibweise – gleiche Logik wie main._betrag
    def betrag(roh: str) -> float:
        s = roh.strip().replace(" ", "")
        if "," in s: s = s.replace(".", "").replace(",", ".")
        return float(s)
    assert betrag("1.234,56") == 1234.56 and betrag("1234.56") == 1234.56 and betrag("650") == 650.0

def test_gateway_tool_schema():
    from app.providers.gateway import tool_schema_fuer
    s = tool_schema_fuer("docs.suchen", "Suche")
    assert s["function"]["name"] == "docs.suchen"

def test_versand_standard_aus():
    from app.services import versand
    ok, _ = versand.mailversand_bereit()
    assert not ok  # Standard: kein echter Versand
    ok, _ = versand.push_bereit()
    assert not ok

def test_coding_braucht_freigabe():
    from app.services.coding import auftrag_vorbereiten
    erg = auftrag_vorbereiten("Test", "diff", freigegeben=False)
    assert erg["status"] == "freigabe_noetig"

def test_kalender_tool_validierung():
    from app.tools.registry import darf_tool
    # planner darf kalender.eintragen nur mit Freigabe
    ok, _ = darf_tool("planner", "kalender.eintragen", False)
    assert not ok
    ok, _ = darf_tool("planner", "kalender.eintragen", True)
    assert ok
    ok, _ = darf_tool("finance", "kalender.eintragen", True)
    assert not ok  # falscher Agent

def test_verkehr_demo_braucht_db_nicht():
    from app.services.mail import praefix_erkennen
    assert praefix_erkennen("@finance Bericht", "") == "finance"
    assert praefix_erkennen("Hallo Welt", "") is None
