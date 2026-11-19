// Goose-Port-Spiegel von: projects/minecraft-plugins-server-systems-horden-plugin/src/main/java/com/horde/plugin/main/HordePlugin.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-plugins-server-systems-horden-plugin/src/main/java/com/horde/plugin/main/HordePlugin.java");
}

// ---- Original-Code (projects/minecraft-plugins-server-systems-horden-plugin/src/main/java/com/horde/plugin/main/HordePlugin.java), unveraendert, als Inline-Doku ----
// package de.hordeplugin;
//
// import org.bukkit.plugin.java.JavaPlugin;
// import org.bukkit.configuration.file.FileConfiguration;
// import org.bukkit.Bukkit;
//
// import de.hordeplugin.manager.HordeManager;
// import de.hordeplugin.listener.LootListener;
// import de.hordeplugin.listener.CombatListener;
//
// /**
//  * HordePlugin - Advanced Horde System für Paper 1.16.5
//  * Spawnt Wellen von Monstern mit Custom-Ausrüstung, Loot und Effekten
//  */
// public class HordePlugin extends JavaPlugin {
//
//     private HordeManager hordeManager;
//     private static HordePlugin instance;
//
//     @Override
//     public void onEnable() {
//         instance = this;
//         
//         // Konfiguration laden/erstellen
//         saveDefaultConfig();
//         FileConfiguration config = getConfig();
//         
//         // HordeManager initialisieren
//         this.hordeManager = new HordeManager(this);
//         
//         // Event-Listener registrieren
//         Bukkit.getPluginManager().registerEvents(new LootListener(this), this);
//         Bukkit.getPluginManager().registerEvents(new CombatListener(this), this);
//         
//         // Commands registrieren
//         getCommand("horde").setExecutor(new HordeCommand(this));
//         
//         getLogger().info("═══════════════════════════════════════");
//         getLogger().info("HordePlugin v1.0.0 aktiviert!");
//         getLogger().info("Horden-System bereit zum Spawnen.");
//         getLogger().info("═══════════════════════════════════════");
//     }
//
//     @Override
//     public void onDisable() {
//         if (hordeManager != null) {
//             hordeManager.stopHorde();
//         }
//         getLogger().info("HordePlugin deaktiviert!");
//     }
//
//     @Override
//     public void saveDefaultConfig() {
//         if (!getDataFolder().exists()) {
//             getDataFolder().mkdir();
//         }
//         if (!new java.io.File(getDataFolder(), "config.yml").exists()) {
//             saveResource("config.yml", false);
//         }
//     }
//
//     public HordeManager getHordeManager() {
//         return hordeManager;
//     }
//
//     public static HordePlugin getInstance() {
//         return instance;
//     }
// }
//
