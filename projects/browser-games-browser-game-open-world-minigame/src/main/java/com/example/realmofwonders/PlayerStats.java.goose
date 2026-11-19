// Goose-Port-Spiegel von: projects/browser-games-browser-game-open-world-minigame/src/main/java/com/example/realmofwonders/PlayerStats.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/browser-games-browser-game-open-world-minigame/src/main/java/com/example/realmofwonders/PlayerStats.java");
}

// ---- Original-Code (projects/browser-games-browser-game-open-world-minigame/src/main/java/com/example/realmofwonders/PlayerStats.java), unveraendert, als Inline-Doku ----
// package com.example.realmofwonders;
//
// import org.bukkit.entity.Player;
//
// import java.util.HashMap;
// import java.util.Map;
//
// public class PlayerStats {
//     private static final Map<Player, Integer> kills = new HashMap<>();
//     private static final Map<Player, Integer> deaths = new HashMap<>();
//
//     public static void addKill(Player player) {
//         kills.put(player, kills.getOrDefault(player, 0) + 1);
//     }
//
//     public static void addDeath(Player player) {
//         deaths.put(player, deaths.getOrDefault(player, 0) + 1);
//     }
//
//     public static int getKills(Player player) {
//         return kills.getOrDefault(player, 0);
//     }
//
//     public static int getDeaths(Player player) {
//         return deaths.getOrDefault(player, 0);
//     }
// }
//
