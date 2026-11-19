// Goose-Port-Spiegel von: projects/minecraft-game-concepts-apocalypseunleashed/src/main/java/apocalypse/utils/ConfigManager.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-apocalypseunleashed/src/main/java/apocalypse/utils/ConfigManager.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-apocalypseunleashed/src/main/java/apocalypse/utils/ConfigManager.java), unveraendert, als Inline-Doku ----
// package apocalypse.utils;
//
// import org.bukkit.configuration.file.FileConfiguration;
// import apocalypse.ApocalypsePlugin;
//
// public class ConfigManager {
//     private final ApocalypsePlugin plugin;
//     private FileConfiguration config;
//
//     public ConfigManager(ApocalypsePlugin plugin) {
//         this.plugin = plugin;
//         loadConfig();
//     }
//
//     public void loadConfig() {
//         plugin.saveDefaultConfig();
//         plugin.reloadConfig();
//         config = plugin.getConfig();
//     }
//
//     public FileConfiguration getConfig() {
//         return config;
//     }
//
//     public boolean isDisasterEnabled(String disasterName) {
//         return config.getBoolean("disasters." + disasterName + ".enabled", true);
//     }
//
//     public int getRandomDisasterInterval() {
//         return config.getInt("settings.random-disaster-interval", 30);
//     }
//
//     public int getRandomDisasterChance() {
//         return config.getInt("settings.random-disaster-chance", 25);
//     }
//
//     public boolean shouldAnnounceDisasters() {
//         return config.getBoolean("settings.announce-disasters", true);
//     }
//
//     public int getMaxActiveDisasters() {
//         return config.getInt("settings.max-active-disasters", 3);
//     }
// }
