// Goose-Port-Spiegel von: projects/startup-business-concepts-hearthrift/src/main/java/com/hearthrift/rewards/TaskReward.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/startup-business-concepts-hearthrift/src/main/java/com/hearthrift/rewards/TaskReward.java");
}

// ---- Original-Code (projects/startup-business-concepts-hearthrift/src/main/java/com/hearthrift/rewards/TaskReward.java), unveraendert, als Inline-Doku ----
// package com.hearthrift.rewards;
//
// import org.bukkit.Material;
// import org.bukkit.entity.Player;
// import org.bukkit.inventory.ItemStack;
//
// import java.util.HashMap;
// import java.util.Map;
//
// public class TaskReward {
//     private static final Map<String, ItemStack[]> TASK_REWARDS = new HashMap<>();
//
//     static {
//         // Aufgaben-Belohnungen initialisieren
//         TASK_REWARDS.put("first_rift_visit", new ItemStack[]{
//             new ItemStack(Material.IRON_SWORD, 1),
//             new ItemStack(Material.SHIELD, 1),
//             new ItemStack(Material.GOLDEN_APPLE, 3)
//         });
//
//         TASK_REWARDS.put("first_build", new ItemStack[]{
//             new ItemStack(Material.DIAMOND_PICKAXE, 1),
//             new ItemStack(Material.OAK_LOG, 64),
//             new ItemStack(Material.STONE, 64)
//         });
//
//         TASK_REWARDS.put("monster_hunter", new ItemStack[]{
//             new ItemStack(Material.DIAMOND, 2),
//             new ItemStack(Material.EXPERIENCE_BOTTLE, 5),
//             new ItemStack(Material.ENCHANTED_BOOK, 1)
//         });
//
//         TASK_REWARDS.put("farmer", new ItemStack[]{
//             new ItemStack(Material.DIAMOND_HOE, 1),
//             new ItemStack(Material.BONE_MEAL, 64),
//             new ItemStack(Material.WHEAT_SEEDS, 16)
//         });
//
//         TASK_REWARDS.put("explorer", new ItemStack[]{
//             new ItemStack(Material.ELYTRA, 1),
//             new ItemStack(Material.FIREWORK_ROCKET, 64),
//             new ItemStack(Material.COMPASS, 1)
//         });
//     }
//
//     public static void giveReward(Player player, String taskId) {
//         ItemStack[] rewards = TASK_REWARDS.get(taskId);
//         if (rewards == null) {
//             return;
//         }
//
//         for (ItemStack reward : rewards) {
//             if (player.getInventory().firstEmpty() != -1) {
//                 player.getInventory().addItem(reward);
//             } else {
//                 player.getWorld().dropItemNaturally(player.getLocation(), reward);
//             }
//         }
//
//         player.sendMessage("§a§lAufgabe abgeschlossen! Belohnung erhalten!");
//         
//         // Spezielle Nachrichten für bestimmte Aufgaben
//         switch (taskId) {
//             case "first_rift_visit":
//                 player.sendMessage("§5§lDu hast den RIFT zum ersten Mal betreten! Sei vorsichtig!");
//                 break;
//             case "first_build":
//                 player.sendMessage("§6§lDein erstes Gebäude! Möge es der Beginn von vielen sein!");
//                 break;
//             case "monster_hunter":
//                 player.sendMessage("§c§lEin wahrer Monsterjäger! Die Kreaturen der Nacht fürchten dich!");
//                 break;
//             case "farmer":
//                 player.sendMessage("§2§lDeine Farm gedeiht! Möge die Ernte reich sein!");
//                 break;
//             case "explorer":
//                 player.sendMessage("§b§lDie Welt liegt dir zu Füßen! Erkunde sie!");
//                 break;
//         }
//     }
// }
