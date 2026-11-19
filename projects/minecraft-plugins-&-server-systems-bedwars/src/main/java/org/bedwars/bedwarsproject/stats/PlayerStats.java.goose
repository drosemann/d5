// Goose-Port-Spiegel von: projects/minecraft-plugins-&-server-systems-bedwars/src/main/java/org/bedwars/bedwarsproject/stats/PlayerStats.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-plugins-&-server-systems-bedwars/src/main/java/org/bedwars/bedwarsproject/stats/PlayerStats.java");
}

// ---- Original-Code (projects/minecraft-plugins-&-server-systems-bedwars/src/main/java/org/bedwars/bedwarsproject/stats/PlayerStats.java), unveraendert, als Inline-Doku ----
// package org.bedwars.bedwarsproject;
//
// import java.util.HashMap;
// import java.util.Map;
//
// public class PlayerStats {
//     private final Map<String, Integer> wins = new HashMap<>();
//     private final Map<String, Integer> losses = new HashMap<>();
//     private final Map<String, Integer> kills = new HashMap<>();
//
//     public void addWin(String playerName) {
//         wins.put(playerName, wins.getOrDefault(playerName, 0) + 1);
//     }
//
//     public void addLoss(String playerName) {
//         losses.put(playerName, losses.getOrDefault(playerName, 0) + 1);
//     }
//
//     public void addKill(String playerName) {
//         kills.put(playerName, kills.getOrDefault(playerName, 0) + 1);
//     }
//
//     public int getWins(String playerName) {
//         return wins.getOrDefault(playerName, 0);
//     }
//
//     public int getLosses(String playerName) {
//         return losses.getOrDefault(playerName, 0);
//     }
//
//     public int getKills(String playerName) {
//         return kills.getOrDefault(playerName, 0);
//     }
// } 
