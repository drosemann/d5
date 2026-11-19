// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/goal/FirstOneToDieGoal.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/goal/FirstOneToDieGoal.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/goal/FirstOneToDieGoal.java), unveraendert, als Inline-Doku ----
// package net.codingarea.challenges.plugin.challenges.implementation.goal;
//
// import java.util.List;
// import javax.annotation.Nonnull;
// import net.anweisen.utilities.common.annotations.Since;
// import net.codingarea.challenges.plugin.ChallengeAPI;
// import net.codingarea.challenges.plugin.challenges.type.abstraction.SettingGoal;
// import net.codingarea.challenges.plugin.content.Message;
// import net.codingarea.challenges.plugin.management.menu.generator.categorised.SettingCategory;
// import net.codingarea.challenges.plugin.management.server.ChallengeEndCause;
// import net.codingarea.challenges.plugin.utils.item.ItemBuilder;
// import org.bukkit.Material;
// import org.bukkit.entity.Player;
// import org.bukkit.event.EventHandler;
// import org.bukkit.event.EventPriority;
// import org.bukkit.event.entity.PlayerDeathEvent;
//
// @Since("2.0")
// public class FirstOneToDieGoal extends SettingGoal {
//    private Player winner;
//
//    public FirstOneToDieGoal() {
//       this.setCategory(SettingCategory.FASTEST_TIME);
//    }
//
//    @Nonnull
//    public ItemBuilder createDisplayItem() {
//       return new ItemBuilder(Material.STONE_SWORD, Message.forName("item-first-one-to-die-goal"));
//    }
//
//    public void getWinnersOnEnd(@Nonnull List winners) {
//       if (this.winner != null) {
//          winners.add(this.winner);
//       }
//
//    }
//
//    protected void onDisable() {
//       this.winner = null;
//    }
//
//    @EventHandler(
//       priority = EventPriority.HIGH,
//       ignoreCancelled = true
//    )
//    public void onDeath(@Nonnull PlayerDeathEvent event) {
//       if (this.shouldExecuteEffect()) {
//          this.winner = event.getEntity();
//          ChallengeAPI.endChallenge(ChallengeEndCause.GOAL_REACHED);
//       }
//    }
// }
//
