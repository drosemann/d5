// Goose-Port-Spiegel von: projects/minecraft-plugins-server-systems-sessionlockplugin/SessionLockPlugin.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-plugins-server-systems-sessionlockplugin/SessionLockPlugin.java");
}

// ---- Original-Code (projects/minecraft-plugins-server-systems-sessionlockplugin/SessionLockPlugin.java), unveraendert, als Inline-Doku ----
// package com.example.sessionlock;
//
// import com.example.sessionlock.command.LoginCommandExecutor;
// import com.example.sessionlock.listener.PlayerJoinListener;
// import java.io.File;
// import java.util.HashMap;
// import java.util.Set;
// import java.util.UUID;
//
// import org.bukkit.configuration.file.YamlConfiguration;
// import org.bukkit.plugin.java.JavaPlugin;
//
// public class SessionLockPlugin extends JavaPlugin {
//     private HashMap<UUID, String> playerIps;
//
//     public void onEnable() {
//         // Register player join event listener
//         getServer().getPluginManager().registerEvents(new PlayerJoinListener(this), this);
//
//         // Register the login command executor
//         getCommand("login").setExecutor(new LoginCommandExecutor(this));
//
//         // Initialize player IP address map
//         playerIps = new HashMap<>();
//
//         // Load player IP addresses from file
//         File ipFile = new File(getDataFolder(), "player_ips.yml");
//         if (ipFile.exists()) {
//             YamlConfiguration ipConfig = YamlConfiguration.loadConfiguration(ipFile);
//             Set<String> keys = ipConfig.getKeys(false);
//             for (String key : keys) {
//                 UUID uuid = UUID.fromString(key);
//                 String ipAddress = ipConfig.getString(key);
//                 playerIps.put(uuid, ipAddress);
//             }
//             getLogger().info("Loaded " + keys.size() + " player IPs.");
//         } else {
//             getLogger().warning("Player IP file not found.");
//         }
//     }
//
//     public void onDisable() {
//         // Save player IP addresses to file
//         File ipFile = new File(getDataFolder(), "player_ips.yml");
//         YamlConfiguration ipConfig = new YamlConfiguration();
//         for (UUID uuid : playerIps.keySet()) {
//             ipConfig.set(uuid.toString(), playerIps.get(uuid));
//         }
//         try {
//             ipConfig.save(ipFile);
//             getLogger().info("Saved " + playerIps.size() + " player IPs.");
//         } catch (Exception e) {
//             getLogger().warning("Failed to save player IP file: " + e.getMessage());
//         }
//     }
//
//     public String getPlayerIp(UUID playerId) {
//         return playerIps.get(playerId);
//     }
//
//     public void setPlayerIp(UUID playerId, String ipAddress) {
//         playerIps.put(playerId, ipAddress);
//     }
// }
