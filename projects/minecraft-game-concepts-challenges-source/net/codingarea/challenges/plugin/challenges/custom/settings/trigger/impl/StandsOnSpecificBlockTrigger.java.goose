// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/custom/settings/trigger/impl/StandsOnSpecificBlockTrigger.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/custom/settings/trigger/impl/StandsOnSpecificBlockTrigger.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/custom/settings/trigger/impl/StandsOnSpecificBlockTrigger.java), unveraendert, als Inline-Doku ----
// package net.codingarea.challenges.plugin.challenges.custom.settings.trigger.impl;
//
// import net.codingarea.challenges.plugin.challenges.custom.settings.sub.SubSettingsBuilder;
// import net.codingarea.challenges.plugin.challenges.custom.settings.trigger.ChallengeTrigger;
// import net.codingarea.challenges.plugin.challenges.type.helper.SubSettingsHelper;
// import net.codingarea.challenges.plugin.utils.misc.BlockUtils;
// import org.bukkit.Material;
// import org.bukkit.block.Block;
// import org.bukkit.event.EventHandler;
// import org.bukkit.event.EventPriority;
// import org.bukkit.event.player.PlayerMoveEvent;
//
// public class StandsOnSpecificBlockTrigger extends ChallengeTrigger {
//    public StandsOnSpecificBlockTrigger(String name) {
//       super(name, (SubSettingsBuilder)SubSettingsHelper.createBlockSettingsBuilder());
//    }
//
//    public Material getMaterial() {
//       return Material.PACKED_ICE;
//    }
//
//    @EventHandler(
//       priority = EventPriority.HIGH,
//       ignoreCancelled = true
//    )
//    public void onMove(PlayerMoveEvent event) {
//       if (!BlockUtils.isSameBlockLocation(event.getTo(), event.getFrom())) {
//          Block blockBelow = BlockUtils.getBlockBelow(event.getTo());
//          if (blockBelow != null) {
//             this.createData().entity(event.getPlayer()).event(event).block(blockBelow.getType()).execute();
//          }
//       }
//    }
// }
//
