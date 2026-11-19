Plot-Einladungen MVP: Milestones

Format: M1–M4 mit groben Zeitplänen

Summary
- Ziel ist ein End-to-End Invite-Flow mit persistenter Invite-Codes, Sign-Up-Flow, JWT-Authentifizierung, Admin-UI und Localization.

Progress
- Fortschritt bislang: MVP-Architektur skizziert; API- und Frontend-Grundlagen definiert. Milestones implementieren die Details schrittweise.

Outstanding
- Datenmodell InviteCode persistent speichern (SQLite)
- Admin-API: Create/List/Update/Revoke/Export
- Sign-Up-Flow Endpunkte + Invite-Verifikation
- JWT-Integration (HS256) mit Config-Secret
- Password-Hashing (salted SHA-256 MVP)
- Frontend: Admin-Dashboard Invite UI; signup.html signup_de.html
- Localization: Resource-basiertes i18n + Accept-Language Routing
- Tests: SignUpFlowTest, JwtUtilTest

Acceptance
- End-to-End Invite-Flow funktioniert mit persistenten Codes, JWT-Auth und Admin-Verwaltung
- Admin-UI greift DB-backed Gateway
- Sign-Up nutzt Invite-Code-Verifikation, salted Hashing, JWT
- Localization liefert deutsche und englische Ressourcen

Risks
- Sicherheit bei JWT/Invite-Verwaltung; richtige Handling von Secrets
- Migration/Backwards-Compat bei Änderungen der Gateways
- Testabdeckung ausreichend für MVP

Milestones
- M1 – Fundament API & Infrastruktur (2–3 Wochen)
  - Persistente Invite-Codes (InviteCode-Modell)
  - SqliteInvitationGateway, SqliteUserGateway
  - Admin-API Grundfunktionen: Create/List/Update/Revoke/Export
  - Sign-Up-Flow Grundstruktur: /auth/signup-with-code, /auth/validate-invitation
- M2 – Sicherheit & JWT (1–2 Wochen)
  - JWT-Unterstützung: HS256, Secret aus Config/Umgebung
  - Password Hashing: salted SHA-256 MVP
  - Sign-Up-Flow mit Invite-Verifizierung
- M3 – Admin-UI & Frontend (1–2 Wochen)
  - Admin-Dashboard: Invite-Gateway-Backed UI
  - Frontend-Integ: signup.html, signup_de.html
  - Localization: resource-basiertes i18n, Accept-Language Routing
- M4 – Stabilität & Tests (1–2 Wochen)
  - Tests: SignUpFlowTest, JwtUtilTest
  - End-to-End Invites-Flow Testabdeckung
  - Dokumentation & Localization-Tests

Open Questions
- Soll der Invite-Flow periodische Expiration haben? Welche Grace-Period?
- Welche Secrets-Lieferkette bevorzugt ihr (Env-Only vs Config-Datei)?
- Bestehende Datenmigrationen für Invite-Codes? (falls vorhanden)

Ausblick
- Nach MVP: Migration zu Argon2id/bcrypt bei Password-Hashing, optional Refresh-Token-Mechanismus

<!-- ZIMBU-PORT -->
## Zimbu-Port

Dieses Projekt ist mechanisch nach [Zimbu](https://moolenaar.net/z/zimbu/spec/zimbu.html)
(Bram Moolenaar) gespiegelt: Jede Code-Datei hat eine <name>.<ext>.zimbu-Schwester
mit Zimbu-Modulgeruest (MODULE/FUNC Main) und dem VOLLSTAENDIGEN Original-Code
als #-Inline-Doku. Kein Original-Code wurde geloescht oder veraendert.
Die .zimbu-Dateien sind mechanische Spiegel (80/20: Geruest steht, Logik-Port
per Hand verfeinern). Stand: 2026-11-12.

<!-- GOOSE-PORT -->
## Goose-Port

Dieses Projekt ist mechanisch nach [Goose](https://github.com/aardappel/goose)
(aardappel/goose v2026.4) gespiegelt: Jede Code-Datei hat eine <name>.<ext>.goose-Schwester
mit gueltigem Goose-Programmgeruest (n main()/print, pruefbar mit goose check)
und dem VOLLSTAENDIGEN Original-Code als //-Inline-Doku. Kein Original-Code wurde
geloescht oder veraendert. Die .goose-Dateien sind mechanische Spiegel (Geruest steht
und kompiliert, Logik-Port per Hand verfeinern). Stand: 2026-11-16.
