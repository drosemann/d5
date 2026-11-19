// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/custom/settings/action/impl/JumpAndRunAction.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/custom/settings/action/impl/JumpAndRunAction.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/custom/settings/action/impl/JumpAndRunAction.java), unveraendert, als Inline-Doku ----
// package net.codingarea.challenges.plugin.challenges.custom.settings.action.impl;
//
// import java.util.Map;
// import net.codingarea.challenges.plugin.challenges.custom.settings.ChallengeExecutionData;
// import net.codingarea.challenges.plugin.challenges.custom.settings.action.ChallengeAction;
// import net.codingarea.challenges.plugin.challenges.implementation.challenge.extraworld.JumpAndRunChallenge;
// import net.codingarea.challenges.plugin.challenges.type.abstraction.AbstractChallenge;
// import org.bukkit.Material;
//
// public class JumpAndRunAction extends ChallengeAction {
//    public JumpAndRunAction(String name) {
//       super(name);
//    }
//
//    public Material getMaterial() {
//       return Material.ACACIA_STAIRS;
//    }
//
//    public void execute(ChallengeExecutionData executionData, Map subActions) {
//       ((JumpAndRunChallenge)AbstractChallenge.getFirstInstance(JumpAndRunChallenge.class)).startWorldChallenge();
//    }
// }
//
