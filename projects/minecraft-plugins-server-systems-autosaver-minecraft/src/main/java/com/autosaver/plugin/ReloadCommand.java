package com.autosaver.plugin;

import org.bukkit.command.Command;
import org.bukkit.command.CommandExecutor;
import org.bukkit.command.CommandSender;

public class ReloadCommand implements CommandExecutor {
    private final AutoSaverPlugin plugin;

    public ReloadCommand(AutoSaverPlugin plugin) {
        this.plugin = plugin;
    }

    @Override
    public boolean onCommand(CommandSender sender, Command command, String label, String[] args) {
        if (sender.hasPermission("autosaver.reload")) {
            plugin.reloadConfig();
            sender.sendMessage("AutoSaver configuration reloaded.");
            return true;
        } else {
            sender.sendMessage("You do not have permission to reload the configuration.");
            return false;
        }
    }
} 