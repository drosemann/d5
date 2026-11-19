// Goose-Port-Spiegel von: projects/minecraft-plugins-server-systems-minecraft-minigame-template/src/main/java/LevelManager.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-plugins-server-systems-minecraft-minigame-template/src/main/java/LevelManager.java");
}

// ---- Original-Code (projects/minecraft-plugins-server-systems-minecraft-minigame-template/src/main/java/LevelManager.java), unveraendert, als Inline-Doku ----
// import java.util.ArrayList;
//
// public class LevelManager {
//     private ArrayList<Level> levels;
//     private int currentLevelIndex;
//
//     public LevelManager() {
//         levels = new ArrayList<>();
//         currentLevelIndex = 0;
//     }
//
//     public void addLevel(Level level) {
//         levels.add(level);
//     }
//
//     public Level getCurrentLevel() {
//         if (currentLevelIndex < levels.size()) {
//             return levels.get(currentLevelIndex);
//         }
//         return null; // No more levels
//     }
//
//     public boolean advanceToNextLevel() {
//         if (currentLevelIndex + 1 < levels.size()) {
//             currentLevelIndex++;
//             return true;
//         }
//         return false; // No more levels to advance to
//     }
//
//     public void reset() {
//         currentLevelIndex = 0;
//     }
//
//     public static class Level {
//         private final String name;
//         private final String description;
//
//         public Level(String name, String description) {
//             this.name = name;
//             this.description = description;
//         }
//
//         public String getName() {
//             return name;
//         }
//
//         public String getDescription() {
//             return description;
//         }
//     }
// }
//
