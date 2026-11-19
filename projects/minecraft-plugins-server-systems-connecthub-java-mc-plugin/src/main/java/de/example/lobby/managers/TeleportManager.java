package de.example.lobby.managers;

import de.example.lobby.LobbyPlugin;
import org.bukkit.Location;

import java.util.HashMap;
import java.util.Map;

public class TeleportManager {
    private final Map<String, Location> teleportLocations = new HashMap<>();
    private final LobbyPlugin plugin;
    
    public TeleportManager(LobbyPlugin plugin) {
        this.plugin = plugin;
        loadTeleportLocations();
    }
    
    // Move all teleport-related methods here
} 