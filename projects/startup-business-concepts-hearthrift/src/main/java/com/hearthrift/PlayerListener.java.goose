// Goose-Port-Spiegel von: projects/startup-business-concepts-hearthrift/src/main/java/com/hearthrift/PlayerListener.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/startup-business-concepts-hearthrift/src/main/java/com/hearthrift/PlayerListener.java");
}

// ---- Original-Code (projects/startup-business-concepts-hearthrift/src/main/java/com/hearthrift/PlayerListener.java), unveraendert, als Inline-Doku ----
// package com.hearthrift;
//
// import org.bukkit.World;
// import org.bukkit.entity.Player;
// import org.bukkit.event.EventHandler;
// import org.bukkit.event.Listener;
// import org.bukkit.event.player.PlayerJoinEvent;
// import org.bukkit.event.player.PlayerRespawnEvent;
//
// public class PlayerListener implements Listener {
//     private final Hearthrift plugin;
//     
//     public PlayerListener(Hearthrift plugin) {
//         this.plugin = plugin;
//     }
//     
//     @EventHandler
//     public void onPlayerJoin(PlayerJoinEvent event) {
//         Player player = event.getPlayer();
//         
//         // If player hasn't played before, send them to ENTRY world
//         if (!player.hasPlayedBefore()) {
//             World entryWorld = plugin.getServer().getWorld("ENTRY");
//             if (entryWorld != null) {
//                 player.teleport(entryWorld.getSpawnLocation());
//                 
//                 // Start world generation process
//                 plugin.getWorldManager().createPlayerWorld(player).thenAccept(world -> {
//                     if (world != null) {
//                         player.sendMessage("§aYour personal world is being created!");
//                         // Start the tutorial
//                         plugin.getServer().getScheduler().runTask(plugin, () -> 
//                             plugin.getTutorialManager().startTutorial(player));
//                     }
//                 });
//             }
//         }
//     }
//     
//     @EventHandler
//     public void onPlayerRespawn(PlayerRespawnEvent event) {
//         Player player = event.getPlayer();
//         World deathWorld = player.getWorld();
//         
//         // If player dies in RIFT, send them back to their personal world or ENTRY
//         if (deathWorld.getName().equals("RIFT")) {
//             String personalWorld = plugin.getWorldManager().getPlayerWorldName(player);
//             if (personalWorld != null) {
//                 World world = plugin.getServer().getWorld(personalWorld);
//                 if (world != null) {
//                     event.setRespawnLocation(world.getSpawnLocation());
//                     return;
//                 }
//             }
//             
//             // Fallback to ENTRY world
//             World entryWorld = plugin.getServer().getWorld("ENTRY");
//             if (entryWorld != null) {
//                 event.setRespawnLocation(entryWorld.getSpawnLocation());
//             }
//         }
//     }
// }
