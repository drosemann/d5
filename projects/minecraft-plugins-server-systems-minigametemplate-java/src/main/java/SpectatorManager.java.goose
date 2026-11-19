// Goose-Port-Spiegel von: projects/minecraft-plugins-server-systems-minigametemplate-java/src/main/java/SpectatorManager.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-plugins-server-systems-minigametemplate-java/src/main/java/SpectatorManager.java");
}

// ---- Original-Code (projects/minecraft-plugins-server-systems-minigametemplate-java/src/main/java/SpectatorManager.java), unveraendert, als Inline-Doku ----
// package com.example.minigame;
//
// import org.bukkit.Bukkit;
// import org.bukkit.entity.Player;
// import org.bukkit.event.EventHandler;
// import org.bukkit.event.Listener;
// import org.bukkit.event.player.PlayerDeathEvent;
// import org.bukkit.event.player.PlayerRespawnEvent;
// import org.bukkit.plugin.java.JavaPlugin;
//
// public class SpectatorManager implements Listener {
//     private final JavaPlugin plugin;
//
//     public SpectatorManager(JavaPlugin plugin) {
//         this.plugin = plugin;
//         Bukkit.getPluginManager().registerEvents(this, plugin);
//     }
//
//     @EventHandler
//     public void onPlayerDeath(PlayerDeathEvent event) {
//         Player player = event.getEntity();
//         // Set the player to spectator mode
//         player.setSpectator(true);
//         player.sendMessage("You are now in spectator mode!");
//     }
//
//     @EventHandler
//     public void onPlayerRespawn(PlayerRespawnEvent event) {
//         Player player = event.getPlayer();
//         // Optionally, you can handle respawning logic here
//         // For example, teleporting the player back to a spawn point
//         player.setSpectator(false); // Set back to normal mode if needed
//     }
// } 
