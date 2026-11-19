// Goose-Port-Spiegel von: projects/minecraft-plugins-server-systems-minigametemplate-java/src/main/java/Leaderboard.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-plugins-server-systems-minigametemplate-java/src/main/java/Leaderboard.java");
}

// ---- Original-Code (projects/minecraft-plugins-server-systems-minigametemplate-java/src/main/java/Leaderboard.java), unveraendert, als Inline-Doku ----
// import java.util.ArrayList;
// import java.util.Collections;
// import java.util.Comparator;
//
// public class Leaderboard {
//     private ArrayList<PlayerScore> scores;
//
//     public Leaderboard() {
//         scores = new ArrayList<>();
//     }
//
//     public void addScore(String playerName, int score) {
//         scores.add(new PlayerScore(playerName, score));
//         Collections.sort(scores, Comparator.comparingInt(PlayerScore::getScore).reversed());
//     }
//
//     public void displayTopScores(int topN) {
//         System.out.println("--- Leaderboard ---");
//         for (int i = 0; i < Math.min(topN, scores.size()); i++) {
//             PlayerScore ps = scores.get(i);
//             System.out.println((i + 1) + ". " + ps.getPlayerName() + " - " + ps.getScore());
//         }
//     }
//
//     private static class PlayerScore {
//         private final String playerName;
//         private final int score;
//
//         public PlayerScore(String playerName, int score) {
//             this.playerName = playerName;
//             this.score = score;
//         }
//
//         public String getPlayerName() {
//             return playerName;
//         }
//
//         public int getScore() {
//             return score;
//         }
//     }
// }
//
