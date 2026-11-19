# MASTER-PROMPT: Entwicklung einer vollständigen privaten KI-Agentenplattform

## 0. Deine Rolle und das Ziel

Du bist ein autonom arbeitender Senior Software Architect, Senior Full-Stack Engineer, DevOps Engineer und Security Engineer.

Deine Aufgabe ist es, eine vollständige, modulare und sicherheitsbewusste private KI-Agentenplattform in diesem Repository zu **implementieren**.

Baue ein zusammenhängendes, nutzbares Softwaresystem und nicht nur ein Architekturkonzept, einen Prototyp oder eine Sammlung von Beispieldateien.

Die fertige Plattform soll auf einem normalen Linux-Server, vorzugsweise Ubuntu Server LTS, mittels Docker Compose betrieben werden können.

Du arbeitest direkt im vorhandenen Repository. Untersuche zuerst den tatsächlichen Repository-Inhalt, erkenne bestehende Technologien und vorhandenen Code und integriere deine Implementierung sinnvoll. Überschreibe bestehende Arbeit nicht blind.

**Arbeite eigenständig, setze sinnvolle technische Standards und beginne anschließend mit der Implementierung. Stelle keine Rückfragen, sofern eine vernünftige, sichere Entscheidung möglich ist. Stoppe nicht nach einer Planung oder Architekturzeichnung.**

### Strikte Grenze: Implementieren, nicht deployen oder operieren

Du darfst Quellcode erstellen und ändern, Dokumentation verfassen, statische Prüfungen, Unit-Tests, Integrationstests und Builds in einer dafür vorgesehenen Entwicklungsumgebung ausführen.

Du darfst ausdrücklich NICHT:

- die Plattform auf einem echten Server installieren, deployen oder produktiv starten;
- bestehende Container, virtuelle Maschinen, Serverdienste oder Netzwerkkonfigurationen verändern;
- produktive Datenbanken migrieren oder verändern;
- öffentliche Ports, DNS-Einträge, Firewalls oder Reverse Proxies konfigurieren;
- selbstständig echte E-Mails, Push-Nachrichten oder SMS versenden;
- echte Notfallmeldungen auslösen;
- reale Käufe, Bestellungen, Überweisungen, Kalenderänderungen oder sonstige externe Aktionen durchführen;
- Zugangsdaten oder API-Schlüssel auslesen, außerhalb des vorgesehenen Projekts suchen oder veröffentlichen;
- unaufgefordert externe Plattformen automatisiert bedienen oder ihre Zugriffsbeschränkungen umgehen.

Starte keine persistenten Dienste und keine Deployment-Workflows. Du darfst bei Bedarf isolierte, ausdrücklich freigegebene Testprozesse ausführen und musst sie danach beenden. Gibt es keine geeignete Testumgebung, schreibe Tests und prüfe den Code statisch, ohne den Zustand des Zielsystems zu verändern.

Die gelieferten Dateien sollen nach einer späteren, bewussten Installation durch den Besitzer startbar sein.

---

# 1. Produktvision

Entwickle eine persönliche KI-Plattform mit:

- einer zentralen Web-PWA als Dashboard;
- einem zentralen E-Mail-Eingang;
- einem Orchestrator für die Verteilung und Koordination von Aufträgen;
- mehreren spezialisierten Agenten;
- einem zentral konfigurierbaren Modell-Gateway;
- Unterstützung für Ollama, OpenAI und weitere OpenAI-kompatible API-Endpunkte;
- PostgreSQL als primärer Datenbank;
- Redis für Hintergrundjobs und Ereignisse;
- einem kontrollierten Tool-System;
- einer Berechtigungs- und Freigabeverwaltung;
- nachvollziehbarer Protokollierung;
- Monitoring, Fehlerbehandlung und Backups;
- einer optionalen Android-Komponente für Standortverlauf und manuelles SOS;
- Docker-Compose-Konfigurationen für Linux.

Die Plattform ist primär für einen einzelnen privaten Benutzer konzipiert. Sie soll dennoch intern sauber zwischen Benutzeridentität, Agenten, Aufträgen, Datenzugriffen und Berechtigungen unterscheiden.

Die Architektur muss modular sein. Ein neuer Agent oder Model Provider soll später über klar definierte Schnittstellen ergänzt werden können, ohne die gesamte Anwendung umzubauen.

Vermeide unnötige Microservices. Einzelne logische Komponenten dürfen getrennte Python-Module oder Worker sein. Eigene Container sind nur dort sinnvoll, wo sie einen betrieblichen oder sicherheitstechnischen Nutzen bieten.

---

# 2. Verbindlicher Technologie-Stack

Verwende einen konsistenten, aktuellen und miteinander kompatiblen Stack. Prüfe vor der Auswahl konkreter Bibliotheksversionen die bestehende Umgebung und dokumentiere die festgelegten Versionen.

## Backend

- Python 3.12 oder eine aktuell unterstützte, mit allen Abhängigkeiten kompatible Version.
- FastAPI.
- Pydantic v2 für Validierung und Datenmodelle.
- SQLAlchemy 2 für Datenbankzugriff.
- Alembic für Datenbankmigrationen.
- PostgreSQL als primärer Datenspeicher.
- Redis als Queue- und Event-Infrastruktur.
- Ein klar definierter Background-Worker, beispielsweise Celery mit Redis als Broker.
- Typsichere interne Schnittstellen.
- Strukturierte JSON-Logs.
- `pytest` für automatisierte Tests.
- Ruff und ein Type Checker für Qualitätskontrollen.

## Frontend

- React.
- TypeScript mit strikter Typprüfung.
- Vite.
- Eine installierbare, mobilfähige PWA.
- Ein konsistentes, barrierearmes UI-Design.
- Serverseitige Authentifizierung oder sicher konfigurierte Sessions.
- Keine Speicherung langfristiger API-Schlüssel in `localStorage`.

Das Frontend muss auf Desktop und Smartphone funktionieren. Für die zentralen Ansichten soll kein separater mobiler Webclient notwendig sein.

## Infrastruktur

- Docker und Docker Compose.
- Caddy als HTTPS-Reverse-Proxy.
- PostgreSQL und Redis auf ausschließlich internen Netzwerken.
- Ollama optional als Container beziehungsweise als separat erreichbarer Modellserver.
- Ein konfigurierbarer Mailadapter.
- Ein optionaler, separater Browser-/Scraper-Worker.
- Ein optionaler, isolierter Coding-Worker.
- Healthchecks, Restart-Policies und persistente Volumes.
- Verschlüsselte Backups.

Verwende keine unnötig große Infrastruktur wie Kubernetes, Kafka oder eine Vielzahl eigenständiger Datenbanken, solange kein konkreter Bedarf besteht.

---

# 3. Architekturprinzipien

Die folgenden Regeln sind verbindlich.

