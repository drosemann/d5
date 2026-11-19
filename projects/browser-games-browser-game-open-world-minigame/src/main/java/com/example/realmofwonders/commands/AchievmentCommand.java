// src/main/java/com/example/realmofwonders/commands/AchievementCommand.java
package com.example.realmofwonders.commands;

import org.bukkit.command.Command;
import org.bukkit.command.CommandExecutor;
import org.bukkit.command.CommandSender;
import org.bukkit.entity.Player;

public class AchievementCommand implements CommandExecutor {

    @Override
    public boolean onCommand(CommandSender sender, Command command, String label, String[] args) {
        if (sender instanceof Player) {
            Player player = (Player) sender;
            // Logic to show achievements
            player.sendMessage("Your achievements in Realm of Wonders: ...");
            return true;
        }
        return false;
    }
}