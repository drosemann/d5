// Goose-Port-Spiegel von: projects/minecraft-plugins-&-server-systems-tnt-remover/main/tntprevention/TNTPreventionPlugin.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-plugins-&-server-systems-tnt-remover/main/tntprevention/TNTPreventionPlugin.java");
}

// ---- Original-Code (projects/minecraft-plugins-&-server-systems-tnt-remover/main/tntprevention/TNTPreventionPlugin.java), unveraendert, als Inline-Doku ----
// package com.example.tntprevention;
//
// import org.bukkit.Material;
// import org.bukkit.entity.EntityType;
// import org.bukkit.entity.Player;
// import org.bukkit.entity.TNTPrimed;
// import org.bukkit.event.EventHandler;
// import org.bukkit.event.EventPriority;
// import org.bukkit.event.Listener;
// import org.bukkit.event.block.BlockIgniteEvent;
// import org.bukkit.event.entity.EntityExplodeEvent;
// import org.bukkit.event.entity.EntitySpawnEvent;
// import org.bukkit.event.player.PlayerInteractEvent;
// import org.bukkit.plugin.java.JavaPlugin;
// import org.bukkit.scheduler.BukkitRunnable;
// import net.kyori.adventure.text.Component;
// import net.kyori.adventure.text.format.NamedTextColor;
//
// /**
//  * TNT Prevention Plugin for Minecraft Paper 1.21.5
//  * 
//  * This plugin prevents TNT from being ignited through any method and removes
//  * any primed TNT entities that may spawn. It handles multiple event types
//  * to ensure comprehensive TNT prevention.
//  */
// public class TNTPreventionPlugin extends JavaPlugin implements Listener {
//     
//     private static final String TNT_DISABLED_MESSAGE = "TNT ignition is disabled on this server!";
//     
//     @Override
//     public void onEnable() {
//         // Register event listeners
//         getServer().getPluginManager().registerEvents(this, this);
//         
//         // Start periodic cleanup task for any primed TNT that might slip through
//         startPrimedTNTCleanupTask();
//         
//         getLogger().info("TNT Prevention Plugin has been enabled!");
//         getLogger().info("All TNT ignition methods are now blocked.");
//     }
//     
//     @Override
//     public void onDisable() {
//         getLogger().info("TNT Prevention Plugin has been disabled!");
//     }
//     
//     /**
//      * Prevents TNT blocks from being ignited by fire, lava, or other ignition sources
//      * This covers ignition by fire spread, lava contact, and other environmental causes
//      */
//     @EventHandler(priority = EventPriority.HIGHEST, ignoreCancelled = true)
//     public void onBlockIgnite(BlockIgniteEvent event) {
//         // Check if the block being ignited is TNT
//         if (event.getBlock().getType() == Material.TNT) {
//             event.setCancelled(true);
//             
//             // Notify the player if there is one responsible for the ignition
//             Player player = event.getPlayer();
//             if (player != null) {
//                 sendTNTDisabledMessage(player);
//             }
//             
//             getLogger().info("Prevented TNT ignition at " + 
//                 event.getBlock().getLocation().toString() + 
//                 " (Cause: " + event.getCause().toString() + ")");
//         }
//     }
//     
//     /**
//      * Prevents players from igniting TNT with flint and steel or fire charges
//      * Also handles other player interactions that could ignite TNT
//      */
//     @EventHandler(priority = EventPriority.HIGHEST, ignoreCancelled = true)
//     public void onPlayerInteract(PlayerInteractEvent event) {
//         // Check if player is trying to ignite TNT with flint and steel or fire charge
//         if (event.getClickedBlock() != null && 
//             event.getClickedBlock().getType() == Material.TNT) {
//             
//             Material itemInHand = event.getItem() != null ? event.getItem().getType() : Material.AIR;
//             
//             // Check for ignition items
//             if (itemInHand == Material.FLINT_AND_STEEL || 
//                 itemInHand == Material.FIRE_CHARGE) {
//                 
//                 event.setCancelled(true);
//                 sendTNTDisabledMessage(event.getPlayer());
//                 
//                 getLogger().info("Prevented player " + event.getPlayer().getName() + 
//                     " from igniting TNT with " + itemInHand.toString());
//             }
//         }
//     }
//     
//     /**
//      * Prevents TNT from being ignited by other explosions
//      * This handles chain reactions where one explosion could ignite nearby TNT
//      */
//     @EventHandler(priority = EventPriority.HIGHEST, ignoreCancelled = true)
//     public void onEntityExplode(EntityExplodeEvent event) {
//         // Check each block in the explosion for TNT and remove it from the list
//         event.blockList().removeIf(block -> {
//             if (block.getType() == Material.TNT) {
//                 getLogger().info("Prevented TNT at " + block.getLocation().toString() + 
//                     " from being ignited by explosion from " + event.getEntity().getType());
//                 return true; // Remove TNT blocks from explosion effect
//             }
//             return false;
//         });
//     }
//     
//     /**
//      * Immediately removes any primed TNT entities that spawn
//      * This is the final safety net to catch any primed TNT that might spawn through other means
//      */
//     @EventHandler(priority = EventPriority.HIGHEST, ignoreCancelled = true)
//     public void onEntitySpawn(EntitySpawnEvent event) {
//         // Check if the spawning entity is primed TNT
//         if (event.getEntity().getType() == EntityType.TNT) {
//             TNTPrimed primedTNT = (TNTPrimed) event.getEntity();
//             
//             // Cancel the spawn event
//             event.setCancelled(true);
//             
//             // Get the player who might have caused this (if any)
//             Player sourcePlayer = primedTNT.getSource() instanceof Player ? 
//                 (Player) primedTNT.getSource() : null;
//             
//             if (sourcePlayer != null) {
//                 sendTNTDisabledMessage(sourcePlayer);
//             }
//             
//             getLogger().info("Prevented primed TNT from spawning at " + 
//                 event.getLocation().toString());
//         }
//     }
//     
//     /**
//      * Periodic cleanup task that runs every 5 ticks (0.25 seconds) to remove
//      * any primed TNT entities that might have spawned through other means
//      */
//     private void startPrimedTNTCleanupTask() {
//         new BukkitRunnable() {
//             @Override
//             public void run() {
//                 // Check all worlds for primed TNT entities
//                 getServer().getWorlds().forEach(world -> {
//                     world.getEntitiesByClass(TNTPrimed.class).forEach(primedTNT -> {
//                         // Remove the primed TNT entity
//                         primedTNT.remove();
//                         
//                         // Notify if there's a source player
//                         if (primedTNT.getSource() instanceof Player) {
//                             Player sourcePlayer = (Player) primedTNT.getSource();
//                             sendTNTDisabledMessage(sourcePlayer);
//                         }
//                         
//                         getLogger().info("Removed primed TNT entity at " + 
//                             primedTNT.getLocation().toString() + " during cleanup");
//                     });
//                 });
//             }
//         }.runTaskTimer(this, 0L, 5L); // Run immediately, then every 5 ticks
//     }
//     
//     /**
//      * Sends a formatted message to the player informing them that TNT is disabled
//      * Uses the modern Adventure API for better text formatting
//      * 
//      * @param player The player to send the message to
//      */
//     private void sendTNTDisabledMessage(Player player) {
//         Component message = Component.text(TNT_DISABLED_MESSAGE)
//             .color(NamedTextColor.RED);
//         player.sendMessage(message);
//     }
// }
