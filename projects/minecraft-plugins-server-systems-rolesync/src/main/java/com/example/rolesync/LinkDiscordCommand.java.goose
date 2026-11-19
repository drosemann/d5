// Goose-Port-Spiegel von: projects/minecraft-plugins-server-systems-rolesync/src/main/java/com/example/rolesync/LinkDiscordCommand.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-plugins-server-systems-rolesync/src/main/java/com/example/rolesync/LinkDiscordCommand.java");
}

// ---- Original-Code (projects/minecraft-plugins-server-systems-rolesync/src/main/java/com/example/rolesync/LinkDiscordCommand.java), unveraendert, als Inline-Doku ----
// package com.example.rolesync;
//
// import org.bukkit.command.Command;
// import org.bukkit.command.CommandExecutor;
// import org.bukkit.command.CommandSender;
// import org.bukkit.entity.Player;
// import org.jetbrains.annotations.NotNull;
//
// import java.util.UUID;
//
// public class LinkDiscordCommand implements CommandExecutor {
//
//     private final DiscordSyncPlugin plugin;
//
//     public LinkDiscordCommand(DiscordSyncPlugin plugin) {
//         this.plugin = plugin;
//     }
//
//     @Override
//     public boolean onCommand(@NotNull CommandSender sender, @NotNull Command command, @NotNull String label, String[] args) {
//         if (!(sender instanceof Player)) {
//             sender.sendMessage("Only players can link their Discord account.");
//             return true;
//         }
//         if (args.length != 1) {
//             sender.sendMessage("Usage: /linkdiscord <DiscordUserID>");
//             return true;
//         }
//         Player player = (Player) sender;
//         String discordId = args[0].trim();
//         plugin.addLinkedAccount(player.getUniqueId(), discordId);
//         player.sendMessage("Your Discord account has been linked (Discord ID: " + discordId + ").");
//         return true;
//     }
// }
//