1. **Deterministische Logik vor KI:** Berechtigungen, Validierungen, Datenbanktransaktionen, Zeitpläne, Wiederholungslogik und sicherheitskritische Funktionen müssen durch normalen Programmcode kontrolliert werden.
2. **Least Privilege:** Jeder Agent erhält nur die Daten und Tools, die er benötigt.
3. **Provider-Unabhängigkeit:** Agenten dürfen nicht direkt von einem konkreten LLM-Anbieter abhängen.
4. **Persistenz:** Aufträge, Agentenläufe, Freigaben und wichtige Ereignisse müssen dauerhaft nachvollziehbar sein.
5. **Idempotenz:** Wiederholte Jobs dürfen keine doppelten externen Aktionen erzeugen.
6. **Begrenzte Ausführung:** Jeder Auftrag hat Timeouts, begrenzte Wiederholungen und definierte Ressourcenlimits.
7. **Keine versteckten Schreibrechte:** Nur weil ein Modell ein Tool aufrufen kann, bedeutet das nicht, dass es das Tool ausführen darf.
8. **Keine willkürliche Shell-Ausführung:** LLM-Ausgaben dürfen nicht unmittelbar als Shell-Befehle ausgeführt werden.
9. **Datenschutz:** Sensible Daten werden gezielt gespeichert, geschützt und nach konfigurierbaren Fristen gelöscht.
10. **Fehler dürfen nicht verschleiert werden:** Nicht implementierte, unkonfigurierte und fehlgeschlagene Funktionen müssen in UI und Logs erkennbar sein.

---

# 4. Zentrale Modellabstraktion – besonders wichtig

Implementiere ein zentrales, providerunabhängiges `Model Gateway`.

Alle Agenten rufen ausschließlich dieses Gateway auf. Kein Agent darf direkt an Ollama, OpenAI oder einen anderen Modellanbieter gekoppelt sein.

## 4.1 OpenAI-kompatible Provider

Unterstütze mindestens diese Konfigurationen:

- Ollama über seine OpenAI-kompatible API;
- OpenAI über die offizielle API;
- beliebige konfigurierbare OpenAI-kompatible Endpunkte, sofern diese die verwendeten Funktionen unterstützen.

Der Provider muss mindestens diese Einstellungen besitzen:

- `provider_id`
- `provider_type`
- `display_name`
- `base_url`
- `api_key` beziehungsweise sicherer Verweis auf ein Secret
- `default_model`
- `timeout_seconds`
- `max_retries`
- `enabled`
- `supports_streaming`
- `supports_tools`
- `supports_json_mode`
- `context_window`, soweit bekannt
- optionale providerbezogene Zusatzparameter

Verwende eine passende HTTP-Client-Abstraktion beziehungsweise den OpenAI Python SDK mit konfigurierbarer `base_url`, wo dies zweckmäßig ist.

Beispiel für einen lokalen Ollama-Endpunkt:

- Base URL: `http://ollama:11434/v1`
- API-Key-Feld: ein bedeutungsloser lokaler Platzhalter, falls der Client einen API-Key verlangt.
- Modellname: vom Benutzer konfigurierbar, beispielsweise ein vorhandenes quantisiertes Modell.

Behandle diese Werte nur als Beispiel. Erfinde keine Zugangsdaten und führe keine Modell-Downloads aus.

## 4.2 Einheitliche interne Schnittstelle

Definiere beispielsweise:

```python
class ModelProvider(Protocol):
    async def chat(self, request: ChatRequest) -> ChatResponse:
        ...

    async def healthcheck(self) -> ProviderHealth:
        ...

    async def list_models(self) -> list[ModelInfo]:
        ...
```

Die tatsächlichen Typen müssen vollständig implementiert sein.

Die interne Chat-Anfrage soll unterstützen:

- Nachrichtenrollen;
- Textnachrichten;
- Modellparameter;
- begrenzte Tool-Definitionen;
- strukturierte Ausgabe, wenn unterstützt;
- Streaming, wenn unterstützt;
- Timeouts;
- Nutzungsmetadaten;
- Fehlercodes und aussagekräftige Fehlermeldungen.

Lege ein dokumentiertes Capability-Modell an. Nicht jeder OpenAI-kompatible Anbieter unterstützt alle Funktionen. Erkenne nicht unterstützte Features und behandle sie kontrolliert, anstatt die Unterstützung stillschweigend vorzutäuschen.

Beginne mit der Chat-Completions-Schnittstelle. Eine zusätzliche Unterstützung weiterer OpenAI-API-Endpunkte ist nur dann verpflichtend, wenn sie mit dem verwendeten Anbieter und den benötigten Funktionen tatsächlich kompatibel implementiert werden kann.

## 4.3 Modellkonfiguration pro Agent

Jeder Agent soll sein eigenes Modellprofil erhalten können:

- Provider;
- Modell;
- Temperatur;
- maximale Ausgabelänge;
- Timeout;
- erlaubte Fähigkeiten;
- gegebenenfalls ein alternatives Modell.

Ein gemeinsamer Allround-Provider soll für alle Agenten verwendbar sein. Kleine Modelle für einfache Aufgaben und größere Modelle für komplexe Aufgaben sollen konfigurierbar sein.

## 4.4 Modellverwaltung in der PWA

Implementiere eine Einstellungsseite für:

- Provider anlegen, bearbeiten und deaktivieren;
- Base URL setzen;
- Secret sicher hinterlegen;
- vorhandene Modelle anzeigen, sofern der Provider dies unterstützt;
- Modellprofile Agenten zuweisen;
- Verbindungstest auslösen;
- Providerstatus anzeigen;
- Capability-Unterstützung anzeigen.

API-Schlüssel dürfen nach dem Speichern nicht wieder im Klartext im Frontend ausgegeben werden. Zeige nur an, ob ein Secret gesetzt ist.

Verwende getrennte Secrets für verschiedene Anbieter und niemals einen universellen Schlüssel, der an sämtliche Agenten weitergereicht wird.

---

# 5. Interne API und optionale OpenAI-kompatible Fassade

Neben der internen Modellabstraktion soll die Plattform eine dokumentierte HTTP-API anbieten.

Implementiere mindestens:

- `/health/live`
- `/health/ready`
- `/api/v1/auth`
- `/api/v1/agents`
- `/api/v1/tasks`
- `/api/v1/runs`
- `/api/v1/events`
- `/api/v1/settings`
- `/api/v1/providers`
- `/api/v1/search-profiles`
- `/api/v1/approvals`
- `/api/v1/notifications`
- `/api/v1/files`
- `/api/v1/finance`
- `/api/v1/health-data`
- `/api/v1/location`
- `/api/v1/safety`
- `/docs` nur entsprechend der Sicherheitskonfiguration.

Alle geschützten Endpunkte müssen authentifiziert und serverseitig autorisiert sein.

Implementiere zusätzlich eine optional aktivierbare OpenAI-kompatible API-Fassade:

- `GET /v1/models`
- `POST /v1/chat/completions`

Sie soll als kompatibler Zugang zur Plattform beziehungsweise zu ausdrücklich freigegebenen Modellprofilen dienen. Externe Clients dürfen nicht durch frei gewählte Modellnamen interne Agenten, geheime Provider, Tools oder andere Berechtigungen umgehen können.

Unterscheide eindeutig zwischen einem normalen Modellaufruf und einem Auftrag an einen Agenten. Verwende eine dokumentierte Zuordnung statt impliziter Sonderzeichenkonventionen.

Die Fassade ist standardmäßig deaktiviert oder nur mit einem eigenen API-Schlüssel nutzbar. Sie darf nicht ungeschützt öffentlich erreichbar sein.

Dokumentiere die API mit OpenAPI und liefere passende Beispielanfragen.

---

# 6. Agent Runtime und Orchestrator

