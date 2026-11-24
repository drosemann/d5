# Discord Chatbot

## Beschreibung
Dieser Bot verwendet die Discord.js-Bibliothek und die Ollama API, um auf Nachrichten in Discord zu reagieren. Er kann auf Erwähnungen reagieren und bietet eine einfache Möglichkeit, mit Benutzern zu interagieren.

## Voraussetzungen
- Node.js (Version 18 oder höher)
- Ein Discord-Bot-Token
- Ollama API-Zugang (OpenAI-kompatibel, z. B. `http://localhost:11434/v1`)

## Installation
1. Klone das Repository:
   ```bash
   git clone <repository-url>
   cd discord-chatbot
   ```

2. Installiere die Abhängigkeiten:
   ```bash
   npm install
   ```

3. Erstelle eine `.env`-Datei im Hauptverzeichnis und füge die folgenden Umgebungsvariablen hinzu:
   ```plaintext
   DISCORD_TOKEN=dein_discord_bot_token
   OLLAMA_API=deine_ollama_api_url
   MODEL=qwen:0.5b
   STATE_PATH=./d5-state.json
   ```

## Bot starten
Um den Bot zu starten, führe den folgenden Befehl aus:
```bash
npm start
```

## Verwendung
- Erwähne den Bot in einem Discord-Kanal, um eine Antwort zu erhalten.
- Der Bot reagiert auf Erwähnungen — oder direkt auf `!d5 …` ohne Erwähnung.
- Alles ohne bekannten Befehl geht an die KI (Ollama), die deine Todos, deinen Feed und das d5-Toolregister als Kontext kennt.

## Super-App-Befehle (`!d5`)
- `!d5 help` — diese Hilfe
- `!d5 tools [Suche]` — lauffähige d5-Tools auflisten (Spiegel von `app/app.js` TOOLS)
- `!d5 find <Suchwort>` — d5-Bibliothek (`app/catalog.json`) durchsuchen
- `!d5 todo add <Text> | list | done <Nr> | clear` — persönliche Todos (liegen in `d5-state.json`)
- `!d5 feed <Text> | feed show` — Mini-Feed, fließt in den KI-Kontext ein
- `!d5 note add <Text> | list | clear` — kurze Notizen
- `!d5 link <URL> | link list` — Kurzlink anlegen (`d5:CODE`, wie der Web-Shortener)
- `!d5 poll <Frage> | <Opt1> | <Opt2>` — Umfrage, Bot hängt die Reaktionen an
- `!d5 remind <Minuten 1-1440> <Text>` — Erinnerung per Reply
- `!d5 stats` — Übersicht (Todos, Notizen, Feed, Erinnerungen, KI-Chats)

## Tests
Nur Stdlib, kein Framework nötig:
```bash
npm test
```
Die Suite (`test/d5bot.test.js`, `node:test`) prüft Befehle, Validierung,
Katalogsuche und State-Roundtrips gegen einen temporären `STATE_PATH`.

## Lizenz
Dieses Projekt ist unter der MIT-Lizenz lizenziert.
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
