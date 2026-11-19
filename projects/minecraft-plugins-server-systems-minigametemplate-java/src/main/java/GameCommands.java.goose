// Goose-Port-Spiegel von: projects/minecraft-plugins-server-systems-minigametemplate-java/src/main/java/GameCommands.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-plugins-server-systems-minigametemplate-java/src/main/java/GameCommands.java");
}

// ---- Original-Code (projects/minecraft-plugins-server-systems-minigametemplate-java/src/main/java/GameCommands.java), unveraendert, als Inline-Doku ----
// package com.example.minigame;
//
// import org.bukkit.command.Command;
// import org.bukkit.command.CommandExecutor;
// import org.bukkit.command.CommandSender;
// import org.bukkit.entity.Player;
//
// public class GameCommands implements CommandExecutor {
//     private final MinigamePlugin plugin;
//     private final PlayerScore playerScore;
//
//     public GameCommands(MinigamePlugin plugin, PlayerScore playerScore) {
//         this.plugin = plugin;
//         this.playerScore = playerScore;
//     }
//
//     @Override
//     public boolean onCommand(CommandSender sender, Command command, String label, String[] args) {
//         if (command.getName().equalsIgnoreCase("startgame")) {
//             if (sender instanceof Player) {
//                 // Logic to start the game
//                 plugin.getLogger().info("Game started!");
//                 return true;
//             }
//         } else if (command.getName().equalsIgnoreCase("endgame")) {
//             if (sender instanceof Player) {
//                 // Logic to end the game
//                 plugin.getLogger().info("Game ended!");
//                 return true;
//             }
//         }
//         return false;
//     }
// } 
