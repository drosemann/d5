// Goose-Port-Spiegel von: projects/minecraft-plugins-server-systems-minigametemplate-java/src/main/java/GameMap.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-plugins-server-systems-minigametemplate-java/src/main/java/GameMap.java");
}

// ---- Original-Code (projects/minecraft-plugins-server-systems-minigametemplate-java/src/main/java/GameMap.java), unveraendert, als Inline-Doku ----
// package com.example.minigame;
//
// import org.bukkit.Location;
//
// import java.util.ArrayList;
// import java.util.List;
//
// public class GameMap {
//     private final String name;
//     private final List<Location> spawnPoints;
//     private boolean isFinished;
//
//     public GameMap(String name) {
//         this.name = name;
//         this.spawnPoints = new ArrayList<>();
//         this.isFinished = false;
//     }
//
//     public void addSpawnPoint(Location location) {
//         spawnPoints.add(location);
//     }
//
//     public Location getSpawnPoint() {
//         // Return the first spawn point or a default location if none exist
//         return spawnPoints.isEmpty() ? null : spawnPoints.get(0);
//     }
//
//     public void setFinished(boolean finished) {
//         isFinished = finished;
//     }
//
//     public String getName() {
//         return name;
//     }
//
//     public boolean isFinished() {
//         return isFinished;
//     }
// } 
