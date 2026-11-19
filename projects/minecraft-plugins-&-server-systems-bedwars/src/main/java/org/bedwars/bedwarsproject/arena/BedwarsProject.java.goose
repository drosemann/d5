// Goose-Port-Spiegel von: projects/minecraft-plugins-&-server-systems-bedwars/src/main/java/org/bedwars/bedwarsproject/arena/BedwarsProject.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-plugins-&-server-systems-bedwars/src/main/java/org/bedwars/bedwarsproject/arena/BedwarsProject.java");
}

// ---- Original-Code (projects/minecraft-plugins-&-server-systems-bedwars/src/main/java/org/bedwars/bedwarsproject/arena/BedwarsProject.java), unveraendert, als Inline-Doku ----
// package org.bedwars.bedwarsproject;
//
// import org.bukkit.plugin.java.JavaPlugin;
// import org.bedwars.bedwarsproject.game.GameManager;
// import org.bedwars.bedwarsproject.GameEventListener;
//
// public final class BedwarsProject extends JavaPlugin {
//     private GameManager gameManager;
//
//     @Override
//     public void onEnable() {
//         // Plugin startup logic
//         gameManager = new GameManager();
//         gameManager.startGame();
//         // Additional startup logic if needed
//         getLogger().info("BedwarsProject has been enabled!");
//         // Register events
//         getServer().getPluginManager().registerEvents(new GameEventListener(), this);
//
//         // In your main plugin class's onEnable()
// getCommand("ability").setExecutor(new AbilityCommand(gameManagerInstance));
//    // In your main plugin class's onEnable()
// Bukkit.getPluginManager().registerEvents(gameManagerInstance, this);
//
// }// In your main plugin class's onEnable()
// turretManagerInstance = new TurretManager(gameManagerInstance);
// Bukkit.getPluginManager().registerEvents(turretManagerInstance, this);
//
//     @Override
//     public void onDisable() {
//         // Plugin shutdown logic
//         if (gameManager != null) {
//             gameManager.stopGame();
//         }
// // In your main plugin class's onEnable()
// ShopManager shopManager = new ShopManager();
// GameManager gameManager = new GameManager(shopManager);
// // ... register listeners, commands, etc.
//
//     }
// }
//
