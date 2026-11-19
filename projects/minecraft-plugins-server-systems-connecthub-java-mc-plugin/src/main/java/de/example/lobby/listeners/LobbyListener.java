package de.example.lobby.listeners;

import de.example.lobby.LobbyPlugin;
import org.bukkit.event.EventHandler;
import org.bukkit.event.Listener;
import org.bukkit.event.inventory.InventoryClickEvent;
import org.bukkit.event.player.PlayerInteractEvent;

public class LobbyListener implements Listener {
    private final LobbyPlugin plugin;
    
    public LobbyListener(LobbyPlugin plugin) {
        this.plugin = plugin;
    }
    
    @EventHandler
    public void onPlayerInteract(PlayerInteractEvent event) {
        // Move event handling logic here
    }
    
    @EventHandler
    public void onInventoryClick(InventoryClickEvent event) {
        // Move inventory click handling here
    }
} 