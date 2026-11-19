// Goose-Port-Spiegel von: projects/minecraft-plugins-server-systems-minigametemplate-java/src/main/java/anti_break.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-plugins-server-systems-minigametemplate-java/src/main/java/anti_break.java");
}

// ---- Original-Code (projects/minecraft-plugins-server-systems-minigametemplate-java/src/main/java/anti_break.java), unveraendert, als Inline-Doku ----
// import org.bukkit.event.EventHandler;
// import org.bukkit.event.Listener;
// import org.bukkit.event.block.BlockBreakEvent;
//
// public class BlockBreakListener implements Listener {
//     @EventHandler
//     public void onBlockBreak(BlockBreakEvent event) {
//         Player player = event.getPlayer();
//         // Überprüfe, ob der Block während des Spiels platziert wurde
//         if (!isPlacedDuringGame(event.getBlock())) {
//             event.setCancelled(true);
//             player.sendMessage("Du kannst diesen Block nicht abbauen!");
//         }
//     }
//
//     private boolean isPlacedDuringGame(Block block) {
//         // Implementiere die Logik, um zu überprüfen, ob der Block während des Spiels platziert wurde
//         return false;
//     }
// }
//
