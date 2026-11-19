// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/challenge/miscellaneous/InvertHealthChallenge.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/challenge/miscellaneous/InvertHealthChallenge.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/challenge/miscellaneous/InvertHealthChallenge.java), unveraendert, als Inline-Doku ----
// package net.codingarea.challenges.plugin.challenges.implementation.challenge.miscellaneous;
//
// import java.util.Iterator;
// import javax.annotation.Nonnull;
// import javax.annotation.Nullable;
// import net.anweisen.utilities.bukkit.utils.animation.SoundSample;
// import net.anweisen.utilities.common.annotations.Since;
// import net.codingarea.challenges.plugin.challenges.type.abstraction.TimedChallenge;
// import net.codingarea.challenges.plugin.challenges.type.helper.ChallengeHelper;
// import net.codingarea.challenges.plugin.content.Message;
// import net.codingarea.challenges.plugin.content.Prefix;
// import net.codingarea.challenges.plugin.management.challenges.annotations.ExcludeFromRandomChallenges;
// import net.codingarea.challenges.plugin.management.menu.MenuType;
// import net.codingarea.challenges.plugin.utils.item.ItemBuilder;
// import org.bukkit.Bukkit;
// import org.bukkit.Material;
// import org.bukkit.entity.Player;
//
// @Since("2.0")
// @ExcludeFromRandomChallenges
// public class InvertHealthChallenge extends TimedChallenge {
//    public InvertHealthChallenge() {
//       super(MenuType.CHALLENGES, 1, 10, 5, false);
//    }
//
//    public static void invertHealth(Player player) {
//       double health = player.getMaxHealth() - player.getHealth();
//       if (health <= 0.0D) {
//          ChallengeHelper.kill(player);
//       } else {
//          player.setHealth(health);
//       }
//    }
//
//    @Nonnull
//    public ItemBuilder createDisplayItem() {
//       return new ItemBuilder(Material.POPPY, Message.forName("item-invert-health-challenge"));
//    }
//
//    @Nullable
//    protected String[] getSettingsDescription() {
//       return Message.forName("item-time-seconds-range-description").asArray(this.getValue() * 60 - 20, this.getValue() * 60 + 20);
//    }
//
//    public void playValueChangeTitle() {
//       ChallengeHelper.playChallengeSecondsRangeValueChangeTitle(this, this.getValue() * 60 - 20, this.getValue() * 60 + 20);
//    }
//
//    protected int getSecondsUntilNextActivation() {
//       return globalRandom.around(this.getValue() * 60, 20);
//    }
//
//    protected void onTimeActivation() {
//       SoundSample.PLOP.broadcast();
//       Message.forName("health-inverted").broadcast(Prefix.CHALLENGES);
//       Iterator var1 = Bukkit.getOnlinePlayers().iterator();
//
//       while(var1.hasNext()) {
//          Player player = (Player)var1.next();
//          if (!ignorePlayer(player)) {
//             invertHealth(player);
//          }
//       }
//
//       this.restartTimer();
//    }
// }
//
