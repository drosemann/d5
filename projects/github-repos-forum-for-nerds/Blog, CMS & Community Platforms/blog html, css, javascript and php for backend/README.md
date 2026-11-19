# 📝 Modern Blog Template

Ein modernes, responsives Blog-Template mit Clean Design und benutzerfreundlicher Oberfläche.

![Blog Preview](preview.png)

## ✨ Live Demo
[Live Demo ansehen](https://ihre-demo-url.com)

## 🎯 Hauptfunktionen

- **📱 Responsive Design**
  - Optimiert für Mobile, Tablet und Desktop
  - Flexible Grid-Layout-Struktur

- **🔍 Such- & Filterfunktionen**
  - Echtzeit-Suchfunktion
  - Kategoriebasierte Filterung
  - Dynamische Beitragsanzeige

- **🎨 Modernes UI/UX**
  - Cleanes, minimalistisches Design
  - Smooth Hover-Effekte
  - Optimierte Lesbarkeit

- **⚡ Performance**
  - Optimierte Ladezeiten
  - Effiziente JavaScript-Implementierung
  - Minimale externe Abhängigkeiten

## 🚀 Schnellstart

### Voraussetzungen
- Ein moderner Webbrowser
- Optional: VS Code mit Live Server Extension

### Installation

1. Repository klonen
```bash
git clone https://github.com/username/modern-blog.git
```

2. Ins Projektverzeichnis wechseln
```bash
cd modern-blog
```

3. `index.html` im Browser öffnen oder Live Server starten

## 📁 Projektstruktur

```
modern-blog/
├── public/              # Öffentlich zugängliche Dateien
│   └── index.html      # Hauptseite
├── src/                # Quellcode
│   ├── css/
│   │   └── style.css   # Styling
│   ├── js/
│   │   └── script.js    # Funktionalität
│   └── php/
│       ├── db.php      # Datenbankverbindung
│       ├── index.php   # PHP-Logik für die Hauptseite
│       └── posts.php    # PHP-Logik für Blogbeiträge
├── images/             # Bildressourcen
├── LICENSE             # MIT Lizenz
└── README.md           # Projektdokumentation
```

## ⚙️ Konfiguration

### Farben anpassen

```css
:root {
    --primary-color: #2c3e50;    /* Hauptfarbe */
    --secondary-color: #3498db;  /* Akzentfarbe */
    --text-color: #333;         /* Textfarbe */
    --background-color: #f5f6fa;  /* Hintergrundfarbe */
    --card-background: #ffffff;    /* Kartenhintergrund */
}
```

### Neue Beiträge hinzufügen

```javascript
const posts = [
    {
        id: 1,
        title: "Beitragstitel",
        excerpt: "Kurzbeschreibung...",
        image: "pfad/zum/bild.jpg",
        date: "2024-03-21",
        category: "Kategorie"
    }
    // Weitere Beiträge hier
];
```

## 📱 Responsive Breakpoints

- Mobile: < 768px
- Tablet: 768px - 1024px
- Desktop: > 1024px

## 🛠️ Technologien

- HTML5
- CSS3 (Flexbox & Grid)
- Vanilla JavaScript
- Keine externen Abhängigkeiten

## 🤝 Mitwirken

Beiträge sind willkommen! Für größere Änderungen erstellen Sie bitte zuerst ein Issue.

1. Fork erstellen
2. Feature Branch erstellen (`git checkout -b feature/NeuesFunktion`)
3. Änderungen committen (`git commit -m 'Neue Funktion hinzugefügt'`)
4. Branch pushen (`git push origin feature/NeuesFunktion`)
5. Pull Request erstellen

## 📄 Lizenz

Dieses Projekt steht unter der MIT-Lizenz - siehe [LICENSE](LICENSE) für Details.

## 👥 Support & Kontakt

Bei Fragen oder Problemen:

- 📧 Email: ihre.email@domain.com
- 🐦 Twitter: [@IhrHandle](https://twitter.com/IhrHandle)
- 💬 GitHub Issues

---

⭐ Wenn Ihnen dieses Projekt gefällt, geben Sie ihm einen Stern auf GitHub!
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
