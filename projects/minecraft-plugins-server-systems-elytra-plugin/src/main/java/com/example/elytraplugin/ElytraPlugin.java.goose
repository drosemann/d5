// Goose-Port-Spiegel von: projects/minecraft-plugins-server-systems-elytra-plugin/src/main/java/com/example/elytraplugin/ElytraPlugin.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-plugins-server-systems-elytra-plugin/src/main/java/com/example/elytraplugin/ElytraPlugin.java");
}

// ---- Original-Code (projects/minecraft-plugins-server-systems-elytra-plugin/src/main/java/com/example/elytraplugin/ElytraPlugin.java), unveraendert, als Inline-Doku ----
// package com.example.elytraplugin;
//
// import org.bukkit.Bukkit;
// import org.bukkit.ChatColor;
// import org.bukkit.Material;
// import org.bukkit.NamespacedKey;
// import org.bukkit.entity.Player;
// import org.bukkit.event.EventHandler;
// import org.bukkit.event.Listener;
// import org.bukkit.event.player.PlayerJoinEvent;
// import org.bukkit.event.player.PlayerMoveEvent;
// import org.bukkit.event.player.PlayerRespawnEvent;
// import org.bukkit.inventory.ItemStack;
// import org.bukkit.inventory.PlayerInventory;
// import org.bukkit.inventory.meta.ItemMeta;
// import org.bukkit.persistence.PersistentDataType;
// import org.bukkit.plugin.java.JavaPlugin;
// import org.bukkit.scheduler.BukkitTask;
//
// import java.util.HashMap;
// import java.util.Map;
// import java.util.UUID;
//
// public class ElytraPlugin extends JavaPlugin implements Listener {
//     private NamespacedKey elytraKey;
//     private final Map<UUID, BukkitTask> timerTasks = new HashMap<>();
//
//     @Override
//     public void onEnable() {
//         elytraKey = new NamespacedKey(this, "ephemeral-elytra");
//         Bukkit.getPluginManager().registerEvents(this, this);
//     }
//
//     @EventHandler
//     public void onPlayerJoin(PlayerJoinEvent event) {
//         Player player = event.getPlayer();
//         if (!player.hasPlayedBefore()) {
//             giveElytra(player);
//         }
//     }
//
//     @EventHandler
//     public void onPlayerRespawn(PlayerRespawnEvent event) {
//         giveElytra(event.getPlayer());
//     }
//
//     @EventHandler
//     public void onPlayerMove(PlayerMoveEvent event) {
//         // Empty - we don't need movement checks anymore
//     }
//
//     private void giveElytra(Player player) {
//         // Check for free hotbar slot (slots 0-8)
//         PlayerInventory inv = player.getInventory();
//         int freeSlot = -1;
//         
//         for (int i = 0; i < 9; i++) {
//             if (inv.getItem(i) == null) {
//                 freeSlot = i;
//                 break;
//             }
//         }
//         
//         if (freeSlot == -1) {
//             player.sendMessage(ChatColor.RED + "In deiner Hotbar ist kein freier Slot!");
//             return;
//         }
//         
//         ItemStack elytra = createElytra();
//         inv.setItem(freeSlot, elytra);
//         startElytraTimer(player);
//     }
//
//     private void startElytraTimer(Player player) {
//         cancelExistingTimer(player);
//
//         BukkitTask task = Bukkit.getScheduler().runTaskTimer(this, new Runnable() {
//             int timeLeft = 30;
//
//             @Override
//             public void run() {
//                 if (timeLeft <= 0) {
//                     removeAllPluginElytra(player);
//                     cancelExistingTimer(player);
//                     return;
//                 }
//
//                 if (timeLeft <= 3 || timeLeft % 5 == 0) {
//                     player.sendMessage(ChatColor.YELLOW + "Elytra verschwindet in " + timeLeft + " Sekunden!");
//                 }
//
//                 timeLeft--;
//             }
//         }, 0L, 20L);
//
//         timerTasks.put(player.getUniqueId(), task);
//     }
//
//     private void removeAllPluginElytra(Player player) {
//         PlayerInventory inv = player.getInventory();
//         
//         // Check main hand
//         if (isPluginElytra(inv.getItemInMainHand())) {
//             inv.setItemInMainHand(null);
//         }
//         
//         // Check chestplate
//         if (isPluginElytra(inv.getChestplate())) {
//             inv.setChestplate(null);
//         }
//         
//         // Check offhand
//         if (isPluginElytra(inv.getItemInOffHand())) {
//             inv.setItemInOffHand(null);
//         }
//         
//         // Check entire inventory
//         for (int i = 0; i < inv.getSize(); i++) {
//             if (isPluginElytra(inv.getItem(i))) {
//                 inv.setItem(i, null);
//             }
//         }
//     }
//
//     private void removePluginElytra(Player player) {
//         PlayerInventory inv = player.getInventory();
//         ItemStack mainHand = inv.getItemInMainHand();
//         
//         if (isPluginElytra(mainHand)) {
//             inv.setItemInMainHand(null);
//         }
//     }
//
//     private void cancelExistingTimer(Player player) {
//         BukkitTask existingTask = timerTasks.remove(player.getUniqueId());
//         if (existingTask != null) {
//             existingTask.cancel();
//         }
//     }
//
//     private ItemStack createElytra() {
//         ItemStack elytra = new ItemStack(Material.ELYTRA);
//         ItemMeta meta = elytra.getItemMeta();
//         meta.setDisplayName(ChatColor.RED + "" + ChatColor.BOLD + "Temporäre " + ChatColor.WHITE + ChatColor.BOLD + "Elytra");
//         meta.getPersistentDataContainer().set(elytraKey, PersistentDataType.BYTE, (byte) 1);
//         elytra.setItemMeta(meta);
//         return elytra;
//     }
//
//     private boolean isPluginElytra(ItemStack item) {
//         if (item == null || item.getType() != Material.ELYTRA) return false;
//         ItemMeta meta = item.getItemMeta();
//         return meta != null && meta.getPersistentDataContainer().has(elytraKey, PersistentDataType.BYTE);
//     }
//
//     @Override
//     public void onDisable() {
//         for (BukkitTask task : timerTasks.values()) {
//             task.cancel();
//         }
//         timerTasks.clear();
//     }
// } 
