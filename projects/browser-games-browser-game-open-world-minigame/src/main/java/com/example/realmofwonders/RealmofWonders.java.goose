// Goose-Port-Spiegel von: projects/browser-games-browser-game-open-world-minigame/src/main/java/com/example/realmofwonders/RealmofWonders.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/browser-games-browser-game-open-world-minigame/src/main/java/com/example/realmofwonders/RealmofWonders.java");
}

// ---- Original-Code (projects/browser-games-browser-game-open-world-minigame/src/main/java/com/example/realmofwonders/RealmofWonders.java), unveraendert, als Inline-Doku ----
// // src/main/java/com/example/realmofwonders/RealmofWonders.java
// package com.example.realmofwonders;
//
// import org.bukkit.plugin.java.JavaPlugin;
//
// public class RealmofWonders extends JavaPlugin {
//
//     @Override
//     public void onEnable() {
//         getLogger().info("Realm of Wonders has been enabled!");
//         
//         // Register commands
//         this.getCommand("achievements").setExecutor(new AchievementCommand());
//         
//         // Register events
//         getServer().getPluginManager().registerEvents(new PlayerJoinListener(), this);
//         
//         // Load configuration
//         saveDefaultConfig();
//     }
//
//     @Override
//     public void onDisable() {
//         getLogger().info("Realm of Wonders has been disabled!");
//     }
// }