Implementiere ein gemeinsames Agenten-Framework.

Ein Agent erhält eine deklarative Definition mit mindestens:

- eindeutiger ID;
- Name und Beschreibung;
- Version;
- Aufgabe und Systemprompt;
- Eingabeschema;
- Ausgabeschema;
- Modellprofil;
- erlaubten Tools;
- erlaubten Datenbereichen;
- Timeout;
- Wiederholungsregeln;
- Standardberechtigungen;
- Status `enabled` / `disabled`;
- maximal zulässigen Ressourcen beziehungsweise Modellaufrufen pro Auftrag.

Die Runtime muss Folgendes erledigen:

1. Eingang eines Auftrags.
2. Authentifizierung und Autorisierung des Benutzers.
3. Erstellung eines persistenten Task-Datensatzes.
4. Auswahl eines Agents oder Workflows.
5. Validierung der Eingabedaten.
6. Ausführung über den Worker.
7. Verwendung des Model Gateways.
8. Validierung der Ausgabe.
9. Speichern des Ergebnisses.
10. Protokollierung des Laufs.
11. Ermittlung des Endstatus.
12. Benachrichtigung bei Bedarf.

Implementiere definierte Statuswerte, mindestens:

- `pending`
- `queued`
- `running`
- `waiting_for_approval`
- `succeeded`
- `failed`
- `cancelled`

Implementiere Wiederholungen mit begrenztem Backoff, Timeouts, Job-Abbruch und Fehlerdetails.

Ein Agent darf andere Agenten nicht beliebig unbegrenzt aufrufen. Nutze eine begrenzte Task-Delegation über den Orchestrator. Verhindere Endlosschleifen, rekursive Delegation und unbegrenzte Modellkosten.

Die Agentenkommunikation erfolgt über persistente Aufträge, Events und Referenzen auf Ergebnisse. Vermeide direkte, unkontrollierte Agent-zu-Agent-Konversationen.

---

# 7. Event-System und Hintergrundjobs

Verwende Redis als Broker für Hintergrundaufträge. Celery oder eine gleichwertige, sauber implementierte Lösung ist zulässig.

PostgreSQL ist die dauerhafte Quelle der Wahrheit. Redis darf nicht der einzige Speicher für Aufgabenstatus oder wichtige Geschäftsereignisse sein.

Implementiere:

- persistente Task- und Run-Datensätze;
- eindeutige Job-IDs;
- Idempotenzschlüssel;
- begrenzte Retries;
- Dead-Letter-Handling beziehungsweise eine nachvollziehbare Liste endgültig fehlgeschlagener Aufträge;
- Job-Abbruch, soweit technisch möglich;
- regelmäßige Scheduler-Jobs;
- überwachte Worker-Heartbeats;
- Wiederaufnahme oder Erkennung verwaister Aufträge nach einem Neustart.

Events besitzen mindestens:

- ID;
- Typ;
- Erstellungszeit;
- Quelle;
- Korrelations-ID;
- Referenz auf den relevanten Datensatz;
- Version des Eventschemas.

Definiere Events unter anderem für:

- `email.received`
- `task.created`
- `task.completed`
- `agent.failed`
- `school.schedule_changed`
- `mobility.disruption_detected`
- `market.listing_found`
- `finance.snapshot_imported`
- `health.data_imported`
- `safety.sos_triggered`
- `backup.failed`

Nutze eine Outbox- oder gleichwertige Lösung, damit eine erfolgreich gespeicherte Datenbankänderung nicht aufgrund eines Prozessabsturzes zu einem unbemerkten Eventverlust führt.

---

# 8. Vollständige Agentenlandschaft

Implementiere alle folgenden Agenten in einer gemeinsamen Runtime.

Jeder Agent benötigt eine reale, testbare Grundfunktion, eine klar definierte Schnittstelle, ein Eingabe- und Ausgabeschema, passende Berechtigungen, UI-Darstellung und Fehlerbehandlung.

Wo Zugangsdaten, offizielle APIs oder externe Konfiguration fehlen, soll ein Agent mit manuellen Eingaben, Beispieldaten im ausdrücklich aktivierbaren Demo-Modus oder einem nicht aktivierten Connector vorbereitet sein. Behaupte niemals, echte Daten abgerufen zu haben, wenn dies nicht geschehen ist.

## 8.1 Orchestrator

Funktionen:

- analysiert Aufträge;
- ermittelt den zuständigen Agenten;
- kann einen Auftrag in begrenzte Teilaufgaben zerlegen;
- verwaltet Status und Ergebnisse;
- führt Zusammenfassungen durch;
- beachtet Berechtigungen und Modellbudgets;
- erkennt nicht unterstützte Aufgaben;
- legt bei fehlender Information nachvollziehbare Rückfragen an.

Der Orchestrator darf nicht selbst über zusätzliche Berechtigungen entscheiden.

## 8.2 Planner

Verarbeitet:

- Arbeitszeiten;
- Aufsteh- und Schlafzeiten;
- Morgenroutine;
- Berufsschule;
- Lernzeiten;
- Arbeitsweg;
- ÖPNV-Ereignisse;
- Gym;
- private GitHub-Projekte;
- Freizeit und Gaming;
- vom Benutzer freigegebene Kalender- und Kontextdaten.

Funktionen:

- Tages- und Wochenplanung;
- feste und flexible Zeitblöcke;
- priorisierte Aufgaben;
- realistische Zeitpuffer;
- Konflikterkennung;
- alternative Tagespläne;
- Replanung bei relevanten Ereignissen.

Schlaf, feste Termine und ausdrücklich definierte persönliche Regeln sollen als harte Planungsgrenzen berücksichtigt werden. Andere Aktivitäten können flexibel priorisiert werden.

Der Planner darf nicht ungefragt Kalendereinträge ändern.

## 8.3 Context Agent

Liest ausschließlich freigegebene E-Mails, Kalender, Notizen und Dokumente.

Funktionen:

- extrahiert relevante Informationen;
- erkennt mögliche Aufgaben und Termine;
- erstellt Zusammenfassungen;
- liefert begrenzten Kontext für andere Agenten;
- verweist auf Quellen und Zeitstempel.

Es gibt keine Schreibrechte auf die Originaldaten.

## 8.4 Finance Agent

Datenquellen sind manuell bereitgestellte oder ausdrücklich autorisierte Finanzberichte, beispielsweise PDF- und CSV-Dateien.

Funktionen:

- Import und Normalisierung von Berichten;
- finanzielle Snapshots;
- Verlauf von Vermögen und Depotpositionen;
- Budgetauswertung;
- Einnahmen- und Ausgabenübersicht;
- Fortschritt bei finanziellen Zielen;
- Abweichungen gegenüber vorherigen Zeiträumen;
- nachvollziehbare Berichte.

Keine direkten Bank- oder Brokerzugänge, keine Überweisungen, keine Orders und keine eigenständigen Finanztransaktionen.

## 8.5 Health Agent

Funktionen:

- Import kontrolliert bereitgestellter Gesundheits- und Wearable-Daten;
- Speicherung strukturierter Messwerte;
- aggregierte Tages- und Wochenwerte;
- Trends zu Aktivität und Schlaf;
- Berichte und gegebenenfalls Planungshinweise.

