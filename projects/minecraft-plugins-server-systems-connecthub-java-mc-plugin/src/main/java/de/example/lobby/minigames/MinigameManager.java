package de.example.lobby.minigames;

import de.example.lobby.LobbyPlugin;
import org.bukkit.entity.Player;

import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

public class MinigameManager {
    private final LobbyPlugin plugin;
    private final Map<String, Minigame> minigames = new HashMap<>();

    public MinigameManager(LobbyPlugin plugin) {
        this.plugin = plugin;
        registerMinigames();
    }

    private void registerMinigames() {
        minigames.put("parkour", new ParkourMinigame(plugin));
        minigames.put("spleef", new SpleefMinigame(plugin));
    }

    public void startMinigame(String gameName, Player player) {
        Minigame game = minigames.get(gameName.toLowerCase());
        if (game != null) {
            game.startGame(player);
        }
    }
}

public interface Minigame {
    void startGame(Player player);
    void endGame(Player player);
}

public class ParkourMinigame implements Minigame {
    private final LobbyPlugin plugin;
    private final Map<UUID, Long> playerStartTimes = new HashMap<>();

    @Override
    public void startGame(Player player) {
        // Teleport player to parkour start
        player.teleport(getParkourStart());
        playerStartTimes.put(player.getUniqueId(), System.currentTimeMillis());
    }

    @Override
    public void endGame(Player player) {
        long startTime = playerStartTimes.remove(player.getUniqueId());
        long endTime = System.currentTimeMillis();
        long duration = (endTime - startTime) / 1000; // in seconds
        player.sendMessage("You completed the parkour in " + duration + " seconds!");
    }
} 