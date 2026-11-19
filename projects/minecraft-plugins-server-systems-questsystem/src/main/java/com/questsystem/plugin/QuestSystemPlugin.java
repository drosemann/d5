package com.questsystem.plugin;

import org.bukkit.plugin.java.JavaPlugin;

public class QuestSystemPlugin extends JavaPlugin {
    private QuestConfig questConfig;
    private QuestManager questManager;

    @Override
    public void onEnable() {
        getLogger().info("QuestSystem is starting...");

        saveDefaultConfig();
        reloadConfig();
        getLogger().info("Configuration loaded.");
        
        // Initialize the quest configuration
        questConfig = new QuestConfig(this);
        getLogger().info("QuestConfig initialized.");
        
        // Register commands
        getCommand("quest").setExecutor(new QuestCommand(this));
        getLogger().info("Commands registered.");
        
        // Register events
        getServer().getPluginManager().registerEvents(new QuestListener(this), this);
        getLogger().info("Event listeners registered.");
        
        questManager = new QuestManager(questConfig);
        getLogger().info("QuestManager initialized.");

        getLogger().info("QuestSystem enabled successfully!");
    }

    public QuestConfig getQuestConfig() {
        return questConfig;
    }

    public QuestManager getQuestManager() {
        return questManager;
    }
}