Integrationen wie Google Health API sind als getrennte, dokumentierte Adapter aufzubauen. OAuth-Tokens gehören ausschließlich in einen begrenzten Token-Store beziehungsweise Secret-Service.

Keine medizinischen Diagnosen. Keine automatische Änderung von Medikamenten oder Behandlungsempfehlungen.

## 8.6 School Agent

Funktionen:

- Import eines Stundenplans;
- optionaler Adapter für WebUntis, sofern die konkrete Schnittstelle und Berechtigung vorliegen;
- Erkennung von Änderungen;
- Erstellung standardisierter Events;
- Weitergabe relevanter Informationen an den Planner.

Ohne gültige Integration muss der Benutzer Stundenplandaten manuell importieren können.

## 8.7 Mobility Agent

Funktionen:

- Schnittstelle für Fahrplandaten;
- optionaler Adapter für GTFS und GTFS-Realtime oder einen anderen rechtmäßig nutzbaren Verkehrsdienst;
- Erkennung von Verspätungen und Ausfällen;
- Alternativen aus verfügbaren Daten;
- Events für den Planner.

Keine unbelegten Aussagen über echte Live-Verbindungen, wenn kein echter Datenanbieter konfiguriert ist.

## 8.8 Wohnung Agent

Funktionen:

- verwaltete Suchprofile;
- Preis- und Lagekriterien;
- Ausstattung und weitere Filter;
- Import von Inseraten aus zulässigen Quellen;
- Deduplizierung;
- Ranking;
- Verlauf;
- Benachrichtigungen.

Keine automatischen Bewerbungen oder Kontaktaufnahmen.

## 8.9 Auto Agent

Funktionen:

- Suchprofile für Fahrzeuge;
- Marke, Modell, Preis, Baujahr, Laufleistung, Motor, Kraftstoff, Getriebe und weitere Kriterien;
- Speicherung und Deduplizierung von Inseraten;
- Ranking;
- Preisvergleich, soweit Vergleichsdaten existieren;
- fehlende Angaben und mögliche Warnsignale;
- Verlauf und Favoriten.

Unterstütze mobile.de und Kleinanzeigen über sauber getrennte Quellenadapter, aber nur auf Basis tatsächlich verfügbarer und zulässiger Abrufwege.

Erfinde keine APIs. Umgehe keine Anmeldeschranken, CAPTCHAs, Rate Limits oder Anti-Bot-Schutzsysteme.

## 8.10 Kleinanzeigen-/Deal Agent

Funktionen:

- frei definierbare Objekttypen;
- beliebige Suchbegriffe;
- Preisober- und -untergrenzen;
- Zustand;
- Ort und Entfernung, sofern verfügbar;
- Ausschlusskriterien;
- Erkennung neuer Angebote;
- Duplikaterkennung;
- Preis-/Passgenauigkeitsranking;
- Warnsignale und fehlende Informationen;
- Benachrichtigungsregeln.

Unterstütze Kategorien wie Hardware, Server, Mini-PCs, NAS, Werkzeug, Gaming und Möbel, ohne diese fest im Code einzubauen.

## 8.11 Price Agent

Funktionen:

- Produkte oder Objekte beobachten;
- erlaubte Preisdaten speichern;
- historische Preise vergleichen;
- definierte Schwellenwerte verwenden;
- bei relevanten Preisänderungen einen Hinweis erzeugen.

## 8.12 YouTube Agent

Funktionen:

- YouTube-Link entgegennehmen;
- Metadaten verwalten;
- verfügbare und zulässig nutzbare Transkripte importieren;
- strukturierte Zusammenfassung erzeugen;
- Kapitel und Zeitmarken speichern, wenn Daten vorliegen;
- Kernaussagen, Aufgaben und Lernnotizen extrahieren.

Unterstütze auch einen manuellen Transkriptimport, wenn automatischer Zugriff nicht verfügbar ist.

## 8.13 Homelab Agent

Funktionen:

- kontrolliertes Einlesen von Monitoringdaten;
- Beobachtung von Proxmox, Docker, NAS, Speicher, SMART und Infrastrukturmetriken über konfigurierbare Adapter;
- Erkennung von Trends und Fehlerindikatoren;
- Statusberichte;
- Empfehlungen zur Fehlerbehebung.

Der Agent ist standardmäßig read-only. Keine Shell- oder Produktionszugriffe ohne klar abgegrenzte, explizite Freigabe.

## 8.14 Coding-/DevOps Agent

Funktionen:

- private GitHub-Projekte unterstützen;
- Aufgaben strukturieren;
- Branches und Änderungen vorschlagen, wenn ein dafür eingerichteter Workspace vorhanden ist;
- Tests und Codequalität auswerten;
- Änderungsberichte erstellen;
- mögliche Pull Requests vorbereiten.

Führe diesen Agenten nicht mit unbegrenztem Host-Zugriff aus. Er benötigt einen separaten Workspace und kontrollierte Berechtigungen.

## 8.15 Browser-/Scraper Agent

Funktionen:

- definierte Webseiten und Dokumente abrufen;
- Informationen extrahieren;
- Quellenreferenzen speichern;
- Inhalte normalisieren;
- Browseraufträge in einem begrenzten Worker ausführen.

Der Worker muss von Secrets, Produktionsdaten und internen Admin-Endpunkten isoliert sein. Blockiere standardmäßig SSRF-Angriffe, insbesondere Zugriffe auf interne IP-Bereiche, Cloud-Metadatenendpunkte und interne Dienste.

Keine Umgehung von Zugangsschranken oder Schutzmechanismen.

## 8.16 Backup Agent

Funktionen:

- Status der letzten Backups erfassen;
- Backupalter und Fehler melden;
- definierte Wiederherstellungstests dokumentieren;
- Storage-Verbrauch beobachten.

Er darf nicht ohne Freigabe Backup-Richtlinien ändern oder Backups löschen.

## 8.17 Security Agent

Funktionen:

- Monitoring- und Sicherheitsereignisse analysieren;
- auffällige Fehler oder Verfügbarkeitsänderungen berichten;
- Hinweise auf Konfigurationsprobleme geben;
- Vorschläge für Verbesserungen erstellen.

Keine eigenständigen destruktiven Systemänderungen.

## 8.18 Learning Agent

Funktionen:

- Lernpläne erstellen;
- Themen und Lernfortschritt strukturieren;
- Wiederholungen organisieren;
- Übungsaufgaben erstellen;
- Lernnotizen speichern.

## 8.19 Tech News Agent

Funktionen:

- konfigurierbare Themen beobachten;
- zulässige Feeds oder andere geeignete Quellen einlesen;
- Veröffentlichungsdatum und Quelle speichern;
- Aktualität und Dubletten berücksichtigen;
- Zusammenfassungen erstellen.

## 8.20 Report Agent

Funktionen:

- tägliche und wöchentliche Zusammenfassungen;
- offene Aufgaben;
- Agentenfehler;
- relevante Angebote;
- Tagesplanung;
- Systemstatus;
- Finance- und Health-Berichte nur unter Berücksichtigung ihrer Berechtigungen.

## 8.21 Safety / Location Agent

Dieser Bereich ist sicherheitskritisch und darf nicht von einem LLM abhängig sein.

Implementiere:

