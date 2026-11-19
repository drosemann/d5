// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/custom/settings/action/impl/CancelEventAction.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/custom/settings/action/impl/CancelEventAction.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/custom/settings/action/impl/CancelEventAction.java), unveraendert, als Inline-Doku ----
// package net.codingarea.challenges.plugin.challenges.custom.settings.action.impl;
//
// import java.util.Map;
// import net.codingarea.challenges.plugin.challenges.custom.settings.ChallengeExecutionData;
// import net.codingarea.challenges.plugin.challenges.custom.settings.action.ChallengeAction;
// import org.bukkit.Material;
//
// public class CancelEventAction extends ChallengeAction {
//    public static boolean inCanceling;
//
//    public CancelEventAction(String name) {
//       super(name);
//    }
//
//    public static void onPreTrigger() {
//       inCanceling = false;
//    }
//
//    public static boolean shouldCancel() {
//       if (inCanceling) {
//          inCanceling = false;
//          return true;
//       } else {
//          return false;
//       }
//    }
//
//    public Material getMaterial() {
//       return Material.BARRIER;
//    }
//
//    public void execute(ChallengeExecutionData executionData, Map subActions) {
//       inCanceling = true;
//    }
// }
//
