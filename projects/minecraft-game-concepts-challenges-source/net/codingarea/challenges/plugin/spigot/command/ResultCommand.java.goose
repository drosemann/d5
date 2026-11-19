// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/spigot/command/ResultCommand.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/spigot/command/ResultCommand.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/spigot/command/ResultCommand.java), unveraendert, als Inline-Doku ----
// package net.codingarea.challenges.plugin.spigot.command;
//
// import net.anweisen.utilities.bukkit.utils.animation.SoundSample;
// import net.codingarea.challenges.plugin.ChallengeAPI;
// import net.codingarea.challenges.plugin.Challenges;
// import net.codingarea.challenges.plugin.challenges.type.IGoal;
// import net.codingarea.challenges.plugin.challenges.type.abstraction.ForceBattleGoal;
// import net.codingarea.challenges.plugin.content.Message;
// import net.codingarea.challenges.plugin.content.Prefix;
// import net.codingarea.challenges.plugin.utils.bukkit.command.PlayerCommand;
// import org.bukkit.entity.Player;
// import org.jetbrains.annotations.NotNull;
//
// public class ResultCommand implements PlayerCommand {
//    public void onCommand(@NotNull Player player, @NotNull String[] args) throws Exception {
//       if (ChallengeAPI.isPaused()) {
//          Message.forName("timer-not-started").send(player, Prefix.CHALLENGES);
//          SoundSample.BASS_OFF.play(player);
//       } else {
//          IGoal currentGoal = Challenges.getInstance().getChallengeManager().getCurrentGoal();
//          if (currentGoal instanceof ForceBattleGoal) {
//             ForceBattleGoal forceBattleGoal = (ForceBattleGoal)currentGoal;
//             forceBattleGoal.sendResult(player);
//          } else {
//             Message.forName("command-result-no-battle-active").send(player, Prefix.CHALLENGES);
//          }
//       }
//    }
// }
//
