// Goose-Port-Spiegel von: projects/minecraft-plugins-server-systems-minecraft-minigame-template/src/main/java/main.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-plugins-server-systems-minecraft-minigame-template/src/main/java/main.java");
}

// ---- Original-Code (projects/minecraft-plugins-server-systems-minecraft-minigame-template/src/main/java/main.java), unveraendert, als Inline-Doku ----
// package com.example.minigame;
//
// import org.bukkit.plugin.java.JavaPlugin;
// import org.bukkit.event.Listener;
// import org.bukkit.event.EventHandler;
// import org.bukkit.event.player.PlayerJoinEvent;
//
// public class Main extends JavaPlugin implements Listener {
//     @Override
//     public void onEnable() {
//         // Registriere den Event-Listener
//         getServer().getPluginManager().registerEvents(this, this);
//         getLogger().info("Minigame Plugin aktiviert!");
//
//         PlayerScore playerScore = new PlayerScore();
//         TeamManager teamManager = new TeamManager();
//
//         getCommand("set").setExecutor(new SetCommand(this));
//         getCommand("lobby").setExecutor(new LobbyCommand());
//         getCommand("startgame").setExecutor(new GameCommands(this, playerScore));
//         getCommand("endgame").setExecutor(new GameCommands(this, playerScore));
//
//         getCommand("createteam").setExecutor(new CustomCommands(teamManager));
//         getCommand("jointeam").setExecutor(new CustomCommands(teamManager));
//         getCommand("teaminfo").setExecutor(new CustomCommands(teamManager));
//
//         new GameLogic(this, playerScore);
//
//         // Register the SpectatorManager
//         new SpectatorManager(this);
//
//         // Register the MapManager
//         new MapManager(this);
//     }
//
//     @Override
//     public void onDisable() {
//         getLogger().info("Minigame Plugin deaktiviert!");
//     }
//
//     @EventHandler
//     public void onPlayerJoin(PlayerJoinEvent event) {
//         event.getPlayer().sendMessage("Willkommen zum Minigame!");
//     }
// }
//
