package com.example.minigame;

import org.bukkit.plugin.java.JavaPlugin;
import org.bukkit.event.Listener;
import org.bukkit.event.EventHandler;
import org.bukkit.event.player.PlayerJoinEvent;

public class Main extends JavaPlugin implements Listener {
    @Override
    public void onEnable() {
        // Registriere den Event-Listener
        getServer().getPluginManager().registerEvents(this, this);
        getLogger().info("Minigame Plugin aktiviert!");

        PlayerScore playerScore = new PlayerScore();
        TeamManager teamManager = new TeamManager();

        getCommand("set").setExecutor(new SetCommand(this));
        getCommand("lobby").setExecutor(new LobbyCommand());
        getCommand("startgame").setExecutor(new GameCommands(this, playerScore));
        getCommand("endgame").setExecutor(new GameCommands(this, playerScore));

        getCommand("createteam").setExecutor(new CustomCommands(teamManager));
        getCommand("jointeam").setExecutor(new CustomCommands(teamManager));
        getCommand("teaminfo").setExecutor(new CustomCommands(teamManager));

        new GameLogic(this, playerScore);

        // Register the SpectatorManager
        new SpectatorManager(this);

        // Register the MapManager
        new MapManager(this);
    }

    @Override
    public void onDisable() {
        getLogger().info("Minigame Plugin deaktiviert!");
    }

    @EventHandler
    public void onPlayerJoin(PlayerJoinEvent event) {
        event.getPlayer().sendMessage("Willkommen zum Minigame!");
    }
}
