// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/custom/settings/action/impl/InvertHealthAction.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/custom/settings/action/impl/InvertHealthAction.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/custom/settings/action/impl/InvertHealthAction.java), unveraendert, als Inline-Doku ----
// package net.codingarea.challenges.plugin.challenges.custom.settings.action.impl;
//
// import java.util.Map;
// import net.codingarea.challenges.plugin.challenges.custom.settings.action.PlayerTargetAction;
// import net.codingarea.challenges.plugin.challenges.implementation.challenge.miscellaneous.InvertHealthChallenge;
// import net.codingarea.challenges.plugin.challenges.type.helper.SubSettingsHelper;
// import org.bukkit.Material;
// import org.bukkit.entity.Player;
//
// public class InvertHealthAction extends PlayerTargetAction {
//    public InvertHealthAction(String name) {
//       super(name, SubSettingsHelper.createEntityTargetSettingsBuilder(false, true));
//    }
//
//    public Material getMaterial() {
//       return Material.REDSTONE;
//    }
//
//    public void executeForPlayer(Player player, Map subActions) {
//       InvertHealthChallenge.invertHealth(player);
//    }
// }
//
