// Goose-Port-Spiegel von: projects/minecraft-plugins-server-systems-horden-plugin/src/main/java/com/horde/plugin/data/LootItem.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-plugins-server-systems-horden-plugin/src/main/java/com/horde/plugin/data/LootItem.java");
}

// ---- Original-Code (projects/minecraft-plugins-server-systems-horden-plugin/src/main/java/com/horde/plugin/data/LootItem.java), unveraendert, als Inline-Doku ----
// package de.hordeplugin.data;
//
// import org.bukkit.configuration.ConfigurationSection;
//
// /**
//  * LootItem - Definiert ein mögliches Loot-Item mit Chancen und Eigenschaften
//  */
// public class LootItem {
//     
//     private String name;
//     private double dropChance; // 0.0 - 1.0
//     private String displayName;
//     private String color;
//     private String lore;
//     private String sound;
//     private boolean isRare;
//
//     public LootItem(ConfigurationSection section) {
//         this.name = section.getName();
//         this.dropChance = section.getDouble("chance", 0.1);
//         this.displayName = section.getString("display-name", name);
//         this.color = section.getString("color", "§7");
//         this.lore = section.getString("lore", "Ein seltener Fund");
//         this.sound = section.getString("sound", "ENTITY_LIGHTNING_BOLT_THUNDER");
//         this.isRare = this.dropChance < 0.01; // Rare wenn < 1%
//     }
//
//     public String getName() {
//         return name;
//     }
//
//     public double getDropChance() {
//         return dropChance;
//     }
//
//     public String getDisplayName() {
//         return displayName;
//     }
//
//     public String getColor() {
//         return color;
//     }
//
//     public String getLore() {
//         return lore;
//     }
//
//     public String getSound() {
//         return sound;
//     }
//
//     public boolean isRare() {
//         return isRare;
//     }
//
//     public String getFormattedName() {
//         return color + displayName + "§r";
//     }
//
//     public String[] getFormattedLore() {
//         return new String[]{lore, "§8Gefunden von: Horde"};
//     }
// }
//
