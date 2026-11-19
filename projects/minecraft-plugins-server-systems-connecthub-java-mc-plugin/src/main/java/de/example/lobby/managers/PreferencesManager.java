package de.example.lobby.managers;

import de.example.lobby.LobbyPlugin;
import org.bukkit.Bukkit;
import org.bukkit.entity.Player;

import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

public class PreferencesManager {
    private final LobbyPlugin plugin;
    private final Map<UUID, PlayerPreferences> preferences = new HashMap<>();
    
    public class PlayerPreferences {
        private boolean hideOtherPlayers;
        private boolean enableParticles;
        private boolean enableSounds;
        private String defaultLobby;
        
        // Getters and setters
    }
    
    public void toggleHidePlayers(Player player) {
        PlayerPreferences prefs = getPreferences(player);
        prefs.setHideOtherPlayers(!prefs.isHideOtherPlayers());
        
        if (prefs.isHideOtherPlayers()) {
            Bukkit.getOnlinePlayers().forEach(p -> player.hidePlayer(plugin, p));
        } else {
            Bukkit.getOnlinePlayers().forEach(p -> player.showPlayer(plugin, p));
        }
    }
} 