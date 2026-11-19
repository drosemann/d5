package de.example.lobby.managers;

import de.example.lobby.LobbyPlugin;
import org.bukkit.entity.Player;
import java.util.UUID;
import java.util.HashMap;
import java.util.Map;

public class StatsManager {
    private final LobbyPlugin plugin;
    private final Map<UUID, PlayerStats> playerStats = new HashMap<>();
    
    public class PlayerStats {
        private int playtime;
        private int lobbySwitches;
        private int outfitChanges;
        
        // Getters, setters, and methods to serialize/deserialize
    }
    
    public void incrementStat(Player player, String statType) {
        PlayerStats stats = playerStats.computeIfAbsent(
            player.getUniqueId(), 
            k -> new PlayerStats()
        );
        
        switch(statType) {
            case "lobbySwitches":
                stats.lobbySwitches++;
                break;
            case "outfitChanges":
                stats.outfitChanges++;
                break;
        }
    }
} 