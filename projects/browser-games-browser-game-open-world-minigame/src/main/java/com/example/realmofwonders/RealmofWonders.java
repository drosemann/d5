// src/main/java/com/example/realmofwonders/RealmofWonders.java
package com.example.realmofwonders;

import org.bukkit.plugin.java.JavaPlugin;

public class RealmofWonders extends JavaPlugin {

    @Override
    public void onEnable() {
        getLogger().info("Realm of Wonders has been enabled!");
        
        // Register commands
        this.getCommand("achievements").setExecutor(new AchievementCommand());
        
        // Register events
        getServer().getPluginManager().registerEvents(new PlayerJoinListener(), this);
        
        // Load configuration
        saveDefaultConfig();
    }

    @Override
    public void onDisable() {
        getLogger().info("Realm of Wonders has been disabled!");
    }
}