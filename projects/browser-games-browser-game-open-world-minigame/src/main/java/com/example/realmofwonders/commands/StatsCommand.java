package com.example.realmofwonders.commands;

import com.example.realmofwonders.PlayerStats;
import org.bukkit.command.Command;
import org.bukkit.command.CommandExecutor;
import org.bukkit.command.CommandSender;
import org.bukkit.entity.Player;

public class StatsCommand implements CommandExecutor {

    @Override
    public boolean onCommand(CommandSender sender, Command command, String label, String[] args) {
        if (sender instanceof Player) {
            Player player = (Player) sender;
            int kills = PlayerStats.getKills(player);
            int deaths = PlayerStats.getDeaths(player);
            player.sendMessage("Your Stats: Kills: " + kills + ", Deaths: " + deaths);
            return true;
        }
        return false;
    }
}
