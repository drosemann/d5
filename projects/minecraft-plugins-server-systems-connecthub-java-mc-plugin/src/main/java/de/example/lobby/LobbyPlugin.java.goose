// Goose-Port-Spiegel von: projects/minecraft-plugins-server-systems-connecthub-java-mc-plugin/src/main/java/de/example/lobby/LobbyPlugin.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-plugins-server-systems-connecthub-java-mc-plugin/src/main/java/de/example/lobby/LobbyPlugin.java");
}

// ---- Original-Code (projects/minecraft-plugins-server-systems-connecthub-java-mc-plugin/src/main/java/de/example/lobby/LobbyPlugin.java), unveraendert, als Inline-Doku ----
// package de.example.lobby;
//
// import org.bukkit.plugin.java.JavaPlugin;
//
// public class LobbyPlugin extends JavaPlugin {
//     private TeleportManager teleportManager;
//     private GuiManager guiManager;
//     private OutfitManager outfitManager;
//     private StatsManager statsManager;
//     private ParticleManager particleManager;
//     private PreferencesManager preferencesManager;
//     
//     @Override
//     public void onEnable() {
//         teleportManager = new TeleportManager(this);
//         guiManager = new GuiManager(this);
//         outfitManager = new OutfitManager(this);
//         
//         statsManager = new StatsManager(this);
//         particleManager = new ParticleManager(this);
//         preferencesManager = new PreferencesManager(this);
//         
//         getCommand("ConnectHub").setExecutor(new ConnectHubCommand(this));
//         getServer().getPluginManager().registerEvents(new LobbyListener(this), this);
//         
//         getCommand("stats").setExecutor(new StatsCommand(this));
//         getCommand("particles").setExecutor(new ParticlesCommand(this));
//         getCommand("preferences").setExecutor(new PreferencesCommand(this));
//         
//         loadPlayerData();
//     }
//     
//     @Override
//     public void onDisable() {
//         savePlayerData();
//     }
//     
//     // Getter methods for managers
//     public TeleportManager getTeleportManager() { return teleportManager; }
//     public GuiManager getGuiManager() { return guiManager; }
//     public OutfitManager getOutfitManager() { return outfitManager; }
//     public StatsManager getStatsManager() { return statsManager; }
//     public ParticleManager getParticleManager() { return particleManager; }
//     public PreferencesManager getPreferencesManager() { return preferencesManager; }
// } 
