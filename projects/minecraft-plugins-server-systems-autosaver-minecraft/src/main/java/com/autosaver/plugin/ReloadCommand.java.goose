// Goose-Port-Spiegel von: projects/minecraft-plugins-server-systems-autosaver-minecraft/src/main/java/com/autosaver/plugin/ReloadCommand.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-plugins-server-systems-autosaver-minecraft/src/main/java/com/autosaver/plugin/ReloadCommand.java");
}

// ---- Original-Code (projects/minecraft-plugins-server-systems-autosaver-minecraft/src/main/java/com/autosaver/plugin/ReloadCommand.java), unveraendert, als Inline-Doku ----
// package com.autosaver.plugin;
//
// import org.bukkit.command.Command;
// import org.bukkit.command.CommandExecutor;
// import org.bukkit.command.CommandSender;
//
// public class ReloadCommand implements CommandExecutor {
//     private final AutoSaverPlugin plugin;
//
//     public ReloadCommand(AutoSaverPlugin plugin) {
//         this.plugin = plugin;
//     }
//
//     @Override
//     public boolean onCommand(CommandSender sender, Command command, String label, String[] args) {
//         if (sender.hasPermission("autosaver.reload")) {
//             plugin.reloadConfig();
//             sender.sendMessage("AutoSaver configuration reloaded.");
//             return true;
//         } else {
//             sender.sendMessage("You do not have permission to reload the configuration.");
//             return false;
//         }
//     }
// } 
