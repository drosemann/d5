// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/custom/settings/action/impl/UncraftInventoryAction.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/custom/settings/action/impl/UncraftInventoryAction.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/custom/settings/action/impl/UncraftInventoryAction.java), unveraendert, als Inline-Doku ----
// package net.codingarea.challenges.plugin.challenges.custom.settings.action.impl;
//
// import java.util.Map;
// import net.codingarea.challenges.plugin.challenges.custom.settings.action.EntityTargetAction;
// import net.codingarea.challenges.plugin.challenges.implementation.challenge.inventory.UncraftItemsChallenge;
// import net.codingarea.challenges.plugin.challenges.type.helper.SubSettingsHelper;
// import org.bukkit.Material;
// import org.bukkit.entity.Entity;
// import org.bukkit.entity.Player;
//
// public class UncraftInventoryAction extends EntityTargetAction {
//    public UncraftInventoryAction(String name) {
//       super(name, SubSettingsHelper.createEntityTargetSettingsBuilder(false));
//    }
//
//    public void executeFor(Entity entity, Map subActions) {
//       if (entity instanceof Player) {
//          Player player = (Player)entity;
//          UncraftItemsChallenge.uncraftInventory(player);
//       }
//
//    }
//
//    public Material getMaterial() {
//       return Material.CRAFTING_TABLE;
//    }
// }
//
