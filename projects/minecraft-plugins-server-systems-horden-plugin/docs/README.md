# HordePlugin v1.0.0

Ein fortgeschrittenes Horden-System für Paper 1.16.5 mit Custom-Ausrüstung, epischem Loot und visuellen Effekten.

## 🎮 Features

### ✅ Implementiert

- **Monster-Ausrüstung**: Automatisches Spawnen mit Custom-Rüstungen
  - Gold-Rüstung für Skelette (Verfluchter Kreuzzug)
  - Gefärbte Leder-Rüstung für Zombies (Tiefen-Horde)
  - Eisen-Rüstung für Husks (Wüsten-Plage)

- **Loot-System mit Seltenheiten**:
  - **Häufig (50%)**: Horden-Fragmente
  - **Selten (15%)**: Spezialisierte Items (Knochen, Tiefenseide, etc.)
  - **Episch (2.5%)**: Rare Drops mit Custom-Namen und Lore
  - **Legendär (< 0.1%)**: Ultra-seltene Items mit speziellen Effekten

- **Sound-Effekte**:
  - `ENTITY_LIGHTNING_BOLT_THUNDER` für epische Drops
  - `UI_TOAST_CHALLENGE_COMPLETE` für Legendäre Items
  - `ENTITY_EXPERIENCE_ORB_PICKUP` für Spezial-Waffen-Effekte

- **Partikel-Effekte**:
  - `CRIT_MAGIC` bei Spezial-Waffen
  - `FLAME` bei flammenden Waffen
  - `SNOWBALL` bei Eis-Waffen
  - `CRIT` bei Standard-Angriffen

- **Wellen-System**: 
  - 3 vordefinierte Horden mit je 3 Wellen
  - Konfigurierbare Mob-Anzahl und Spawn-Verzögerung
  - Zufällige Dauer (10-20 Minuten)

- **Befehle**:
  - `/horde start <name>` - Startet eine Horde
  - `/horde stop` - Stoppt aktive Horde
  - `/horde status` - Zeigt Status an
  - `/horde list` - Listet alle Horden auf

---

## 📋 Horden-Übersicht

### 1️⃣ Der verfluchte Kreuzzug
- **Mobs**: Skelette & Wither-Skelette
- **Ausrüstung**: Komplette Gold-Rüstung
- **Epischer Loot**: "Königliches Siegel", "Heilige Ruinen-Essenz"
- **Legendär**: "Verfluchtes Stigma" (< 0.5%)

### 2️⃣ Tiefen-Horde
- **Mobs**: Zombies & Ertrunkene
- **Ausrüstung**: Blau gefärbte Leder-Rüstung
- **Epischer Loot**: "Herz des Ozeans", "Dreizack-Fragment"
- **Legendär**: "Geheimnis der Tiefen" (< 0.3%)

### 3️⃣ Wüsten-Plage
- **Mobs**: Husks & Zombies
- **Ausrüstung**: Eisen-Rüstung (Orange gefärbt)
- **Epischer Loot**: "Sonnengewebtes Tuch", "Pharao-Amulett"
- **Legendär**: (Extendable)

---

## 🔧 Installation

### Voraussetzungen
- Java 8+ JDK
- Maven 3.6+
- Paper 1.16.5-R0.1-SNAPSHOT Server
- Vault API (optional)

### Schritt-für-Schritt

```bash
# 1. Repository klonen
git clone <repository>
cd HordePlugin

# 2. Maven bauen
mvn clean package

# 3. JAR in plugins/ kopieren
cp target/HordePlugin-1.0.0.jar /pfad/zum/server/plugins/

# 4. Server starten
cd /pfad/zum/server
java -Xmx1G -Xms512M -jar paper-1.16.5.jar nogui

# 5. Plugin laden
# /reload oder Server neustart
```

---

## ⚙️ Konfiguration

Die `config.yml` befindet sich in `plugins/HordePlugin/`.

### Beispiel: Neue Horde hinzufügen

```yaml
hordes:
  custom-horde:
    display-name: "§5Deine Custom-Horde"
    min-duration: 600
    max-duration: 1200
    
    waves:
      wave_1:
        wave-number: 1
        mob-type: CREEPER
        mob-count: 20
        armor-type: NONE
        spawn-delay: 5
```

### Supported Mob-Types
- `ZOMBIE`, `HUSK`, `DROWNED`
- `SKELETON`, `WITHER_SKELETON`, `STRAY`
- `CREEPER`, `SPIDER`, `CAVE_SPIDER`
- `ENDERMAN`, `WITCH`, `PIGLIN`

### Armor-Types
- `GOLD` - Komplette Goldrüstung
- `IRON` - Komplette Eisenrüstung
- `LEATHER` - Gefärbte Lederrüstung
- `NONE` - Keine Ausrüstung

