// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/custom/settings/trigger/impl/MoveDownTrigger.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/custom/settings/trigger/impl/MoveDownTrigger.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/custom/settings/trigger/impl/MoveDownTrigger.java), unveraendert, als Inline-Doku ----
// package net.codingarea.challenges.plugin.challenges.custom.settings.trigger.impl;
//
// import net.codingarea.challenges.plugin.challenges.custom.settings.trigger.ChallengeTrigger;
// import org.bukkit.Material;
// import org.bukkit.event.EventHandler;
// import org.bukkit.event.EventPriority;
// import org.bukkit.event.player.PlayerMoveEvent;
//
// public class MoveDownTrigger extends ChallengeTrigger {
//    public MoveDownTrigger(String name) {
//       super(name);
//    }
//
//    public Material getMaterial() {
//       return Material.NETHER_BRICK_STAIRS;
//    }
//
//    @EventHandler(
//       priority = EventPriority.HIGH,
//       ignoreCancelled = true
//    )
//    public void onMove(PlayerMoveEvent event) {
//       if (event.getTo() != null) {
//          if (event.getTo().getBlockY() < event.getFrom().getBlockY()) {
//             this.createData().entity(event.getPlayer()).event(event).execute();
//          }
//
//       }
//    }
// }
//
