// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/goal/LastManStandingGoal.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/goal/LastManStandingGoal.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/goal/LastManStandingGoal.java), unveraendert, als Inline-Doku ----
// package net.codingarea.challenges.plugin.challenges.implementation.goal;
//
// import java.util.Iterator;
// import java.util.List;
// import javax.annotation.Nonnull;
// import net.anweisen.utilities.common.annotations.Since;
// import net.codingarea.challenges.plugin.ChallengeAPI;
// import net.codingarea.challenges.plugin.challenges.type.abstraction.SettingGoal;
// import net.codingarea.challenges.plugin.content.Message;
// import net.codingarea.challenges.plugin.management.server.ChallengeEndCause;
// import net.codingarea.challenges.plugin.utils.item.ItemBuilder;
// import org.bukkit.Bukkit;
// import org.bukkit.GameMode;
// import org.bukkit.Material;
// import org.bukkit.entity.Player;
// import org.bukkit.event.EventHandler;
// import org.bukkit.event.EventPriority;
// import org.bukkit.event.entity.PlayerDeathEvent;
// import org.bukkit.event.player.PlayerQuitEvent;
//
// @Since("2.0")
// public class LastManStandingGoal extends SettingGoal {
//    private Player winner;
//
//    @Nonnull
//    public ItemBuilder createDisplayItem() {
//       return new ItemBuilder(Material.IRON_HELMET, Message.forName("item-last-man-standing-goal"));
//    }
//
//    public void getWinnersOnEnd(@Nonnull List winners) {
//       this.determineWinner();
//       if (this.winner != null) {
//          winners.add(this.winner);
//       }
//
//    }
//
//    @EventHandler(
//       priority = EventPriority.NORMAL,
//       ignoreCancelled = true
//    )
//    public void onPlayerDeath(@Nonnull PlayerDeathEvent event) {
//       if (this.isEnabled()) {
//          this.checkEnd();
//       }
//    }
//
//    @EventHandler(
//       priority = EventPriority.MONITOR,
//       ignoreCancelled = true
//    )
//    public void onLeave(@Nonnull PlayerQuitEvent event) {
//       if (this.isEnabled()) {
//          this.checkEnd();
//       }
//    }
//
//    protected void determineWinner() {
//       int playersLiving = 0;
//       Iterator var2 = Bukkit.getOnlinePlayers().iterator();
//
//       while(var2.hasNext()) {
//          Player player = (Player)var2.next();
//          if (player.getGameMode() != GameMode.SPECTATOR) {
//             ++playersLiving;
//             this.winner = player;
//          }
//       }
//
//       if (playersLiving != 1) {
//          this.winner = null;
//       }
//
//    }
//
//    protected void checkEnd() {
//       this.determineWinner();
//       if (this.winner != null) {
//          ChallengeAPI.endChallenge(ChallengeEndCause.GOAL_REACHED);
//       }
//    }
// }
//