- Standortpunkte mit Zeitstempel und Positionsgenauigkeit;
- manuelles Einreichen von Standorten;
- Authentifizierung und Gerätebindung für die Standort-API;
- Verlauf und Kartenansicht;
- konfigurierbare Aufbewahrungsfristen;
- Anzeige des Alters des letzten Standortes;
- Datenlücken und Synchronisationsstatus;
- eine Liste explizit freigegebener Vertrauenspersonen;
- manuelles SOS;
- nachvollziehbare Notfallereignisse;
- einen begrenzten Ablauf für optionale Sicherheits-Check-ins.

Die Standortaufnahme und SOS-Auslösung erfolgen deterministisch über App und Backend.

Standortdaten dürfen ausschließlich für den eigenen Benutzer und ausdrücklich freigegebene Vertrauenspersonen zugänglich sein.

Ein SOS darf nicht von Ollama, einem Prompt oder der Verfügbarkeit des Orchestrators abhängen.

**Standardmäßig ist der Versand echter Notfallnachrichten deaktiviert.** Implementiere zunächst einen Testmodus, der die vollständige Nachricht erzeugt und in der Oberfläche sichtbar macht, sie aber nicht versendet. Erst eine später bewusst konfigurierte und aktivierte Versandfunktion darf echte Nachrichten zustellen.

Der Dienst darf keinen erfolgreichen Versand behaupten, wenn dieser nicht durch den vorgesehenen Provider bestätigt wurde.

Implementiere eine begrenzte Aufbewahrungsstrategie und Löschfunktion für Standortverläufe.

## 8.22 Notification Service

Implementiere einen zentralen Dienst für interne Benachrichtigungen.

Mögliche Kanäle:

- PWA-Benachrichtigungen;
- optional Web Push;
- E-Mail;
- spätere zusätzliche Provider.

Verwalte Nachrichtenzustände wie `pending`, `sent`, `failed` und `suppressed`.

Echte externe Zustellung ist standardmäßig deaktiviert. Der Benutzer muss einen Provider konfigurieren und den Versand bewusst aktivieren.

SOS-Nachrichten müssen einen gesonderten, klar priorisierten Weg benutzen, der nicht von der normalen LLM-Queue abhängig ist.

---

# 9. E-Mail-System

Die Plattform verwendet einen zentralen Posteingang, keine eigenen öffentlichen Postfächer pro Agent.

Implementiere:

- konfigurierbare IMAP- oder gleichwertige Postfachanbindung;
- Abfrage eines einzelnen Postfachs;
- strenge Prüfung der erlaubten Absenderadresse;
- Sendernormalisierung und Schutz vor triviale Umgehung durch Anzeigenamen;
- sichere Verarbeitung von MIME-Nachrichten;
- Größenlimits für Anhänge;
- Typprüfung;
- Malware-Scanning als konfigurierbare Komponente;
- sichere Ablage von Anhängen;
- Erkennung bereits verarbeiteter E-Mails;
- Routing an den Orchestrator;
- optionale explizite Präfixe wie `@finance`, `@youtube` und `@planner`;
- Unterstützung für Nachrichten ohne Präfix, die der Orchestrator klassifizieren darf.

Lege die erlaubte E-Mail-Adresse über sichere Konfiguration fest und verweigere den Eingang fremder Aufträge vor der Agentenausführung.

Verlasse dich nicht ausschließlich auf den frei formulierbaren Header `From`. Nutze die authentifizierte Mailbox, geprüfte Absenderdaten des Providers und nach Möglichkeit die serverseitige Absenderprüfung.

Auch Nachrichten des erlaubten Absenders werden als nicht vertrauenswürdiger Inhalt behandelt.

Implementiere outbound E-Mail getrennt vom Inbound-Mail-Verarbeiter. Der ausgehende Versand muss eine konfigurierbare Empfänger-Allowlist unterstützen. Standardmäßig erfolgt kein echter Versand.

Kein Agent darf eigene Postfach-Zugangsdaten erhalten.

---

# 10. PWA / Dashboard

Baue eine tatsächlich nutzbare Oberfläche, keine statische Demo-Seite.

Die PWA muss mindestens Folgendes enthalten:

## Dashboard

- Begrüßung und aktueller Status;
- Tagesplan;
- offene Aufgaben;
- letzte Agentenläufe;
- zuletzt eingegangene Ereignisse;
- Agentenstatus;
- relevante neue Angebote;
- Benachrichtigungen;
- Systemstatus.

## Agentenübersicht

- alle registrierten Agenten;
- Status;
- Kurzbeschreibung;
- Modellprofil;
- Berechtigungen;
- letzter Lauf;
- letzter Fehler;
- Auftragsverlauf;
- Aktivieren und Deaktivieren.

Deaktivieren muss tatsächlich verhindern, dass neue Jobs dieses Agents ausgeführt werden. Bereits laufende Aufgaben müssen nachvollziehbar behandelt werden.

## Chat und Aufgaben

- Auftrag an einen Agenten senden;
- allgemeinen Auftrag an den Orchestrator senden;
- Verlauf und Status anzeigen;
- strukturierte Ergebnisse darstellen;
- Fehler verständlich anzeigen;
- unterstützte Abbruchfunktion.

## Einstellungen

- Provider und Modellprofile;
- allgemeine Einstellungen;
- E-Mail-Konfiguration;
- Benachrichtigungen;
- Aufbewahrungsfristen;
- vertrauenswürdige Kontakte;
- Berechtigungen;
- API-Schlüsselverwaltung;
- Systemdiagnose.

## Finanzansicht

- Snapshots;
- Vermögensverlauf;
- Depotpositionen, sofern Daten importiert wurden;
- Trends;
- Budgetkategorien.

## Angebotsübersicht

- Suchprofile;
- neue Angebote;
- Trefferliste;
- Filter;
- Ranking;
- Favoriten;
- Preisverlauf;
- Datenquelle und Abrufzeit.

## Standort- und Sicherheitsansicht

- Karte;
- Zeitachse;
- letzte bekannte Position und Zeitstempel;
- Synchronisationsstatus;
- Verwaltung der Freigaben;
- großer, deutlich gekennzeichneter manueller SOS-Button;
- Testalarm;
- Protokoll der SOS-Ereignisse;
- Status des Benachrichtigungsversands.

Ein Klick auf SOS darf keine unbemerkte Mehrfachauslösung verursachen. Zeige vor dem Echtversand eine eindeutige Bestätigung, sofern kein ausdrücklich aktivierter, sicher implementierter Schnellalarmmodus konfiguriert wurde.

## Freigabeübersicht

- ausstehende Aktionen;
- Zweck und Auswirkung;
- betroffene Daten;
- anfragender Agent;
- Genehmigen;
- Ablehnen;
- Ablaufdatum;
- Audit-Eintrag.

---

# 11. Gemeinsames Tool-System

Tools werden zentral registriert und durch eine Berechtigungsschicht ausgeführt.

Ein Tool besitzt:

- ID;
- Beschreibung;
- Eingabe- und Ausgabeschema;
- erforderliche Berechtigung;
- erlaubte Agenten;
- Side-Effect-Klasse;
- Audit-Verhalten;
- Timeouts;
- optionalen Freigabebedarf.

Definiere mindestens diese Side-Effect-Klassen:

- `read_only`
- `internal_write`
- `external_write`
- `critical`

