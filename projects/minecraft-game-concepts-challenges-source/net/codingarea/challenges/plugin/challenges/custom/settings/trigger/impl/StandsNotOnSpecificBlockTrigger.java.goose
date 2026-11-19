// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/custom/settings/trigger/impl/StandsNotOnSpecificBlockTrigger.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/custom/settings/trigger/impl/StandsNotOnSpecificBlockTrigger.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/custom/settings/trigger/impl/StandsNotOnSpecificBlockTrigger.java), unveraendert, als Inline-Doku ----
// package net.codingarea.challenges.plugin.challenges.custom.settings.trigger.impl;
//
// import java.util.Arrays;
// import java.util.Iterator;
// import java.util.LinkedList;
// import java.util.List;
// import net.codingarea.challenges.plugin.challenges.custom.settings.sub.SubSettingsBuilder;
// import net.codingarea.challenges.plugin.challenges.custom.settings.trigger.ChallengeTrigger;
// import net.codingarea.challenges.plugin.challenges.type.helper.SubSettingsHelper;
// import net.codingarea.challenges.plugin.utils.misc.BlockUtils;
// import net.codingarea.challenges.plugin.utils.misc.ExperimentalUtils;
// import org.bukkit.Material;
// import org.bukkit.block.Block;
// import org.bukkit.event.EventHandler;
// import org.bukkit.event.EventPriority;
// import org.bukkit.event.player.PlayerMoveEvent;
//
// public class StandsNotOnSpecificBlockTrigger extends ChallengeTrigger {
//    public StandsNotOnSpecificBlockTrigger(String name) {
//       super(name, (SubSettingsBuilder)SubSettingsHelper.createBlockSettingsBuilder());
//    }
//
//    public Material getMaterial() {
//       return Material.MAGMA_BLOCK;
//    }
//
//    @EventHandler(
//       priority = EventPriority.HIGH,
//       ignoreCancelled = true
//    )
//    public void onMove(PlayerMoveEvent event) {
//       if (!BlockUtils.isSameBlockLocation(event.getTo(), event.getFrom())) {
//          if (event.getTo() != null) {
//             Block blockBelow = BlockUtils.getBlockBelow(event.getTo());
//             if (blockBelow != null) {
//                Material type = blockBelow.getType();
//                List materials = new LinkedList(Arrays.asList(ExperimentalUtils.getMaterials()));
//                materials.remove(type);
//                materials.removeIf((materialx) -> {
//                   return !materialx.isBlock() || !materialx.isItem();
//                });
//                List names = new LinkedList();
//                Iterator var6 = materials.iterator();
//
//                while(var6.hasNext()) {
//                   Material material = (Material)var6.next();
//                   names.add(material.name());
//                }
//
//                this.createData().entity(event.getPlayer()).event(event).data("block", (List)names).execute();
//             }
//          }
//       }
//    }
// }
//
