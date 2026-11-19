// Goose-Port-Spiegel von: projects/archive-unsorted-pillars-of-fortune/main/PillarsOfFortune.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/archive-unsorted-pillars-of-fortune/main/PillarsOfFortune.java");
}

// ---- Original-Code (projects/archive-unsorted-pillars-of-fortune/main/PillarsOfFortune.java), unveraendert, als Inline-Doku ----
// package com.yourname.pillarsoffortune;
//
// import org.bukkit.Bukkit;
// import org.bukkit.Material;
// import org.bukkit.Sound;
// import org.bukkit.command.Command;
// import org.bukkit.command.CommandSender;
// import org.bukkit.entity.Player;
// import org.bukkit.inventory.ItemStack;
// import org.bukkit.plugin.java.JavaPlugin;
// import org.bukkit.scheduler.BukkitTask;
//
// import java.util.*;
//
// public class PillarsOfFortune extends JavaPlugin {
//     
//     private Set<UUID> enabledPlayers;
//     private List<Material> availableItems;
//     private BukkitTask fortuneTask;
//     
//     // Configuration values
//     private int itemDropInterval;
//     private int maxItemsPerDrop;
//     private int minItemsPerDrop;
//     private boolean sendTitleMessage;
//     private boolean sendChatMessage;
//     private boolean playSound;
//     private String soundEffect;
//     private List<String> excludedItems;
//     private List<String> includedItems;
//     
//     @Override
//     public void onEnable() {
//         // Initialize sets
//         enabledPlayers = new HashSet<>();
//         
//         // Save default config
//         saveDefaultConfig();
//         
//         // Load configuration
//         loadConfiguration();
//         
//         // Initialize available items
//         initializeAvailableItems();
//         
//         // Start the fortune task
//         startFortuneTask();
//         
//         getLogger().info("Pillars of Fortune has been enabled!");
//         getLogger().info("Available items: " + availableItems.size());
//     }
//     
//     @Override
//     public void onDisable() {
//         // Stop the fortune task
//         if (fortuneTask != null) {
//             fortuneTask.cancel();
//         }
//         
//         getLogger().info("Pillars of Fortune has been disabled!");
//     }
//     
//     private void loadConfiguration() {
//         itemDropInterval = getConfig().getInt("item-drop-interval", 5);
//         maxItemsPerDrop = Math.max(1, Math.min(64, getConfig().getInt("max-items-per-drop", 1)));
//         minItemsPerDrop = Math.max(1, Math.min(maxItemsPerDrop, getConfig().getInt("min-items-per-drop", 1)));
//         sendTitleMessage = getConfig().getBoolean("send-title-message", true);
//         sendChatMessage = getConfig().getBoolean("send-chat-message", true);
//         playSound = getConfig().getBoolean("play-sound", true);
//         soundEffect = getConfig().getString("sound-effect", "ENTITY_EXPERIENCE_ORB_PICKUP");
//         excludedItems = getConfig().getStringList("excluded-items");
//         includedItems = getConfig().getStringList("included-items");
//     }
//     
//     private void initializeAvailableItems() {
//         availableItems = new ArrayList<>();
//         
//         // If included items list is specified, use only those
//         if (!includedItems.isEmpty()) {
//             for (String itemName : includedItems) {
//                 try {
//                     Material material = Material.valueOf(itemName.toUpperCase());
//                     if (material.isItem()) {
//                         availableItems.add(material);
//                     }
//                 } catch (IllegalArgumentException e) {
//                     getLogger().warning("Invalid material in included-items: " + itemName);
//                 }
//             }
//         } else {
//             // Use all materials except excluded ones
//             for (Material material : Material.values()) {
//                 if (material.isItem() && !isExcluded(material)) {
//                     availableItems.add(material);
//                 }
//             }
//         }
//         
//         if (availableItems.isEmpty()) {
//             getLogger().severe("No available items found! Check your configuration.");
//             // Add some basic items as fallback
//             availableItems.addAll(Arrays.asList(
//                 Material.APPLE, Material.BREAD, Material.COOKED_BEEF,
//                 Material.DIAMOND, Material.GOLD_INGOT, Material.IRON_INGOT
//             ));
//         }
//     }
//     
//     private boolean isExcluded(Material material) {
//         if (!getConfig().getBoolean("exclude-dangerous-items", true)) {
//             return excludedItems.contains(material.name());
//         }
//         
//         // Check if in excluded list
//         if (excludedItems.contains(material.name())) {
//             return true;
//         }
//         
//         // Exclude dangerous/admin items
//         String name = material.name();
//         return name.contains("COMMAND") || 
//                name.equals("BEDROCK") || 
//                name.equals("BARRIER") ||
//                name.contains("STRUCTURE") ||
//                name.equals("DEBUG_STICK") ||
//                name.equals("KNOWLEDGE_BOOK") ||
//                name.equals("SPAWNER") ||
//                name.contains("SPAWN_EGG") && name.contains("COMMAND");
//     }
//     
//     private void startFortuneTask() {
//         fortuneTask = Bukkit.getScheduler().runTaskTimer(this, () -> {
//             for (UUID playerId : enabledPlayers) {
//                 Player player = Bukkit.getPlayer(playerId);
//                 if (player != null && player.isOnline()) {
//                     giveRandomItem(player);
//                 }
//             }
//         }, 20L * itemDropInterval, 20L * itemDropInterval);
//     }
//     
//     private void giveRandomItem(Player player) {
//         if (availableItems.isEmpty()) {
//             return;
//         }
//         
//         Random random = new Random();
//         Material randomMaterial = availableItems.get(random.nextInt(availableItems.size()));
//         
//         int amount = minItemsPerDrop;
//         if (maxItemsPerDrop > minItemsPerDrop) {
//             amount = random.nextInt(maxItemsPerDrop - minItemsPerDrop + 1) + minItemsPerDrop;
//         }
//         
//         ItemStack item = new ItemStack(randomMaterial, amount);
//         
//         // Add item to inventory
//         HashMap<Integer, ItemStack> leftover = player.getInventory().addItem(item);
//         
//         // Drop leftover items if inventory is full
//         if (!leftover.isEmpty()) {
//             for (ItemStack leftoverItem : leftover.values()) {
//                 player.getWorld().dropItemNaturally(player.getLocation(), leftoverItem);
//             }
//         }
//         
//         // Send messages and effects
//         String itemName = formatMaterialName(randomMaterial);
//         
//         if (sendChatMessage) {
//             String message = getConfig().getString("messages.item-received", "&a&lFORTUNE! &7You received &e%amount%x %item%");
//             message = message.replace("%amount%", String.valueOf(amount))
//                            .replace("%item%", itemName);
//             player.sendMessage(colorize(message));
//         }
//         
//         if (sendTitleMessage) {
//             String title = getConfig().getString("messages.title-received", "&6&lFORTUNE!");
//             String subtitle = getConfig().getString("messages.subtitle-received", "&7+%amount%x &e%item%");
//             subtitle = subtitle.replace("%amount%", String.valueOf(amount))
//                              .replace("%item%", itemName);
//             player.sendTitle(colorize(title), colorize(subtitle), 10, 40, 10);
//         }
//         
//         if (playSound && !soundEffect.isEmpty()) {
//             try {
//                 Sound sound = Sound.valueOf(soundEffect);
//                 player.playSound(player.getLocation(), sound, 0.7f, 1.0f);
//             } catch (IllegalArgumentException e) {
//                 getLogger().warning("Invalid sound effect: " + soundEffect);
//             }
//         }
//     }
//     
//     private String formatMaterialName(Material material) {
//         String name = material.name().toLowerCase().replace('_', ' ');
//         String[] words = name.split(" ");
//         StringBuilder formatted = new StringBuilder();
//         
//         for (String word : words) {
//             if (formatted.length() > 0) {
//                 formatted.append(" ");
//             }
//             formatted.append(word.substring(0, 1).toUpperCase())
//                     .append(word.substring(1));
//         }
//         
//         return formatted.toString();
//     }
//     
//     private String colorize(String message) {
//         return message.replace("&", "§");
//     }
//     
//     @Override
//     public boolean onCommand(CommandSender sender, Command command, String label, String[] args) {
//         if (!(sender instanceof Player)) {
//             sender.sendMessage("This command can only be used by players!");
//             return true;
//         }
//         
//         Player player = (Player) sender;
//         
//         if (command.getName().equalsIgnoreCase("fortune")) {
//             if (args.length == 0 || args[0].equalsIgnoreCase("toggle")) {
//                 toggleFortune(player);
//                 return true;
//             }
//         }
//         
//         return false;
//     }
//     
//     private void toggleFortune(Player player) {
//         UUID playerId = player.getUniqueId();
//         
//         if (enabledPlayers.contains(playerId)) {
//             enabledPlayers.remove(playerId);
//             String message = getConfig().getString("messages.fortune-disabled", "&c&lPillars of Fortune &7has been &cdisabled&7!");
//             player.sendMessage(colorize(message));
//         } else {
//             enabledPlayers.add(playerId);
//             String message = getConfig().getString("messages.fortune-enabled", "&a&lPillars of Fortune &7has been &aenabled&7!");
//             player.sendMessage(colorize(message));
//         }
//     }
//     
//     public void reloadConfiguration() {
//         reloadConfig();
//         loadConfiguration();
//         initializeAvailableItems();
//         
//         // Restart the fortune task with new interval
//         if (fortuneTask != null) {
//             fortuneTask.cancel();
//         }
//         startFortuneTask();
//     }
// }
