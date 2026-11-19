package com.example.broadcastrestart;

import org.bukkit.plugin.java.JavaPlugin;

public class BroadcastRestartPlugin extends JavaPlugin {
    @Override
    public void onEnable() {
        getCommand("broadcastrestart").setExecutor(new BroadcastRestartCommand(this));
    }
}