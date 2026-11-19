public class ConfigManager {
    private final LobbyPlugin plugin;
    private FileConfiguration config;
    
    public void loadConfig() {
        plugin.saveDefaultConfig();
        config = plugin.getConfig();
        
        // Set default values
        config.addDefault("features.particles.enabled", true);
        config.addDefault("features.statistics.enabled", true);
        config.addDefault("lobby.spawn-location", null);
        config.addDefault("lobby.max-players", 100);
        
        config.options().copyDefaults(true);
        plugin.saveConfig();
    }
} 