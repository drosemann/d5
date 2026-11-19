// Goose-Port-Spiegel von: projects/minecraft-plugins-server-systems-connecthub-java-mc-plugin/src/main/java/de/example/lobby/managers/PreferencesManager.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-plugins-server-systems-connecthub-java-mc-plugin/src/main/java/de/example/lobby/managers/PreferencesManager.java");
}

// ---- Original-Code (projects/minecraft-plugins-server-systems-connecthub-java-mc-plugin/src/main/java/de/example/lobby/managers/PreferencesManager.java), unveraendert, als Inline-Doku ----
// package de.example.lobby.managers;
//
// import de.example.lobby.LobbyPlugin;
// import org.bukkit.Bukkit;
// import org.bukkit.entity.Player;
//
// import java.util.HashMap;
// import java.util.Map;
// import java.util.UUID;
//
// public class PreferencesManager {
//     private final LobbyPlugin plugin;
//     private final Map<UUID, PlayerPreferences> preferences = new HashMap<>();
//     
//     public class PlayerPreferences {
//         private boolean hideOtherPlayers;
//         private boolean enableParticles;
//         private boolean enableSounds;
//         private String defaultLobby;
//         
//         // Getters and setters
//     }
//     
//     public void toggleHidePlayers(Player player) {
//         PlayerPreferences prefs = getPreferences(player);
//         prefs.setHideOtherPlayers(!prefs.isHideOtherPlayers());
//         
//         if (prefs.isHideOtherPlayers()) {
//             Bukkit.getOnlinePlayers().forEach(p -> player.hidePlayer(plugin, p));
//         } else {
//             Bukkit.getOnlinePlayers().forEach(p -> player.showPlayer(plugin, p));
//         }
//     }
// } 
