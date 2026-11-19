package com.example.rolesync;

import org.bukkit.command.Command;
import org.bukkit.command.CommandExecutor;
import org.bukkit.command.CommandSender;
import org.bukkit.entity.Player;
import org.jetbrains.annotations.NotNull;

import java.util.UUID;

public class LinkDiscordCommand implements CommandExecutor {

    private final DiscordSyncPlugin plugin;

    public LinkDiscordCommand(DiscordSyncPlugin plugin) {
        this.plugin = plugin;
    }

    @Override
    public boolean onCommand(@NotNull CommandSender sender, @NotNull Command command, @NotNull String label, String[] args) {
        if (!(sender instanceof Player)) {
            sender.sendMessage("Only players can link their Discord account.");
            return true;
        }
        if (args.length != 1) {
            sender.sendMessage("Usage: /linkdiscord <DiscordUserID>");
            return true;
        }
        Player player = (Player) sender;
        String discordId = args[0].trim();
        plugin.addLinkedAccount(player.getUniqueId(), discordId);
        player.sendMessage("Your Discord account has been linked (Discord ID: " + discordId + ").");
        return true;
    }
}