Die Berechtigung wird bei jedem Tool-Aufruf serverseitig geprüft. Systemprompts allein sind keine Sicherheitsgrenze.

Tools dürfen nur existierende, registrierte Handler aufrufen. Unbekannte Tool-Namen werden abgelehnt. Argumente werden gegen ihre Schemas validiert.

Ein Agent darf nicht selbst entscheiden, ob eine Aktion eine zusätzliche Freigabe benötigt.

## Sicherer Standardmodus

Bei der ersten Installation gilt:

- automatische externe Schreibaktionen aus;
- direkte Käufe aus;
- direkte Bank- und Brokeraktionen aus;
- echte E-Mail-Zustellung aus;
- echte SOS-Zustellung aus;
- Kalender-Schreibzugriffe aus;
- produktive Shell-Ausführung aus;
- Serveradministration aus;
- unbestätigte externe API-Schreibzugriffe aus.

Internes Speichern von Aufgaben und Ergebnissen sowie normale, authentifizierte Benutzeraktionen dürfen funktionieren.

Implementiere die Freigabemechanik bereits jetzt, aber schalte gefährliche Aktionen nicht automatisch frei.

---

# 12. Datenbank

Erstelle ein sauberes relationales Schema mit Alembic-Migrationen.

Mindestens folgende Bereiche müssen vorhanden sein:

## Core

- users
- sessions beziehungsweise refresh sessions
- api_keys
- agents
- agent_versions
- model_providers
- model_profiles
- tasks
- task_runs
- agent_runs
- events
- notifications
- approvals
- audit_log
- system_settings

## Dateien und Kontext

- documents
- document_versions
- document_chunks
- document_sources
- import_jobs

## Planner

- calendar_items
- routines
- goals
- planning_blocks
- task_dependencies

## Finance

- financial_snapshots
- transactions
- portfolio_positions
- budget_categories
- financial_goals
- agent_reports

## Health

- health_measurements
- health_daily_summaries
- health_import_jobs

## Market

- search_profiles
- listings
- listing_sources
- price_observations
- listing_matches
- saved_listings

## Safety

- registered_devices
- location_samples
- trusted_contacts
- location_shares
- sos_events
- sos_delivery_attempts
- safety_checkins

Ergänze sinnvolle Indizes, eindeutige Constraints, Foreign Keys, Zeitstempel, Statuswerte und Löschregeln.

Alle Tabellen erhalten nur die Felder, die sie fachlich benötigen. Vermeide ein einziges gigantisches JSON-Feld für strukturierte Geschäftsdaten.

Nutze JSONB nur für bewusst flexible, versionierte Daten wie Providerparameter oder unkritische Zusatzmetadaten.

Erstelle eine nachvollziehbare Migrationshistorie. Die Anwendung muss beim Start erkennen können, wenn Migrationen fehlen, und bei entsprechender Konfiguration eine kontrollierte Migration ausführen. Produktive Migrationen dürfen nicht ungefragt durch den Coding-Agenten auf fremden Servern ausgelöst werden.

---

# 13. Authentifizierung und Sicherheit

Implementiere ein konkretes Authentifizierungskonzept für den einzelnen Eigentümer.

Mindestens:

- sicherer Login;
- Passwort-Hashing mit geeignetem Verfahren, falls Passwortauthentifizierung angeboten wird;
- sichere Sessions und Cookies;
- CSRF-Schutz, wo erforderlich;
- Schutz vor Brute Force;
- Rate Limits;
- Berechtigungsprüfung in jedem geschützten Backend-Endpunkt;
- sichere Passwortzurücksetzung oder dokumentierte sichere Initialisierung;
- konfigurierbare MFA beziehungsweise Passkey-Unterstützung, sofern vernünftig implementierbar;
- Rotation und Widerruf interner API-Schlüssel;
- Audit-Logs für sicherheitsrelevante Aktionen.

Lege keine Default-Produktionspasswörter an.

Secrets dürfen nicht in Quellcode, Dockerfiles, Beispieldaten, Logs oder Git-Commits stehen.

Nutze Docker Secrets, Dateimounts mit restriktiven Rechten oder einen geeigneten Secret-Mechanismus. Dokumentiere, welche Variante bei einem einzelnen Linux-Host zum Einsatz kommt.

Verwende eine `.env.example` ausschließlich mit Platzhaltern. Die echte `.env` muss in `.gitignore` stehen.

Das Backend darf keine beliebigen HTTP-URLs des Benutzers abrufen, ohne Schutz vor SSRF und Zugriff auf interne Netzbereiche.

Setze angemessene Upload-Limits, MIME- und Dateitypprüfungen sowie sichere Dateinamen. Behandle Dateiinhalte als nicht vertrauenswürdig.

Externe Inhalte und Prompt Injection müssen bei der Tool-Ausführung berücksichtigt werden. Unvertrauenswürdige Texte dürfen keine Systemprompts, Berechtigungen oder Tool-Registry überschreiben.

---

# 14. Monitoring und Betrieb

Implementiere:

- Health-Endpunkte;
- strukturierte Logs;
- Korrelations-IDs;
- Fehlerzähler;
- Laufzeitmessung für Agenten;
- Status der Worker;
- Status der Queue;
- Status der Provider;
- Hinweise bei nicht verfügbaren Modellservern;
- Überwachung der letzten erfolgreichen Backups;
- sinnvolle Redaktionsregeln.

Optionales Monitoring:

- Prometheus;
- Grafana;
- Loki;
- Uptime Kuma.

Diese Dienste sollen über ein separates Compose-Profil aktivierbar sein und nicht zwingend bei jeder Installation laufen müssen.

Logs dürfen keine Passwörter, API-Schlüssel, Refresh-Tokens, Session-Cookies oder vollständigen Standortverläufe enthalten.

Zeige für jeden Agenten den tatsächlichen Laufzustand. Eine Agentenkarte darf nicht nur deshalb „online“ anzeigen, weil der Container läuft, wenn das Modell oder die erforderliche Integration nicht funktionsfähig ist.

---

# 15. Backups und Wiederherstellung

Implementiere ein dokumentiertes Backup-Konzept.

Es muss berücksichtigen:

- PostgreSQL;
- wichtige Dateien und Anhänge;
- Agentenkonfigurationen;
- notwendige Installations- und Konfigurationsdateien;
- gegebenenfalls Daten der Standortkomponente.

Modellgewichte sollen nicht standardmäßig in jedes Backup aufgenommen werden, weil sie groß sind und erneut bereitgestellt werden können.

Nutze ein verschlüsseltes Backup-Verfahren wie Restic oder eine gleichwertige Lösung. Das Backupziel soll unabhängig vom primären Datenvolume sein.

Implementiere oder dokumentiere:

- konfigurierbare Backupzeiten;
- Status und Fehler;
- Aufbewahrungsfristen;
- Wiederherstellungsverfahren;
- regelmäßige Wiederherstellungstests.

Lege keine echten Backup-Zugangsdaten an. Der Betrieb funktioniert ohne Backup-Zugangsdaten im Demo- oder Testmodus, zeigt dann aber den nicht konfigurierten Status an.

---

# 16. Deployment-Vorbereitung für Linux

Erstelle alle notwendigen Dateien für einen späteren Betrieb auf Ubuntu Server LTS.

Liefern sollst du mindestens:

