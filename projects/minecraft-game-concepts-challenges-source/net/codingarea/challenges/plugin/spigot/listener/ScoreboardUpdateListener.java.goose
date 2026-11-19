// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/spigot/listener/ScoreboardUpdateListener.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/spigot/listener/ScoreboardUpdateListener.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/spigot/listener/ScoreboardUpdateListener.java), unveraendert, als Inline-Doku ----
// package net.codingarea.challenges.plugin.spigot.listener;
//
// import net.codingarea.challenges.plugin.Challenges;
// import net.codingarea.challenges.plugin.management.server.scoreboard.ChallengeScoreboard;
// import net.codingarea.challenges.plugin.spigot.events.PlayerIgnoreStatusChangeEvent;
// import org.bukkit.Bukkit;
// import org.bukkit.event.EventHandler;
// import org.bukkit.event.Listener;
//
// public class ScoreboardUpdateListener implements Listener {
//    @EventHandler
//    public void onIgnoredChange(PlayerIgnoreStatusChangeEvent event) {
//       Bukkit.getScheduler().runTask(Challenges.getInstance(), () -> {
//          ChallengeScoreboard currentScoreboard = Challenges.getInstance().getScoreboardManager().getCurrentScoreboard();
//          if (currentScoreboard != null) {
//             currentScoreboard.update();
//          }
//
//       });
//    }
// }
//
