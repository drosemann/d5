# HordePlugin - Entwickler-Handbuch

Dieses Dokument behandelt das Erweitern und Modifizieren des HordePlugin-Systems.

---

## 🏗️ Architektur

```
┌─────────────────────────────────────────────────┐
│           HordePlugin (Main)                    │
│  ├─ Plugin-Lifecycle                           │
│  ├─ Config-Loading                             │
│  └─ Event-Registration                         │
└─────────────────────────────────────────────────┘
                       ↓
        ┌──────────────┴──────────────┐
        ↓                             ↓
┌──────────────────────┐   ┌──────────────────────┐
│   HordeManager       │   │   LootFactory        │
│                      │   │                      │
│ - startHorde()       │   │ - createLootItem()   │
│ - stopHorde()        │   │ - createEpicItem()   │
│ - startNextWave()    │   │ - createLegendary()  │
│ - spawnMobWith       │   │                      │
│   Equipment()        │   └──────────────────────┘
│ - equipMobWithArmor()│
└──────────────────────┘
        ↓
   Listener Stack
   ├─ LootListener
   │  ├─ onEntityDeath()
   │  └─ Play Sound Effects
   └─ CombatListener
      ├─ onEntityDamageByEntity()
      └─ Play Particle Effects
```

---

## 📝 Custom-Horden erstellen

### Methode 1: YAML-Konfiguration (Einfach)

Bearbeite `config.yml`:

```yaml
hordes:
  shadow-legion:
    display-name: "§8Schatten-Legion"
    min-duration: 600
    max-duration: 1200
    
    waves:
      wave_1:
        wave-number: 1
        mob-type: ENDERMAN
        mob-count: 10
        armor-type: NONE
        spawn-delay: 5
        loot-items:
          - shadow_essence
```

### Methode 2: Programmativ (Fortgeschritten)

```java
// In HordeManager.java
public void createCustomHorde() {
    HordeDefinition customHorde = new HordeDefinition(...);
    hordes.put("custom-horde", customHorde);
}
```

---

## 🎨 Custom-Items erstellen

### Beispiel: Neue Loot-Item

In `LootFactory.java`:

```java
public static ItemStack createMysticArtifact() {
    ItemStack item = new ItemStack(Material.AMETHYST_CLUSTER);
    ItemMeta meta = item.getItemMeta();
    
    if (meta != null) {
        // Custom Name mit Farbe & Style
        meta.setDisplayName("§5§l◆ Mystisches Artefakt ◆§r");
        
        // Multi-line Lore
        List<String> lore = new ArrayList<>();
        lore.add("§7Ein uraltes Artefakt");
        lore.add("§7Kraft: Unbekannt");
        lore.add("§8━━━━━━━━━━━━━");
        lore.add("§5Mythisch");
        meta.setLore(lore);
        
        item.setItemMeta(meta);
    }
    
    return item;
}
```

### Farben-Reference

```
§0 - Schwarz          §8 - Dunkelgrau
§1 - Dunkelblau       §9 - Blau
§2 - Dunkelgrün       §a - Grün
§3 - Dunkelcyan       §b - Cyan
§4 - Dunkelrot        §c - Rot
§5 - Lila             §d - Magenta
§6 - Gold             §e - Gelb
§7 - Hellgrau         §f - Weiß

§l - Fett             §m - Durchgestrichen
§n - Unterstrichen    §o - Kursiv
§r - Reset
```

---

## 🛡️ Custom-Rüstungen

### Leder-Rüstung färben

```java
private ItemStack createColoredLeatherArmor(Color color) {
    ItemStack leather = new ItemStack(Material.LEATHER_HELMET);
    LeatherArmorMeta meta = (LeatherArmorMeta) leather.getItemMeta();
    
    if (meta != null) {
        // RGB-Farbe
        meta.setColor(Color.fromRGB(255, 0, 0)); // Rot
        leather.setItemMeta(meta);
    }
    
    return leather;
}
```

### Beliebte Farben:

```java
Color.AQUA     → Color.fromRGB(0, 255, 255)    // Cyan
Color.RED      → Color.fromRGB(255, 0, 0)      // Rot
Color.YELLOW   → Color.fromRGB(255, 255, 0)    // Gelb
Color.LIME     → Color.fromRGB(0, 255, 0)      // Grün
Color.PURPLE   → Color.fromRGB(128, 0, 128)    // Lila
```

---

## 🔊 Sounds & Partikel

### Sound-Effekte

```java
// Grundstruktur
location.getWorld().playSound(
    location,                    // Wo der Sound abgespielt wird
    Sound.ENTITY_LIGHTNING_BOLT_THUNDER,  // Sound-Typ
    float volume,               // Lautstärke (0.0-2.0)
    float pitch                 // Tonhöhe (0.5-2.0)
);
```

#### Nützliche Sounds

```
ENTITY_LIGHTNING_BOLT_THUNDER  → Donnerschlag
UI_TOAST_CHALLENGE_COMPLETE    → Erfolg-Sound
ENTITY_EXPERIENCE_ORB_PICKUP   → XP-Pickup
ENTITY_ENDERMAN_TELEPORT       → Mystischer Effekt
ENTITY_WITHER_SPAWN            → Unheil-Sound
BLOCK_AMETHYST_BLOCK_BREAK     → Kristall-Break
ENTITY_GENERIC_BURN            → Feuer-Sound
```

### Partikel-Effekte

