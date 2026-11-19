# KI Assistant

Ein interaktiver KI-Chatbot, der die OpenAI API nutzt, um intelligente Konversationen zu ermöglichen.

## 🌟 Features

- Echtzeit-Chat-Interface
- Integration mit OpenAI GPT-3.5
- Responsive Design
- Markdown-Unterstützung
- Fehlerbehandlung
- Einfache Benutzeroberfläche

## 🛠️ Technologie-Stack

- **Frontend**: HTML, CSS, JavaScript
- **Backend**: Python/Flask
- **KI**: OpenAI API
- **Styling**: Custom CSS mit Variablen

## 📋 Voraussetzungen

- Python 3.10 oder höher
- OpenAI API Key
- Moderne Webbrowser
- pip (Python Package Manager)

## ⚙️ Installation

1. **Repository klonen**
   git clone https://github.com/IhrUsername/ki-assistant.git
   cd ki-assistant

2. **Virtuelle Umgebung erstellen und aktivieren**
   # Windows
   python -m venv venv
   .\venv\Scripts\activate

   # Linux/Mac
   python3 -m venv venv
   source venv/bin/activate

3. **Abhängigkeiten installieren**
   pip install -r requirements.txt

4. **Umgebungsvariablen konfigurieren**
   - Erstellen Sie eine `.env` Datei im Hauptverzeichnis
   - Fügen Sie Ihren OpenAI API Key hinzu:
     OPENAI_API_KEY=your_api_key_here

## 🚀 Verwendung

1. **Server starten**
   python src/app.py

2. **Zugriff auf die Anwendung**
   - Öffnen Sie Ihren Browser
   - Navigieren Sie zu `http://localhost:5000`

## 💡 Beispiel-Interaktion

1. Geben Sie Ihre Frage in das Textfeld ein
2. Klicken Sie auf "Senden" oder drücken Sie Enter
3. Warten Sie auf die KI-Antwort
4. Führen Sie die Konversation fort

## 🔧 Konfiguration

Die Anwendung kann über verschiedene Umgebungsvariablen konfiguriert werden:

- `OPENAI_API_KEY`: Ihr OpenAI API Schlüssel
- `FLASK_ENV`: Entwicklungs- oder Produktionsumgebung
- `FLASK_DEBUG`: Debug-Modus (0 oder 1)

## 📁 Projektstruktur

- `src/`: Hauptverzeichnis der Anwendung
- `src/app.py`: Haupt-App-Datei
- `src/static/`: Statische Dateien (CSS, JavaScript, etc.)
- `src/templates/`: HTML-Templates
- `src/.env`: Umgebungsvariablen
- `src/requirements.txt`: Abhängigkeiten

## 📂 Projektstruktur

- `src/static/`: Statische Dateien (CSS, JavaScript, etc.)
- `src/static/css/`: Custom CSS
- `src/static/js/`: JavaScript
- `src/templates/`: HTML-Templates
- `src/.env`: Umgebungsvariablen
- `src/requirements.txt`: Abhängigkeiten

## 🤝 Beitragen

Beiträge sind willkommen! Bitte folgen Sie diesen Schritten:

1. Fork des Repositories
2. Erstellen Sie einen Feature-Branch (`git checkout -b feature/AmazingFeature`)
3. Commit Ihrer Änderungen (`git commit -m 'Add some AmazingFeature'`)
4. Push zum Branch (`git push origin feature/AmazingFeature`)
5. Öffnen Sie einen Pull Request

## 📝 Lizenz

Dieses Projekt ist unter der MIT-Lizenz lizenziert - siehe die LICENSEDatei für Details.

## 🔮 Zukünftige Features

- [ ] Benutzerauthentifizierung
- [ ] Chat-Verlauf Speicherung
- [ ] Unterstützung für verschiedene KI-Modelle
- [ ] Dateiupload-Funktionalität
- [ ] Spracherkennung
- [ ] Code Highlighting
- [ ] Typing Indikatoren

## ⚠️ Bekannte Probleme

- Keine bekannten Probleme zum jetzigen Zeitpunkt

## 📞 Support

Bei Fragen oder Problemen:
- Öffnen Sie ein Issue
- Kontaktieren Sie uns unter: [Ihre-Email@domain.com]

## 🙏 Danksagungen

- OpenAI für die GPT-3.5 API
- Flask-Team für das großartige Framework
- Alle Mitwirkenden und Unterstützer

---

Entwickelt mit ❤️ von Daniel
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
