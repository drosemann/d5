// Goose-Port-Spiegel von: projects/github-repos-streuland/src/main/java/de/streuland/analytics/PlayerEditStats.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/github-repos-streuland/src/main/java/de/streuland/analytics/PlayerEditStats.java");
}

// ---- Original-Code (projects/github-repos-streuland/src/main/java/de/streuland/analytics/PlayerEditStats.java), unveraendert, als Inline-Doku ----
// package de.streuland.analytics;
//
// import java.util.UUID;
//
// public class PlayerEditStats {
//     private final String plotId;
//     private final UUID playerId;
//     private final int places;
//     private final int breaks;
//     private final int burns;
//
//     public PlayerEditStats(String plotId, UUID playerId, int places, int breaks, int burns) {
//         this.plotId = plotId;
//         this.playerId = playerId;
//         this.places = places;
//         this.breaks = breaks;
//         this.burns = burns;
//     }
//
//     public String getPlotId() {
//         return plotId;
//     }
//
//     public UUID getPlayerId() {
//         return playerId;
//     }
//
//     public int getPlaces() {
//         return places;
//     }
//
//     public int getBreaks() {
//         return breaks;
//     }
//
//     public int getBurns() {
//         return burns;
//     }
//
//     public int getTotalEdits() {
//         return places + breaks + burns;
//     }
// }
//
