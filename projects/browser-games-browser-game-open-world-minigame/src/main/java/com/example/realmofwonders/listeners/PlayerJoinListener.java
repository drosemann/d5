// src/main/java/com/example/realmofwonders/listeners/PlayerJoinListener.java
package com.example.realmofwonders.listeners;

import org.bukkit.event.EventHandler;
import org.bukkit.event.Listener;
import org.bukkit.event.player.PlayerJoinEvent;

public class PlayerJoinListener implements Listener {

    @EventHandler
    public void onPlayerJoin(PlayerJoinEvent event) {
        event.getPlayer().sendMessage("Welcome to the Realm of Wonders!");
    }
}