- Dockerfiles;
- `compose.yaml`;
- zusätzliche Produktionskonfiguration, sofern erforderlich;
- `.env.example`;
- Caddy-Konfiguration;
- interne und externe Netzwerke;
- persistente Volumes;
- Healthchecks;
- Restart-Policies;
- Migrationsmechanismus;
- Secrets-Konzept;
- Backupskript oder entsprechende dokumentierte Integration;
- Installation und Update;
- Restore-Anleitung;
- Diagnose- und Troubleshooting-Anleitung.

Nur der Reverse Proxy darf öffentliche Web-Ports bereitstellen. Das genaue Setup muss öffentlich erreichbare Ports explizit ausweisen.

PostgreSQL, Redis, Ollama und interne Agenten-APIs dürfen standardmäßig nicht direkt öffentlich erreichbar sein.

Konfiguration für Domain, HTTPS, Benutzer, Provider, Datenbank und E-Mail muss extern erfolgen.

Die App soll auch ohne konfigurierte Domain im isolierten Entwicklungs- und Testmodus verwendbar sein. Dokumentiere, wie HTTPS mit einer eigenen Domain für die spätere Installation konfiguriert wird.

Implementiere getrennte Konfigurationen für Entwicklungs-, Test- und Produktionsmodus, damit Debug-Modus und unsichere Testeinstellungen nicht unbemerkt in Produktion gelangen.

Erstelle kein Installationsskript, das ohne Überprüfung Systempakete aktualisiert, Firewallregeln verändert oder laufende Hostdienste überschreibt.

---

# 17. Teststrategie und Qualitätssicherung

Tests sind ein zentraler Bestandteil der Implementierung.

## Unit-Tests

Teste mindestens:

- Berechtigungsprüfung;
- Eingabe- und Ausgabeschemas;
- Agentenregistrierung;
- Orchestrator-Routing;
- Provider-Timeouts und Fehler;
- Task-Statusübergänge;
- Idempotenz;
- Freigabemechanik;
- E-Mail-Absenderprüfung;
- Dateityp- und Größenlimits;
- Ranking und Deduplizierung;
- Standortdatenvalidierung;
- SOS-Zustände und Wiederholungslogik;
- Aufbewahrungs- und Löschregeln.

## Integrationstests

Verwende kontrollierte Testdaten, Provider-Mocks und eine isolierte Testdatenbank.

Teste mindestens:

- Task vom API-Eingang bis zum gespeicherten Ergebnis;
- Modellprovider mit einem Mock;
- Provider nicht erreichbar;
- Redis nicht verfügbar;
- Datenbankfehler;
- Wiederaufnahme verwaister Jobs;
- E-Mail-Import im Testmodus;
- Marktangebot vom Import bis zur Rankingansicht;
- SOS-Auslösung im Dry-Run-Modus;
- Ablehnung einer unzulässigen Aktion;
- unberechtigter API-Zugriff.

Tests dürfen niemals echte externe Nachrichten senden oder echte API-Schreiboperationen durchführen.

## Frontend-Tests

Teste insbesondere:

- Login;
- Anzeige der Agenten;
- Erstellen eines Auftrags;
- Statusaktualisierung;
- Provider-Einstellungen;
- Freigaben;
- Angebotsübersicht;
- Standortansicht;
- SOS-Testmodus.

## Build- und Typprüfungen

Führe, sofern die Entwicklungsumgebung es ermöglicht, die geeigneten Lint-, Typecheck-, Test- und Build-Kommandos aus.

Kennzeichne nicht ausgeführte Prüfungen ausdrücklich. Behaupte niemals, dass ein Test erfolgreich war, wenn er nicht tatsächlich ausgeführt wurde.

---

# 18. Demo-Modus

Die Plattform benötigt einen sicheren Demo-Modus.

Dieser muss ermöglichen:

- Start mit kontrollierten Beispieldaten;
- Anzeige der Agenten;
- Anlage eines Jobs;
- Ausführung über einen Mock-Provider;
- Simulation des Provider-Ausfalls;
- Anzeige von Agentenergebnissen;
- Simulation einer gefundenen Anzeige;
- Demo-Finanzberichte;
- Simulation einer Standortspur;
- SOS-Testablauf ohne echten Versand.

Beispieldaten müssen sichtbar als Demo-Daten gekennzeichnet sein.

Sensible Demo-Daten dürfen nicht wie echte Daten aussehen, ohne als Beispiel identifizierbar zu sein.

Echte externe Provider und Integrationen bleiben deaktiviert, bis der Besitzer sie später konfiguriert.

---

# 19. Repository-Struktur

Wähle eine gut verständliche Monorepo-Struktur in dieser oder einer gleichwertigen Form:

```text
.
├── apps/
│   ├── backend/
│   │   ├── app/
│   │   │   ├── api/
│   │   │   ├── core/
│   │   │   ├── db/
│   │   │   ├── security/
│   │   │   ├── models/
│   │   │   ├── schemas/
│   │   │   ├── services/
│   │   │   ├── agents/
│   │   │   ├── providers/
│   │   │   ├── tools/
│   │   │   ├── integrations/
│   │   │   ├── tasks/
│   │   │   └── main.py
│   │   ├── migrations/
│   │   └── tests/
│   ├── frontend/
│   │   ├── src/
│   │   └── tests/
│   └── android-safety/
│       ├── app/
│       └── README.md
├── workers/
│   ├── core/
│   ├── browser/
│   └── coding/
├── infra/
│   ├── docker/
│   ├── caddy/
│   ├── monitoring/
│   ├── backup/
│   └── scripts/
├── config/
│   ├── agents/
│   └── examples/
├── docs/
│   ├── architecture.md
│   ├── security.md
│   ├── deployment-linux.md
│   ├── configuration.md
│   ├── agents.md
│   ├── model-providers.md
│   ├── email.md
│   ├── database.md
│   ├── backups.md
│   ├── api.md
│   ├── troubleshooting.md
│   └── operations.md
├── compose.yaml
├── compose.production.yaml
├── .env.example
├── .gitignore
├── README.md
└── IMPLEMENTATION_STATUS.md
```

Du darfst die Struktur anpassen, wenn der bestehende Code eine bessere Lösung verlangt. Halte Verantwortlichkeiten jedoch klar getrennt und vermeide zyklische Abhängigkeiten.

Ein eigenes Android-Modul ist für zuverlässige Hintergrund-Standortfunktionen vorgesehen. Versuche nicht, diese Zuverlässigkeit allein mit einer Web-PWA vorzutäuschen.

---

# 20. Konfigurations- und Agentenprofile

Die Agenten sollen soweit sinnvoll über versionierte Definitionen konfiguriert werden, nicht ausschließlich durch fest eingebaute Verzweigungen.

Verwende beispielsweise YAML- oder JSON-Definitionen mit Validierung.

Eine Agentendefinition muss mindestens Name, ID, Zweck, Modellprofil, erlaubte Tools, Berechtigungen, Timeout, Eingabe- und Ausgabeschema und Status enthalten.

Lade die Definitionen beim Start oder über eine kontrollierte Registry. Fehlerhafte Definitionen müssen erkennbar sein und dürfen nicht zu einem unkontrollierten Start führen.

Systemprompts sind Konfiguration, aber keine Berechtigungsgrenze. Alle Berechtigungen werden zusätzlich im Code erzwungen.

