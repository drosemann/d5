package de.hordeplugin;

import org.bukkit.command.Command;
import org.bukkit.command.CommandExecutor;
import org.bukkit.command.CommandSender;
import org.bukkit.entity.Player;
import org.bukkit.ChatColor;

/**
 * HordeCommand - Verwaltet /horde Befehle
 */
public class HordeCommand implements CommandExecutor {

    private final HordePlugin plugin;

    public HordeCommand(HordePlugin plugin) {
        this.plugin = plugin;
    }

    @Override
    public boolean onCommand(CommandSender sender, Command cmd, String label, String[] args) {
        if (!(sender instanceof Player)) {
            sender.sendMessage(ChatColor.RED + "Nur Spieler können diesen Befehl nutzen!");
            return true;
        }

        Player player = (Player) sender;

        if (!player.hasPermission("horde.admin")) {
            player.sendMessage(ChatColor.RED + "Du hast keine Berechtigung!");
            return true;
        }

        if (args.length == 0) {
            sendHelpMessage(player);
            return true;
        }

        switch (args[0].toLowerCase()) {
            case "start":
                if (args.length < 2) {
                    player.sendMessage(ChatColor.RED + "Syntax: /horde start <HordeName>");
                    return true;
                }
                String hordeName = args[1];
                plugin.getHordeManager().startHorde(hordeName, player.getLocation());
                player.sendMessage(ChatColor.GREEN + "Horde '" + hordeName + "' gestartet!");
                break;

            case "stop":
                plugin.getHordeManager().stopHorde();
                player.sendMessage(ChatColor.GREEN + "Horde gestoppt!");
                break;

            case "status":
                boolean active = plugin.getHordeManager().isHordeActive();
                if (active) {
                    int spawned = plugin.getHordeManager().getSpawnedMobCount();
                    int wave = plugin.getHordeManager().getCurrentWave();
                    player.sendMessage(ChatColor.GOLD + "Status: " + ChatColor.GREEN + "AKTIV");
                    player.sendMessage(ChatColor.GOLD + "Welle: " + wave);
                    player.sendMessage(ChatColor.GOLD + "Mobs: " + spawned);
                } else {
                    player.sendMessage(ChatColor.GOLD + "Status: " + ChatColor.RED + "INAKTIV");
                }
                break;

            case "list":
                plugin.getHordeManager().listHordes(player);
                break;

            default:
                sendHelpMessage(player);
        }

        return true;
    }

    private void sendHelpMessage(Player player) {
        player.sendMessage(ChatColor.GOLD + "═══════ HordePlugin Hilfe ═══════");
        player.sendMessage(ChatColor.YELLOW + "/horde start <name>" + ChatColor.GRAY + " - Startet eine Horde");
        player.sendMessage(ChatColor.YELLOW + "/horde stop" + ChatColor.GRAY + " - Stoppt aktive Horde");
        player.sendMessage(ChatColor.YELLOW + "/horde status" + ChatColor.GRAY + " - Zeigt Status an");
        player.sendMessage(ChatColor.YELLOW + "/horde list" + ChatColor.GRAY + " - Listet alle Horden auf");
    }
}
