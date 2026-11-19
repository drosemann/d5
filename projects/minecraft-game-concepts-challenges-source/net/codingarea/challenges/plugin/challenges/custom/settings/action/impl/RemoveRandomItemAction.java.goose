// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/custom/settings/action/impl/RemoveRandomItemAction.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/custom/settings/action/impl/RemoveRandomItemAction.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/custom/settings/action/impl/RemoveRandomItemAction.java), unveraendert, als Inline-Doku ----
// package net.codingarea.challenges.plugin.challenges.custom.settings.action.impl;
//
// import java.util.Map;
// import net.codingarea.challenges.plugin.challenges.custom.settings.action.PlayerTargetAction;
// import net.codingarea.challenges.plugin.challenges.type.helper.SubSettingsHelper;
// import net.codingarea.challenges.plugin.utils.misc.InventoryUtils;
// import org.bukkit.Material;
// import org.bukkit.entity.Player;
//
// public class RemoveRandomItemAction extends PlayerTargetAction {
//    public RemoveRandomItemAction(String name) {
//       super(name, SubSettingsHelper.createEntityTargetSettingsBuilder(false, true));
//    }
//
//    public Material getMaterial() {
//       return Material.DROPPER;
//    }
//
//    public void executeForPlayer(Player player, Map subActions) {
//       InventoryUtils.removeRandomItem(player.getInventory());
//    }
// }
//
