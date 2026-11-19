// Goose-Port-Spiegel von: projects/minecraft-plugins-server-systems-minecraft-minigame-template/src/main/java/PowerUpManager.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-plugins-server-systems-minecraft-minigame-template/src/main/java/PowerUpManager.java");
}

// ---- Original-Code (projects/minecraft-plugins-server-systems-minecraft-minigame-template/src/main/java/PowerUpManager.java), unveraendert, als Inline-Doku ----
// import org.bukkit.entity.Player;
// import java.util.HashMap;
// import java.util.Map;
//
// public class PowerUpManager {
//     private final Map<Player, PowerUpType> activePowerUps = new HashMap<>();
//
//     public void activatePowerUp(Player player, PowerUpType type) {
//         activePowerUps.put(player, type);
//         switch (type) {
//             case SPEED_BOOST:
//                 applySpeedBoost(player);
//                 break;
//             case DOUBLE_POINTS:
//                 // Logic for double points
//                 break;
//             case SHIELD:
//                 // Logic for shield
//                 break;
//             case MAGNET:
//                 // Logic for magnet
//                 break;
//             case EXTRA_LIFE:
//                 // Logic for extra life
//                 break;
//         }
//     }
//
//     private void applySpeedBoost(Player player) {
//         // Increase player speed (example: set walk speed)
//         player.setWalkSpeed(0.3f); // Default is 0.2f
//     }
//
//     public void deactivatePowerUp(Player player) {
//         PowerUpType type = activePowerUps.remove(player);
//         if (type != null) {
//             switch (type) {
//                 case SPEED_BOOST:
//                     player.setWalkSpeed(0.2f); // Reset to default speed
//                     break;
//                 // Handle other power-up deactivations
//             }
//         }
//     }
//
//     public enum PowerUpType {
//         SPEED_BOOST,
//         DOUBLE_POINTS,
//         SHIELD,
//         MAGNET,
//         EXTRA_LIFE
//     }
// } 
