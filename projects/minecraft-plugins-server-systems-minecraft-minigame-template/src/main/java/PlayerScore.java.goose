// Goose-Port-Spiegel von: projects/minecraft-plugins-server-systems-minecraft-minigame-template/src/main/java/PlayerScore.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-plugins-server-systems-minecraft-minigame-template/src/main/java/PlayerScore.java");
}

// ---- Original-Code (projects/minecraft-plugins-server-systems-minecraft-minigame-template/src/main/java/PlayerScore.java), unveraendert, als Inline-Doku ----
// package com.example.minigame;
//
// import org.bukkit.entity.Player;
//
// import java.util.HashMap;
// import java.util.Map;
//
// public class PlayerScore {
//     private final Map<Player, Integer> scores = new HashMap<>();
//
//     public void addScore(Player player, int points) {
//         scores.put(player, scores.getOrDefault(player, 0) + points);
//     }
//
//     public int getScore(Player player) {
//         return scores.getOrDefault(player, 0);
//     }
//
//     public void resetScores() {
//         scores.clear();
//     }
// } 
