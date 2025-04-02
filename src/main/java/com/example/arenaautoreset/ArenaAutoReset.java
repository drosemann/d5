package com.example.arenaautoreset;

import org.bukkit.plugin.java.JavaPlugin;

public class ArenaAutoReset extends JavaPlugin {
    @Override
    public void onEnable() {
        getLogger().info("Arena Auto Reset plugin has been enabled!");
    }

    @Override
    public void onDisable() {
        getLogger().info("Arena Auto Reset plugin has been disabled!");
    }
}