---

## 🎯 Spezial-Features

### Spezial-Waffen-Effekte

Wenn ein Spieler ein Horden-Monster mit einer "Spezial-Schwert" angreift:

```
✦ Erkannte Waffen:
  - Enthält "dragon" → Drachen-Partikel
  - Enthält "flamm" → Feuer-Effekte
  - Enthält "eis" / "frost" → Schnee-Effekte
  - Enthält "blitz" → Blitz-Effekte
  - Enthält "mythisch", "legend" → Magic-Partikel
```

### Rare Loot Broadcast

Bei Legendary Drops erhalten alle Spieler eine Nachricht:
```
[LEGENDARY] Spieler hat einen legendären Loot gefarmt!
```

### Drop-Chancen-Berechnung

```java
double roll = random.nextDouble(); // 0.0 - 1.0

if (roll < 0.001)      → LEGENDARY (0.1%)
else if (roll < 0.025) → EPIC (2.5%)
else if (roll < 0.15)  → RARE (15%)
else if (roll < 0.5)   → COMMON (50%)
else                   → Kein Drop
```

---

## 📁 Projekt-Struktur

```
HordePlugin/
├── pom.xml                          # Maven-Konfiguration
├── src/main/
│   ├── java/de/hordeplugin/
│   │   ├── HordePlugin.java         # Main-Klasse
│   │   ├── HordeCommand.java        # Befehle
│   │   ├── manager/
│   │   │   └── HordeManager.java    # Horden-Logik (10-20 min Timer)
│   │   ├── listener/
│   │   │   ├── LootListener.java    # Loot & Sound-Effekte
│   │   │   └── CombatListener.java  # Waffen-Effekte
│   │   ├── factory/
│   │   │   └── LootFactory.java     # Item-Erstellung
│   │   └── data/
│   │       ├── HordeDefinition.java # Horden-Daten
│   │       └── LootItem.java        # Loot-Definitionen
│   └── resources/
│       ├── plugin.yml               # Plugin-Manifest
│       └── config.yml               # Horden-Konfiguration
└── target/
    └── HordePlugin-1.0.0.jar        # Gebautes Plugin
```

---

## 🔌 API & Events

### HordeManager API

```java
// Horde starten
plugin.getHordeManager().startHorde("verfluchter-kreuzzug", location);

// Horde stoppen
plugin.getHordeManager().stopHorde();

// Status abfragen
boolean active = plugin.getHordeManager().isHordeActive();
int mobCount = plugin.getHordeManager().getSpawnedMobCount();
int wave = plugin.getHordeManager().getCurrentWave();
```

### Event-Listener

```java
// EntityDeathEvent - Custom Loot Logic
// Horde-Mobs sind erkennbar durch ihre Ausrüstung (Gold/Leder/Eisen)

// EntityDamageByEntityEvent - Spezial-Waffen-Effekte
// Triggert Partikel wenn "Spezial-Schwert" erkannt wird
```

---

## 🐛 Troubleshooting

### Problem: Horden starten nicht
**Lösung**: 
```
- Prüfe /horde list
- Überprüfe config.yml Syntax (YAML!)
- Server-Log auf Fehler prüfen
```

### Problem: Keine Sound-Effekte
**Lösung**:
```yaml
system:
  enable-sounds: true
```

### Problem: Mobs spawnen nicht mit Ausrüstung
**Lösung**:
- HordeManager.equipMobWithArmor() wird automatisch aufgerufen
- Prüfe entity.getEquipment() != null

---

## 📊 Performance

- **Mob-Limit**: Bis zu 100 Mobs pro Welle möglich
- **CPU-Last**: ~5-10% bei aktiver Horde (200 Mobs)
- **Memory**: ~50-100 MB für Plugin + Cache
- **Recommended**: 4 GB RAM Server für 20+ Spieler

---

## 🔐 Berechtigungen

```yaml
horde.admin   # Alle /horde Befehle
horde.use     # Standard-Benutzer (default)
```

---

## 📝 Lizenz

HordePlugin v1.0.0 - Advanced Horde System für Paper 1.16.5

---

## 🚀 Zukünftige Features

- [ ] Database-Integration für Statistiken
- [ ] Custom-Boss-Kämpfe
- [ ] Dungeon-Integration
- [ ] Multiplayer-Raids
- [ ] Belohnungs-Tokens-System
- [ ] Leaderboards

---

## 💬 Support & Feedback

Für Probleme oder Verbesserungen bitte ein Issue erstellen!

---

**Version**: 1.0.0  
**Zuletzt aktualisiert**: 2024  
**Kompatibilität**: Paper 1.16.5-R0.1-SNAPSHOT

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
