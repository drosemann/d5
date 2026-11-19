// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/custom/settings/action/impl/ChangeWorldBorderAction.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/custom/settings/action/impl/ChangeWorldBorderAction.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/custom/settings/action/impl/ChangeWorldBorderAction.java), unveraendert, als Inline-Doku ----
// package net.codingarea.challenges.plugin.challenges.custom.settings.action.impl;
//
// import java.util.Iterator;
// import java.util.Map;
// import net.anweisen.utilities.bukkit.utils.logging.Logger;
// import net.codingarea.challenges.plugin.ChallengeAPI;
// import net.codingarea.challenges.plugin.challenges.custom.settings.ChallengeExecutionData;
// import net.codingarea.challenges.plugin.challenges.custom.settings.action.ChallengeAction;
// import net.codingarea.challenges.plugin.challenges.custom.settings.sub.SubSettingsBuilder;
// import net.codingarea.challenges.plugin.content.Message;
// import net.codingarea.challenges.plugin.utils.item.ItemBuilder;
// import org.bukkit.Material;
// import org.bukkit.World;
// import org.bukkit.WorldBorder;
//
// public class ChangeWorldBorderAction extends ChallengeAction {
//    public ChangeWorldBorderAction(String name) {
//       super(name, (SubSettingsBuilder)SubSettingsBuilder.createValueItem().addModifierSetting("change", new ItemBuilder(Material.MAGENTA_GLAZED_TERRACOTTA, Message.forName("item-custom-action-modify_border-change")), 1, -10, 10));
//    }
//
//    public Material getMaterial() {
//       return Material.STRUCTURE_VOID;
//    }
//
//    public void execute(ChallengeExecutionData executionData, Map subActions) {
//       try {
//          int change = Integer.parseInt(((String[])subActions.get("change"))[0]);
//          Iterator var4 = ChallengeAPI.getGameWorlds().iterator();
//
//          while(var4.hasNext()) {
//             World world = (World)var4.next();
//             WorldBorder border = world.getWorldBorder();
//             if (border.getSize() + (double)change >= 1.0D) {
//                border.setSize(border.getSize() + (double)change);
//             }
//          }
//       } catch (IndexOutOfBoundsException | NumberFormatException var7) {
//          Logger.error("Error while accessing change border action values", var7);
//       }
//
//    }
// }
//
