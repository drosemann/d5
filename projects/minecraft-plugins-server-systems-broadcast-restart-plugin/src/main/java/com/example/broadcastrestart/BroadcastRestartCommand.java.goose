// Goose-Port-Spiegel von: projects/minecraft-plugins-server-systems-broadcast-restart-plugin/src/main/java/com/example/broadcastrestart/BroadcastRestartCommand.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-plugins-server-systems-broadcast-restart-plugin/src/main/java/com/example/broadcastrestart/BroadcastRestartCommand.java");
}

// ---- Original-Code (projects/minecraft-plugins-server-systems-broadcast-restart-plugin/src/main/java/com/example/broadcastrestart/BroadcastRestartCommand.java), unveraendert, als Inline-Doku ----
// package com.example.broadcastrestart;
//
// import org.bukkit.Bukkit;
// import org.bukkit.ChatColor;
// import org.bukkit.command.Command;
// import org.bukkit.command.CommandExecutor;
// import org.bukkit.command.CommandSender;
//
// public class BroadcastRestartCommand implements CommandExecutor {
//     private final BroadcastRestartPlugin plugin;
//
//     public BroadcastRestartCommand(BroadcastRestartPlugin plugin) {
//         this.plugin = plugin;
//     }
//
//     @Override
//     public boolean onCommand(CommandSender sender, Command command, String label, String[] args) {
//         if (args.length != 1) {
//             sender.sendMessage("Usage: /broadcastrestart <minutes>");
//             return false;
//         }
//
//         int minutes;
//         try {
//             minutes = Integer.parseInt(args[0]);
//         } catch (NumberFormatException e) {
//             sender.sendMessage("Invalid number of minutes.");
//             return false;
//         }
//
//         int totalSeconds = minutes * 60;
//         new CountdownTask(totalSeconds).runTaskTimer(plugin, 0, 20);
//         return true;
//     }
// }