```java
// Grundstruktur
location.getWorld().spawnParticle(
    Particle.CRIT_MAGIC,       // Partikel-Typ
    location,                   // Wo die Partikel spawnen
    count,                      // Anzahl der Partikel
    offsetX, offsetY, offsetZ,  // Streuung
    speed                       // Geschwindigkeit
);
```

#### Nützliche Partikel

```
CRIT               → Kritischer Treffer (Sterne)
CRIT_MAGIC         → Magische Effekte (Blasen)
FLAME              → Feuer
SNOWBALL           → Schneeflöckchen
CLOUD              → Rauch/Wolken
DRAGON_BREATH      → Drachen-Atem
END_ROD            → Endstab-Effekt
TOTEM              → Totem-Effekt
REDSTONE           → Redstone-Partikel
```

---

## 🎯 Event-Handler erweitern

### Neuer Event-Listener

```java
package de.hordeplugin.listener;

import org.bukkit.event.EventHandler;
import org.bukkit.event.Listener;
import org.bukkit.event.entity.EntityDamageEvent;

public class CustomDamageListener implements Listener {
    
    private final HordePlugin plugin;
    
    public CustomDamageListener(HordePlugin plugin) {
        this.plugin = plugin;
    }
    
    @EventHandler
    public void onEntityDamage(EntityDamageEvent event) {
        // Custom Logik hier
    }
}
```

### In HordePlugin.java registrieren

```java
@Override
public void onEnable() {
    // ... existing code ...
    
    // Neuer Listener
    Bukkit.getPluginManager().registerEvents(
        new CustomDamageListener(this), 
        this
    );
}
```

---

## 📊 Datenstrukturen erweitern

### HordeDefinition ausbauen

Beispiel: Bosses zu Horden hinzufügen

```java
public class HordeDefinition {
    
    private List<BossDefinition> bosses;
    
    // Getter/Setter...
    
    public static class BossDefinition {
        private String name;
        private EntityType bossType;
        private double health;
        private List<String> drops;
        
        // Constructor & Methods...
    }
}
```

---

## 🧪 Testing

### Unit-Test Beispiel

```java
import org.junit.Test;
import static org.junit.Assert.*;

public class LootFactoryTest {
    
    @Test
    public void testCreateLootItem() {
        LootItem item = new LootItem(...);
        ItemStack loot = LootFactory.createLootItem(item);
        
        assertNotNull(loot);
        assertTrue(loot.hasItemMeta());
        assertEquals("§6Test Item§r", 
            loot.getItemMeta().getDisplayName());
    }
}
```

### Integration-Test

```java
public class HordeManagerTest {
    
    @Test
    public void testStartHorde() {
        HordeManager manager = new HordeManager(plugin);
        manager.startHorde("test-horde", location);
        
        assertTrue(manager.isHordeActive());
    }
}
```

---

## 🐛 Debugging

### Logging

```java
// INFO
plugin.getLogger().info("Nachricht: " + var);

// WARNING
plugin.getLogger().warning("Warnung: " + var);

// SEVERE (Fehler)
plugin.getLogger().severe("Fehler: " + var);

// Console Debug
System.out.println("[DEBUG] " + var);
```

### Breakpoints setzen (IDE)

1. Klick auf Zeilennummer
2. Right-Click → "Toggle Breakpoint"
3. Server im Debug-Mode starten:

```bash
mvn compile exec:java@debug
```

---

## 🚀 Performance-Optimierung

### Problem: Zu viele Events

```java
// Schlecht: Alle Events verarbeiten
@EventHandler
public void onPlayerMove(PlayerMoveEvent e) {
    // Teuer!
}

// Besser: Nur relevante Events
@EventHandler
public void onEntityDamageByEntity(EntityDamageByEntityEvent e) {
    if (!(e.getDamager() instanceof Player)) return;
    // Nur Spieler-Schaden
}
```

### Problem: Zu viele Partikel

```java
// Schlecht
for (int i = 0; i < 1000; i++) {
    spawnParticles();
}

// Besser: Mit Scheduler abteilen
Bukkit.getScheduler().scheduleSyncRepeatingTask(plugin, () -> {
    spawnParticles();
}, 0L, 10L); // Alle 0.5 Sekunden
```

---

## 📦 Abhängigkeiten hinzufügen

In `pom.xml`:

```xml
<dependency>
    <groupId>org.example</groupId>
    <artifactId>my-lib</artifactId>
    <version>1.0.0</version>
    <scope>provided</scope>
</dependency>
```

Dann bauen:
```bash
mvn clean package
```

---

## 🔐 Best Practices

### ✅ DO's

- Nutze `Bukkit.getScheduler()` für zeitverzögerte Tasks
- Prüfe auf Null-Werte: `if (entity != null) { ... }`
- Nutze Konstanten für String-Vergleiche
- Registriere Events nur einmal
- Nutze private Methoden für interne Logik

### ❌ DON'Ts

- Keine `Thread.sleep()` auf Main-Thread!
- Keine unendlichen Schleifen im Event-Handler
- Keine direkten Datei-Operationen ohne Scheduler
- Keine statischen Variablen für Spieler-Daten
- Keine Call-Backs ohne Scheduler-Wrapper

---

## 📚 Weitere Ressourcen

- **Paper Docs**: https://paper.readthedocs.io/
- **Bukkit API**: https://hub.spigotmc.org/javadocs/bukkit/
- **Spigot Wiki**: https://www.spigotmc.org/wiki/

---

**Version**: 1.0.0  
**Zuletzt aktualisiert**: 2024

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
