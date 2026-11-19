package com.hearthrift.commands;

import com.hearthrift.Hearthrift;
import org.bukkit.command.Command;
import org.bukkit.command.CommandExecutor;
import org.bukkit.command.CommandSender;
import org.bukkit.command.TabCompleter;
import org.bukkit.entity.Player;

import java.util.ArrayList;
import java.util.List;

public abstract class BaseCommand implements CommandExecutor, TabCompleter {
    protected final Hearthrift plugin;

    public BaseCommand(Hearthrift plugin) {
        this.plugin = plugin;
    }

    @Override
    public boolean onCommand(CommandSender sender, Command command, String label, String[] args) {
        if (!(sender instanceof Player)) {
            sender.sendMessage("§cThis command can only be used by players!");
            return true;
        }
        
        return execute((Player) sender, command, label, args);
    }

    protected abstract boolean execute(Player player, Command command, String label, String[] args);

    @Override
    public List<String> onTabComplete(CommandSender sender, Command command, String alias, String[] args) {
        return new ArrayList<>();
    }

    protected void sendUsage(Player player, String usage) {
        player.sendMessage("§cUsage: " + usage);
    }

    protected void sendError(Player player, String message) {
        player.sendMessage("§c" + message);
    }

    protected void sendSuccess(Player player, String message) {
        player.sendMessage("§a" + message);
    }

    protected void sendInfo(Player player, String message) {
        player.sendMessage("§e" + message);
    }
}