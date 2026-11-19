// Goose-Port-Spiegel von: projects/startup-business-concepts-agentenplattform/apps/backend/app/services/adapter.py
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/startup-business-concepts-agentenplattform/apps/backend/app/services/adapter.py");
}

// ---- Original-Code (projects/startup-business-concepts-agentenplattform/apps/backend/app/services/adapter.py), unveraendert, als Inline-Doku ----
// """Quellenadapter: Verkehr (Störungen), Schule (Stundenplan), Tech-News (RSS).
//
// Prinzip: Dokumentierte Adapter-Schnittstelle, Demo-Modus mit klar
// gekennzeichneten Beispielen, echte Quellen nur wo zulässig und konfiguriert.
// WebUntis/GTFS-Realtime brauchen echte Zugänge – ohne diese meldet der Adapter
// „nicht konfiguriert", statt Live-Daten zu erfinden.
// """
// from __future__ import annotations
// import os
// from sqlalchemy.orm import Session
// from app.db import models
// from app.tools.registry import ssrf_geprueft
// from app.core.logging import get_logger
//
// log = get_logger("adapter")
//
// # --- Verkehr ---
// def verkehr_stoerungen(db: Session, quelle: str = "demo", feed_url: str = "") -> dict:
//     """Prüft Störungen; erzeugt mobility.disruption_detected-Events."""
//     stoerungen: list[dict] = []
//     if quelle == "demo":
//         stoerungen = [{"linie": "S1 (Demo)", "text": "10 Min Verspätung (Beispiel, keine echte Störung)."}]
//     elif quelle == "json" and feed_url and ssrf_geprueft(feed_url):
//         import urllib.request, json
//         with urllib.request.urlopen(feed_url, timeout=20) as r:  # noqa: S310 – geprüft
//             daten = json.loads(r.read(256 * 1024))
//         for e in (daten if isinstance(daten, list) else daten.get("stoerungen", []))[:20]:
//             stoerungen.append({"linie": str(e.get("linie", "?")), "text": str(e.get("text", ""))[:300]})
//     else:
//         return {"status": "nicht_konfiguriert",
//                 "hinweis": "GTFS(-RT)/Verkehrs-API braucht echte Zugangsdaten – siehe docs/configuration.md."}
//     for s in stoerungen:
//         db.add(models.Event(type="mobility.disruption_detected", source=f"verkehr:{quelle}",
//                             ref_id=s["linie"], payload=s))
//     db.commit()
//     return {"status": "ok", "stoerungen": len(stoerungen)}
//
// # --- Schule: Stundenplan-CSV (tage;beginn;ende;fach;raum) ---
// def stundenplan_import(db: Session, csv_text: str) -> dict:
//     import csv, io
//     from datetime import datetime
//     angelegt, geaendert = 0, 0
//     for z in csv.DictReader(io.StringIO(csv_text), delimiter=";"):
//         try:
//             titel = f"{z['fach']} ({z.get('raum', '')})".strip()
//             beginn = datetime.fromisoformat(z["beginn"]); ende = datetime.fromisoformat(z["ende"])
//             alt = db.query(models.CalendarItem).filter_by(titel=titel, beginn=beginn).first()
//             if alt and alt.ende != ende:
//                 alt.ende = ende; geaendert += 1
//                 db.add(models.Event(type="school.schedule_changed", source="schule",
//                                     ref_id=alt.id, payload={"titel": titel}))
//             elif not alt:
//                 db.add(models.CalendarItem(titel=titel, beginn=beginn, ende=ende, fix=True)); angelegt += 1
//         except (KeyError, ValueError): continue
//     db.commit()
//     return {"angelegt": angelegt, "geaendert": geaendert}
//
// # --- Tech-News: RSS-Feeds → Dokumente + Events ---
// def technews_import(db: Session, feeds: list[str]) -> dict:
//     from app.services.quellen import rss_importieren
//     neu = 0
//     for url in feeds[:5]:
//         try: eintraege = rss_importieren(url)
//         except Exception as e:  # noqa: BLE001 – ein Feed blockiert nicht die anderen
//             log.info(f"Feed übersprungen {url}: {e}"); continue
//         for e in eintraege:
//             if db.query(models.Document).filter_by(quelle=f"technews:{e['url']}").first(): continue
//             db.add(models.Document(titel=e["titel"][:200], quelle=f"technews:{e['url']}",
//                                    inhalt=e["titel"])); neu += 1
//     db.commit()
//     return {"dokumente": neu}
//
