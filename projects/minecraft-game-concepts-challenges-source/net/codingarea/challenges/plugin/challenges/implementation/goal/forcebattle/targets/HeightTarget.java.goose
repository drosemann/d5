// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/goal/forcebattle/targets/HeightTarget.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/goal/forcebattle/targets/HeightTarget.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/goal/forcebattle/targets/HeightTarget.java), unveraendert, als Inline-Doku ----
// package net.codingarea.challenges.plugin.challenges.implementation.goal.forcebattle.targets;
//
// import net.codingarea.challenges.plugin.challenges.implementation.goal.forcebattle.ExtremeForceBattleGoal;
// import net.codingarea.challenges.plugin.content.Message;
// import org.bukkit.entity.Player;
//
// public class HeightTarget extends ForceTarget {
//    public HeightTarget(Integer target) {
//       super(target);
//    }
//
//    public boolean check(Player player) {
//       return player.getLocation().getBlockY() == (Integer)this.target;
//    }
//
//    public Object toMessage() {
//       return this.target;
//    }
//
//    public String getName() {
//       return ((Integer)this.target).toString();
//    }
//
//    public Message getNewTargetMessage() {
//       return Message.forName("extreme-force-battle-new-height");
//    }
//
//    public Message getCompletedMessage() {
//       return Message.forName("extreme-force-battle-reached-height");
//    }
//
//    public ExtremeForceBattleGoal.TargetType getType() {
//       return ExtremeForceBattleGoal.TargetType.HEIGHT;
//    }
//
//    public Message getScoreboardDisplayMessage() {
//       return Message.forName("force-battle-height-target-display");
//    }
// }
//
