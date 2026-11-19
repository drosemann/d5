// Goose-Port-Spiegel von: projects/minecraft-plugins-server-systems-connecthub-java-mc-plugin/src/main/java/de/example/lobby/config/ConfigManager.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-plugins-server-systems-connecthub-java-mc-plugin/src/main/java/de/example/lobby/config/ConfigManager.java");
}

// ---- Original-Code (projects/minecraft-plugins-server-systems-connecthub-java-mc-plugin/src/main/java/de/example/lobby/config/ConfigManager.java), unveraendert, als Inline-Doku ----
// public class ConfigManager {
//     private final LobbyPlugin plugin;
//     private FileConfiguration config;
//     
//     public void loadConfig() {
//         plugin.saveDefaultConfig();
//         config = plugin.getConfig();
//         
//         // Set default values
//         config.addDefault("features.particles.enabled", true);
//         config.addDefault("features.statistics.enabled", true);
//         config.addDefault("lobby.spawn-location", null);
//         config.addDefault("lobby.max-players", 100);
//         
//         config.options().copyDefaults(true);
//         plugin.saveConfig();
//     }
// } 
