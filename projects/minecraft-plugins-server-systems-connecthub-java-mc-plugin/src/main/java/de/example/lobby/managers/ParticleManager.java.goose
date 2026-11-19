// Goose-Port-Spiegel von: projects/minecraft-plugins-server-systems-connecthub-java-mc-plugin/src/main/java/de/example/lobby/managers/ParticleManager.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-plugins-server-systems-connecthub-java-mc-plugin/src/main/java/de/example/lobby/managers/ParticleManager.java");
}

// ---- Original-Code (projects/minecraft-plugins-server-systems-connecthub-java-mc-plugin/src/main/java/de/example/lobby/managers/ParticleManager.java), unveraendert, als Inline-Doku ----
// package de.example.lobby.managers;
//
// import org.bukkit.Bukkit;
// import org.bukkit.Location;
// import org.bukkit.Particle;
// import org.bukkit.entity.Player;
// import org.bukkit.scheduler.BukkitTask;
//
// import java.util.HashMap;
// import java.util.Map;
// import java.util.UUID;
//
// public class ParticleManager {
//     private final LobbyPlugin plugin;
//     private final Map<UUID, BukkitTask> activeEffects = new HashMap<>();
//     
//     public void addPlayerEffect(Player player, Particle particle) {
//         BukkitTask task = Bukkit.getScheduler().runTaskTimer(plugin, () -> {
//             Location loc = player.getLocation();
//             player.getWorld().spawnParticle(particle, loc, 10, 0.5, 0.5, 0.5, 0);
//         }, 0L, 5L);
//         
//         activeEffects.put(player.getUniqueId(), task);
//     }
//     
//     public void removePlayerEffect(Player player) {
//         BukkitTask task = activeEffects.remove(player.getUniqueId());
//         if (task != null) {
//             task.cancel();
//         }
//     }
// } 