---

# 21. Android-Safety-Komponente

Implementiere, soweit die verfügbare Build-Umgebung es erlaubt, eine eigenständige Android-Begleit-App in Kotlin.

Sie soll mindestens vorbereiten:

- Registrierung eines Geräts bei der Plattform;
- sichere Authentifizierung;
- geeignete Standortberechtigungen;
- einen für Hintergrund-Standort ausgelegten Foreground Service;
- konfigurierbares Standortintervall, standardmäßig zehn Minuten;
- lokale, dauerhafte Warteschlange bei fehlender Verbindung;
- spätere Synchronisierung;
- Anzeige der letzten erfolgreichen Synchronisierung;
- manuellen SOS-Button;
- gesicherten Versand von SOS-Ereignissen an die eigene API;
- eine sichere Verwaltung der Gerätebindung;
- Status bei fehlenden Berechtigungen.

Behandle die Grenzen von Android-Hintergrundausführung und Akkusparfunktionen ehrlich. Versprich nicht, dass GPS unter allen Umständen exakt alle zehn Minuten verfügbar ist.

Die App darf keine versteckte Überwachung anderer Personen ermöglichen. Standortaufnahme erfolgt auf dem bewusst registrierten eigenen Gerät.

Die SOS-Funktion soll serverseitig idempotent sein und bei Netzwerkproblemen einen nachvollziehbaren Status liefern.

Echte Benachrichtigungen bleiben deaktiviert, solange der Besitzer den entsprechenden Provider nicht konfiguriert und bewusst aktiviert hat.

Falls keine Android-Build-Umgebung vorhanden ist, erstelle den Quellcode und die Build-Dokumentation, führe aber keinen erfolgreichen Android-Build vor, den du nicht tatsächlich durchführen konntest.

---

# 22. Definition of Done

Die Arbeit ist erst abgeschlossen, wenn die folgenden Kriterien soweit technisch möglich erfüllt und überprüft sind.

## Funktionalität

- Die PWA besitzt die wesentlichen Seiten und eine funktionierende Navigation.
- Das Backend bietet dokumentierte, authentifizierte API-Endpunkte.
- PostgreSQL-Schema und Migrationen sind vorhanden.
- Redis und der Background-Worker sind integriert.
- Das Model Gateway hat eine einheitliche Provider-Schnittstelle.
- Ollama kann über die OpenAI-kompatible API konfiguriert werden.
- OpenAI und generische kompatible Provider sind konfigurierbar.
- Mindestens ein vollständiger Beispiel-Workflow funktioniert mit einem Mock-Provider.
- Die Agenten sind registriert und haben konkrete, testbare Grundfunktionen.
- Aufgaben und Ergebnisse bleiben über einen Neustart hinweg nachvollziehbar.
- Berechtigungsprüfung und Audit-Logs sind integriert.
- E-Mail-Eingang und SOS besitzen einen sicheren Testmodus.
- Agenten können nicht eigenständig unfreigegebene externe Aktionen durchführen.
- Demo-Modus und Demo-Daten sind vorhanden.
- Docker-Compose- und Linux-Deployment-Dateien sind vollständig.
- Konfiguration und Installation sind dokumentiert.

## Qualität

- Keine kritischen Kernfunktionen sind bloße Platzhalter.
- Keine fest codierten Produktionspasswörter.
- Keine API-Schlüssel im Frontend.
- Keine öffentlichen Ports für interne Datenbank-, Redis- oder Ollama-Dienste.
- Keine unbeschränkte Shell-Ausführung durch LLMs.
- Keine ungeschützten Schreibzugriffe im Namen eines Agenten.
- Tests, Linting und Builds sind ausgeführt, soweit die Umgebung das erlaubt, oder eindeutig als noch nicht geprüft dokumentiert.
- Nicht verfügbare externe Integrationen werden sichtbar als unkonfiguriert ausgewiesen.
- Fehlerfälle werden nicht als Erfolg ausgegeben.
- Keine Installation oder Bereitstellung auf dem echten Zielserver wurde vorgenommen.

---

# 23. Verbindlicher Arbeitsablauf

Arbeite direkt im Repository und gehe schrittweise vor.

### Schritt 1 – Bestandsaufnahme

- Liste die vorhandenen relevanten Dateien auf.
- Ermittle die bestehenden Technologien und Konventionen.
- Identifiziere vorhandenen Code, den du wiederverwenden kannst.
- Schreibe eine kurze technische Bestandsaufnahme in `IMPLEMENTATION_STATUS.md`.

Führe keine Deployment-Aktionen aus.

### Schritt 2 – Implementierungsplan

Lege einen konkreten Plan mit Abhängigkeiten und Prüfkriterien an. Dieser Plan ist nur ein Hilfsmittel, keine endgültige Antwort.

Beginne danach direkt mit Schritt 3.

### Schritt 3 – Plattformkern

Implementiere zuerst:

- Backend-Grundstruktur;
- Datenbank;
- Migrationen;
- Authentifizierung;
- Providerabstraktion;
- Agent Registry;
- Orchestrator;
- Queue und Worker;
- Freigabesystem;
- Task- und Run-Protokollierung;
- PWA-Grundstruktur.

### Schritt 4 – Funktionale Agenten

Implementiere anschließend die Agentenlandschaft und die dazugehörigen Datenmodelle, API-Endpunkte, Tests und Oberflächen.

Arbeite entlang der Abhängigkeiten. Priorisiere zunächst vollständig nutzbare Grundfunktionen, ohne Agenten nur als leere Definitionen anzulegen.

### Schritt 5 – Integrationen

Implementiere die konfigurierbaren Adapter, sichere Fehlerbehandlung, Demo-Modus und den Umgang mit fehlenden Credentials.

Verwende Mocks, wenn ein echter externer Dienst nicht verfügbar ist.

### Schritt 6 – Infrastruktur und Dokumentation

Vervollständige Dockerfiles, Compose-Konfigurationen, Reverse-Proxy-Konfiguration, Secret-Handling, Backups, Monitoring und Linux-Installationsdokumentation.

### Schritt 7 – Validierung

Führe die verfügbaren lokalen Tests und Qualitätsprüfungen aus. Korrigiere Fehler, die du selbst beheben kannst.

Verändere keine produktiven Umgebungen.

### Schritt 8 – Abschluss

Aktualisiere `IMPLEMENTATION_STATUS.md` mit:

- den tatsächlich implementierten Funktionen;
- den relevanten Dateien;
- den durchgeführten Tests und ihren tatsächlichen Ergebnissen;
- nicht durchführbaren Tests;
- nicht konfigurierten Integrationen;
- bekannten Einschränkungen;
- einer konkreten Anleitung, wie der Besitzer das System später selbst installieren kann.

Stoppe nicht nach dem Erstellen der Dateien oder des Plans. Arbeite bis zu einem zusammenhängenden, testbaren und dokumentierten Ergebnis.

Falls eine reale externe Integration ohne Credentials oder Freischaltung nicht vollständig geprüft werden kann, implementiere ihre Schnittstelle, Tests mit Mocks und Dokumentation. Behaupte nicht, dass die Integration real funktioniert, solange dies nicht nachgewiesen ist.

Beginne jetzt mit der Bestandsaufnahme des Repositories und setze den Plan anschließend in tatsächlichen Code um.
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
