// Goose-Port-Spiegel von: projects/startup-business-concepts-agentenplattform/apps/backend/app/services/mail_eingang.py
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/startup-business-concepts-agentenplattform/apps/backend/app/services/mail_eingang.py");
}

// ---- Original-Code (projects/startup-business-concepts-agentenplattform/apps/backend/app/services/mail_eingang.py), unveraendert, als Inline-Doku ----
// """IMAP-Eingang: ein Postfach, Absenderprüfung, Routing an den Orchestrator.
//
// Konfiguration über Umgebung (nie im Code):
//   MAIL_IMAP_HOST, MAIL_IMAP_USER, MAIL_IMAP_PASSWORT, MAIL_IMAP_ORDNER=INBOX
// Ohne Konfiguration meldet der Abruf ehrlich „nicht konfiguriert" statt
// fremde Aufträge zu erfinden. Bereits verarbeitete UIDs werden per
// Document-Eintrag (quelle=mail:<uid>) als gesehen markiert.
// """
// from __future__ import annotations
// import imaplib, email, os
// from email.header import decode_header
// from sqlalchemy.orm import Session
// from app.db import models
// from app.services.mail import normalisiere_absender, absender_erlaubt, praefix_erkennen
// from app.services.orchestrator import auftrag_anlegen
// from app.core.config import settings
// from app.core.logging import get_logger
//
// log = get_logger("mail_eingang")
//
// def konfiguriert() -> bool:
//     return bool(os.environ.get("MAIL_IMAP_HOST") and os.environ.get("MAIL_IMAP_USER"))
//
// def _text_aus_msg(msg) -> str:
//     if msg.is_multipart():
//         for teil in msg.walk():
//             if teil.get_content_type() == "text/plain" and not teil.get_filename():
//                 try: return teil.get_payload(decode=True).decode("utf-8", errors="replace")[:5000]
//                 except Exception: continue
//         return ""
//     try: return str(msg.get_payload(decode=True).decode("utf-8", errors="replace"))[:5000]
//     except Exception: return ""
//
// def _betreff(msg) -> str:
//     roh, enc = decode_header(msg.get("Subject", ""))[0]
//     if isinstance(roh, bytes):
//         try: return roh.decode(enc or "utf-8", errors="replace")
//         except Exception: return ""
//     return str(roh)
//
// def abruf_einmal(db: Session) -> dict:
//     """Holt ungelesene Mails einmalig ab, prüft Absender, legt Tasks an."""
//     if not konfiguriert():
//         return {"status": "nicht_konfiguriert",
//                 "hinweis": "MAIL_IMAP_HOST/USER/PASSWORT setzen (siehe docs/configuration.md)."}
//     host, user, pw = os.environ["MAIL_IMAP_HOST"], os.environ["MAIL_IMAP_USER"], os.environ.get("MAIL_IMAP_PASSWORT", "")
//     ordner = os.environ.get("MAIL_IMAP_ORDNER", "INBOX")
//     anzahl, abgelehnt, fehler = 0, 0, ""
//     try:
//         with imaplib.IMAP4_SSL(host) as m:
//             m.login(user, pw)
//             m.select(ordner, readonly=False)
//             _, daten = m.search(None, "UNSEEN")
//             for uid in daten[0].split():
//                 merker = f"mail:{uid.decode()}"
//                 if db.query(models.Document).filter_by(quelle=merker).first():
//                     continue  # bereits verarbeitet (Idempotenz)
//                 _, msg_daten = m.fetch(uid, "(RFC822)")
//                 nachricht = email.message_from_bytes(msg_daten[0][1])
//                 von = str(nachricht.get("From", ""))
//                 if not absender_erlaubt(von):
//                     abgelehnt += 1
//                     m.store(uid, "+FLAGS", "\\Seen")
//                     db.add(models.Event(type="email.received", source="mail",
//                                         payload={"von": normalisiere_absender(von),
//                                                    "ergebnis": "abgelehnt"}))
//                     continue
//                 betreff, text = _betreff(nachricht), _text_aus_msg(nachricht)
//                 ziel = praefix_erkennen(betreff, text)
//                 r = auftrag_anlegen(ziel, betreff or "(ohne Betreff)", {"text": text, "via": "mail"})
//                 import uuid
//                 t = models.Task(agent_id=r["agent_id"], title=betreff or "(ohne Betreff)",
//                                 input={"text": text, "via": "mail"}, status="queued",
//                                 idempotency_key=f"mail-{merker}-{uuid.uuid4().hex[:8]}")
//                 db.add(t)
//                 db.add(models.Document(titel=betreff[:200] or merker, quelle=merker, inhalt=text[:5000]))
//                 db.add(models.Event(type="email.received", source="mail", ref_id=t.id,
//                                     payload={"von": normalisiere_absender(von), "ziel": r["agent_id"]}))
//                 m.store(uid, "+FLAGS", "\\Seen")
//                 anzahl += 1
//             db.commit()
//     except Exception as e:  # noqa: BLE001 – Fehler sichtbar, nie als Erfolg
//         fehler = str(e); log.info(f"IMAP-Abruf fehlgeschlagen: {e}")
//     return {"status": "ok" if not fehler else "fehler", "neu": anzahl,
//             "abgelehnt": abgelehnt, "fehler": fehler}
//
