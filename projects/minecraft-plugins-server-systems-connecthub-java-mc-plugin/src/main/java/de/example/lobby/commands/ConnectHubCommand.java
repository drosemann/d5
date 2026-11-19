package de.example.lobby.commands;

import de.example.lobby.LobbyPlugin;
import org.bukkit.command.Command;
import org.bukkit.command.CommandExecutor;
import org.bukkit.command.CommandSender;

public class ConnectHubCommand implements CommandExecutor {
    private final LobbyPlugin plugin;
    
    public ConnectHubCommand(LobbyPlugin plugin) {
        this.plugin = plugin;
    }
    
    @Override
    public boolean onCommand(CommandSender sender, Command command, String label, String[] args) {
        // Move command handling logic here
    }
} 