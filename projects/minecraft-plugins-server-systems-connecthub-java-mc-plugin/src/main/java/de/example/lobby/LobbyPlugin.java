package de.example.lobby;

import org.bukkit.plugin.java.JavaPlugin;

public class LobbyPlugin extends JavaPlugin {
    private TeleportManager teleportManager;
    private GuiManager guiManager;
    private OutfitManager outfitManager;
    private StatsManager statsManager;
    private ParticleManager particleManager;
    private PreferencesManager preferencesManager;
    
    @Override
    public void onEnable() {
        teleportManager = new TeleportManager(this);
        guiManager = new GuiManager(this);
        outfitManager = new OutfitManager(this);
        
        statsManager = new StatsManager(this);
        particleManager = new ParticleManager(this);
        preferencesManager = new PreferencesManager(this);
        
        getCommand("ConnectHub").setExecutor(new ConnectHubCommand(this));
        getServer().getPluginManager().registerEvents(new LobbyListener(this), this);
        
        getCommand("stats").setExecutor(new StatsCommand(this));
        getCommand("particles").setExecutor(new ParticlesCommand(this));
        getCommand("preferences").setExecutor(new PreferencesCommand(this));
        
        loadPlayerData();
    }
    
    @Override
    public void onDisable() {
        savePlayerData();
    }
    
    // Getter methods for managers
    public TeleportManager getTeleportManager() { return teleportManager; }
    public GuiManager getGuiManager() { return guiManager; }
    public OutfitManager getOutfitManager() { return outfitManager; }
    public StatsManager getStatsManager() { return statsManager; }
    public ParticleManager getParticleManager() { return particleManager; }
    public PreferencesManager getPreferencesManager() { return preferencesManager; }
} 