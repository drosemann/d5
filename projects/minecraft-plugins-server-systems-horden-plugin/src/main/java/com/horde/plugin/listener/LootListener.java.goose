// Goose-Port-Spiegel von: projects/minecraft-plugins-server-systems-horden-plugin/src/main/java/com/horde/plugin/listener/LootListener.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-plugins-server-systems-horden-plugin/src/main/java/com/horde/plugin/listener/LootListener.java");
}

// ---- Original-Code (projects/minecraft-plugins-server-systems-horden-plugin/src/main/java/com/horde/plugin/listener/LootListener.java), unveraendert, als Inline-Doku ----
// package de.hordeplugin.listener;
//
// import org.bukkit.event.EventHandler;
// import org.bukkit.event.Listener;
// import org.bukkit.event.entity.EntityDeathEvent;
// import org.bukkit.entity.LivingEntity;
// import org.bukkit.entity.Player;
// import org.bukkit.inventory.ItemStack;
// import org.bukkit.Sound;
// import org.bukkit.Particle;
// import org.bukkit.ChatColor;
// import java.util.Random;
//
// import de.hordeplugin.HordePlugin;
// import de.hordeplugin.factory.LootFactory;
// import de.hordeplugin.manager.HordeManager;
//
// /**
//  * LootListener - Verarbeitet Loot-Drops mit Custom-Namen und Sound-Effekten
//  */
// public class LootListener implements Listener {
//
//     private final HordePlugin plugin;
//     private final Random random = new Random();
//
//     public LootListener(HordePlugin plugin) {
//         this.plugin = plugin;
//     }
//
//     /**
//      * Verarbeitet den Tod eines Mobs und droppt Custom-Loot
//      */
//     @EventHandler
//     public void onEntityDeath(EntityDeathEvent event) {
//         LivingEntity entity = event.getEntity();
//         
//         // Prüfe ob Mob von Horde ist (durch Ausrüstung erkennbar)
//         if (!isHordeMob(entity)) {
//             return;
//         }
//
//         // Horde-Mob erkannt
//         event.getDrops().clear();
//         event.setDroppedExp(10 + random.nextInt(15)); // 10-25 XP
//
//         Player killer = entity.getKiller();
//
//         // Drop-Logik basierend auf Seltenheit
//         double commonChance = 0.5; // 50% - Häufiger Loot
//         double rareChance = 0.15; // 15% - Rarer Loot
//         double epicChance = 0.025; // 2.5% - Epischer Loot
//         double legendaryChance = 0.001; // 0.1% - Legendär
//
//         double roll = random.nextDouble();
//
//         ItemStack lootDrop = null;
//         String hordeType = "default";
//
//         if (killer != null) {
//             hordeType = detectHordeType(entity);
//         }
//
//         // Bestimme Loot-Typ
//         if (roll < legendaryChance) {
//             lootDrop = LootFactory.createLegendaryItem(
//                 "§6Krona des Horden-Königs",
//                 "§7Das Siegel der ultimativen Macht"
//             );
//             playRareDropSound(event, 3.0f); // Laut!
//             broadcastRareLoot(killer, "§c§l[LEGENDARY] " + killer.getName() + 
//                 " hat einen legendären Loot gefarmt!", "§6Krona des Horden-Königs");
//
//         } else if (roll < epicChance) {
//             lootDrop = createSpecializedEpicLoot(hordeType);
//             playRareDropSound(event, 2.0f);
//             if (killer != null) {
//                 killer.sendMessage(ChatColor.LIGHT_PURPLE + "✦ EPISCHER LOOT GEFUNDEN! ✦");
//             }
//
//         } else if (roll < rareChance) {
//             lootDrop = createSpecializedRareLoot(hordeType);
//             playRareDropSound(event, 1.5f);
//             if (killer != null) {
//                 killer.sendMessage(ChatColor.GOLD + "★ Seltener Loot gefunden!");
//             }
//
//         } else if (roll < commonChance) {
//             lootDrop = LootFactory.createCommonHordeLoot();
//             // Kein Sound für häufigen Loot
//         }
//
//         // Droppe Item
//         if (lootDrop != null) {
//             event.getDrops().add(lootDrop);
//         }
//
//         // Statistiken
//         if (killer != null) {
//             plugin.getHordeManager().reduceMobCount();
//         }
//     }
//
//     /**
//      * Erstellt spezialisiertes Epic-Loot basierend auf Horden-Typ
//      */
//     private ItemStack createSpecializedEpicLoot(String hordeType) {
//         switch (hordeType.toLowerCase()) {
//             case "skelett":
//                 return LootFactory.createEpicItem(
//                     "Königliches Siegel", "§6",
//                     "§7Das Siegel eines längst verstorbenen Königs"
//                 );
//             case "zombie":
//                 return LootFactory.createEpicItem(
//                     "Herz des Ozeans (Fragment)", "§b",
//                     "§7Ein mystisches Artefakt aus der Tiefe"
//                 );
//             case "husk":
//                 return LootFactory.createEpicItem(
//                     "Sonnengewebtes Tuch", "§e",
//                     "§7Glüht in der Sonne"
//                 );
//             default:
//                 return LootFactory.createCommonHordeLoot();
//         }
//     }
//
//     /**
//      * Erstellt spezialisiertes Rare-Loot basierend auf Horden-Typ
//      */
//     private ItemStack createSpecializedRareLoot(String hordeType) {
//         switch (hordeType.toLowerCase()) {
//             case "skelett":
//                 return LootFactory.createEpicItem(
//                     "Knochen des Kriegers", "§8",
//                     "§7Verstärkte Skelett-Knochen"
//                 );
//             case "zombie":
//                 return LootFactory.createEpicItem(
//                     "Tiefenseide", "§9",
//                     "§7Stoff aus den Tiefen"
//                 );
//             case "husk":
//                 return LootFactory.createEpicItem(
//                     "Wüsten-Kristall", "§6",
//                     "§7Ein funkelnder Kristall"
//                 );
//             default:
//                 return LootFactory.createCommonHordeLoot();
//         }
//     }
//
//     /**
//      * Erkennt den Horden-Typ anhand der Ausrüstung
//      */
//     private String detectHordeType(LivingEntity entity) {
//         if (entity.getEquipment() == null) {
//             return "default";
//         }
//
//         ItemStack helmet = entity.getEquipment().getHelmet();
//         if (helmet == null) {
//             return "default";
//         }
//
//         // Gold-Rüstung = Skelett (Verfluchter Kreuzzug)
//         if (helmet.getType().toString().contains("GOLDEN")) {
//             return "skelett";
//         }
//         // Leder-Rüstung = Zombie (Tiefen-Horde)
//         else if (helmet.getType().toString().contains("LEATHER")) {
//             return "zombie";
//         }
//         // Eisen-Rüstung = Husk (Wüsten-Plage)
//         else if (helmet.getType().toString().contains("IRON")) {
//             return "husk";
//         }
//
//         return "default";
//     }
//
//     /**
//      * Prüfe ob der Mob von der Horde ist
//      */
//     private boolean isHordeMob(LivingEntity entity) {
//         // Horde-Mobs sind eindeutig durch ihre spezielle Ausrüstung erkennbar
//         if (entity.getEquipment() == null) {
//             return false;
//         }
//
//         ItemStack helmet = entity.getEquipment().getHelmet();
//         if (helmet == null || helmet.getType() == org.bukkit.Material.AIR) {
//             return false;
//         }
//
//         // Custom-Rüstung (Gold, Leder, Eisen) = Horde-Mob
//         String helmetType = helmet.getType().toString();
//         return helmetType.contains("GOLDEN") || 
//                helmetType.contains("LEATHER") || 
//                helmetType.contains("IRON");
//     }
//
//     /**
//      * Spielt einen Sound-Effekt bei seltenen Drops ab
//      */
//     private void playRareDropSound(EntityDeathEvent event, float pitch) {
//         if (event.getEntity().getLocation().getWorld() == null) {
//             return;
//         }
//
//         // Benutze einen eindeutigen Sound für rare Drops
//         event.getEntity().getLocation().getWorld().playSound(
//             event.getEntity().getLocation(),
//             Sound.ENTITY_LIGHTNING_BOLT_THUNDER,
//             2.0f, // Lautstärke
//             pitch
//         );
//
//         // Zusätzlicher Sound für Epic/Legendary
//         if (pitch >= 2.0f) {
//             event.getEntity().getLocation().getWorld().playSound(
//                 event.getEntity().getLocation(),
//                 Sound.UI_TOAST_CHALLENGE_COMPLETE,
//                 1.5f,
//                 1.2f
//             );
//         }
//     }
//
//     /**
//      * Broadcast eines seltenen Loots
//      */
//     private void broadcastRareLoot(Player player, String message, String itemName) {
//         if (player != null) {
//             org.bukkit.Bukkit.broadcastMessage(message);
//         }
//     }
//
//     /**
//      * Partikel-Effekt für rare Drops
//      */
//     private void spawnRareLootParticles(EntityDeathEvent event) {
//         event.getEntity().getLocation().getWorld().spawnParticle(
//             Particle.CRIT_MAGIC,
//             event.getEntity().getLocation(),
//             20,
//             1.0, 1.0, 1.0,
//             0.1
//         );
//     }
// }
//
