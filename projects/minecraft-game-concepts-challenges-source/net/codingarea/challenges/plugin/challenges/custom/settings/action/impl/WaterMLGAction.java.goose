// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/custom/settings/action/impl/WaterMLGAction.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/custom/settings/action/impl/WaterMLGAction.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/custom/settings/action/impl/WaterMLGAction.java), unveraendert, als Inline-Doku ----
// package net.codingarea.challenges.plugin.challenges.custom.settings.action.impl;
//
// import java.util.Map;
// import net.codingarea.challenges.plugin.challenges.custom.settings.ChallengeExecutionData;
// import net.codingarea.challenges.plugin.challenges.custom.settings.action.ChallengeAction;
// import net.codingarea.challenges.plugin.challenges.implementation.challenge.extraworld.WaterMLGChallenge;
// import net.codingarea.challenges.plugin.challenges.type.abstraction.AbstractChallenge;
// import org.bukkit.Material;
//
// public class WaterMLGAction extends ChallengeAction {
//    public WaterMLGAction(String name) {
//       super(name);
//    }
//
//    public Material getMaterial() {
//       return Material.WATER_BUCKET;
//    }
//
//    public void execute(ChallengeExecutionData executionData, Map subActions) {
//       ((WaterMLGChallenge)AbstractChallenge.getFirstInstance(WaterMLGChallenge.class)).startWorldChallenge();
//    }
// }
//
