// Goose-Port-Spiegel von: projects/startup-business-concepts-hearthrift/src/main/java/com/hearthrift/rewards/RandomEvent.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/startup-business-concepts-hearthrift/src/main/java/com/hearthrift/rewards/RandomEvent.java");
}

// ---- Original-Code (projects/startup-business-concepts-hearthrift/src/main/java/com/hearthrift/rewards/RandomEvent.java), unveraendert, als Inline-Doku ----
// package com.hearthrift.rewards;
//
// import org.bukkit.Material;
// import org.bukkit.enchantments.Enchantment;
// import org.bukkit.inventory.ItemStack;
// import org.bukkit.potion.PotionEffect;
// import org.bukkit.potion.PotionEffectType;
//
// public enum RandomEvent {
//     METEOR_SHOWER(
//         "Meteorschauer",
//         "⚠️ Meteore fallen bei x:0 z:0 vom Himmel! §6Legendäre Ressourcen im 50-Block-Radius!",
//         6000L, // 5 Minuten
//         new ItemStack[]{
//             new ItemStack(Material.NETHERITE_INGOT, 2),
//             new ItemStack(Material.DIAMOND_BLOCK, 3),
//             new ItemStack(Material.ANCIENT_DEBRIS, 5),
//             new ItemStack(Material.ENCHANTED_GOLDEN_APPLE, 2)
//         }
//     ),
//     
//     MONSTER_INVASION(
//         "Endlose Monsterhorde",
//         "⚠️ Eine gewaltige Monsterhorde erscheint bei x:0 z:0! §6Verstärkte Elite-Monster im 50-Block-Radius!",
//         12000L, // 10 Minuten
//         new ItemStack[]{
//             new ItemStack(Material.NETHERITE_SWORD, 1),
//             new ItemStack(Material.ENCHANTED_GOLDEN_APPLE, 5),
//             new ItemStack(Material.TOTEM_OF_UNDYING, 1),
//             new ItemStack(Material.EXPERIENCE_BOTTLE, 32)
//         }
//     ),
//     
//     TREASURE_HUNT(
//         "Schatzkammer der Legenden",
//         "⚠️ Eine mysteriöse Schatzkammer öffnet sich bei x:0 z:0! §6Antike Reichtümer im 50-Block-Radius!",
//         9000L, // 7.5 Minuten
//         new ItemStack[]{
//             new ItemStack(Material.NETHERITE_BLOCK, 1),
//             new ItemStack(Material.DIAMOND_BLOCK, 5),
//             new ItemStack(Material.EMERALD_BLOCK, 10),
//             new ItemStack(Material.ENCHANTED_GOLDEN_APPLE, 3)
//         }
//     ),
//     
//     BLOOD_MOON(
//         "Apokalyptischer Blutmond",
//         "⚠️ Ein Blutmond erscheint über x:0 z:0! §6Tödliche Elite-Bosse mit epischer Beute im 50-Block-Radius!",
//         18000L, // 15 Minuten
//         new ItemStack[]{
//             new ItemStack(Material.NETHERITE_BLOCK, 2),
//             new ItemStack(Material.TOTEM_OF_UNDYING, 2),
//             new ItemStack(Material.ENCHANTED_GOLDEN_APPLE, 5),
//             new ItemStack(Material.BEACON, 1)
//         }
//     ),
//     
//     BOSS_INVASION(
//         "Boss-Invasion",
//         "⚠️ Mächtige Endgame-Bosse erscheinen bei x:0 z:0! §6Epische Kämpfe im 50-Block-Radius!",
//         15000L, // 12.5 Minuten
//         new ItemStack[]{
//             new ItemStack(Material.NETHERITE_BLOCK, 3),
//             new ItemStack(Material.TOTEM_OF_UNDYING, 3),
//             new ItemStack(Material.ENCHANTED_GOLDEN_APPLE, 8),
//             new ItemStack(Material.ELYTRA, 1)
//         }
//     );
//
//     private final String name;
//     private final String description;
//     private final long duration;
//     private final ItemStack[] rewards;
//
//     RandomEvent(String name, String description, long duration, ItemStack[] rewards) {
//         this.name = name;
//         this.description = description;
//         this.duration = duration;
//         this.rewards = rewards;
//     }
//
//     public String getName() {
//         return name;
//     }
//
//     public String getDescription() {
//         return description;
//     }
//
//     public long getDuration() {
//         return duration;
//     }
//
//     public ItemStack[] getRewards() {
//         return rewards.clone();
//     }
// }
