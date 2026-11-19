// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/challenge/movement/TrafficLightChallenge.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/challenge/movement/TrafficLightChallenge.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/challenge/movement/TrafficLightChallenge.java), unveraendert, als Inline-Doku ----
// package net.codingarea.challenges.plugin.challenges.implementation.challenge.movement;
//
// import javax.annotation.Nonnull;
// import javax.annotation.Nullable;
// import net.anweisen.utilities.bukkit.utils.animation.SoundSample;
// import net.anweisen.utilities.common.annotations.Since;
// import net.codingarea.challenges.plugin.challenges.type.abstraction.TimedChallenge;
// import net.codingarea.challenges.plugin.challenges.type.helper.ChallengeHelper;
// import net.codingarea.challenges.plugin.content.Message;
// import net.codingarea.challenges.plugin.content.Prefix;
// import net.codingarea.challenges.plugin.management.menu.MenuType;
// import net.codingarea.challenges.plugin.management.menu.generator.categorised.SettingCategory;
// import net.codingarea.challenges.plugin.utils.item.ItemBuilder;
// import net.codingarea.challenges.plugin.utils.misc.BlockUtils;
// import net.codingarea.challenges.plugin.utils.misc.NameHelper;
// import org.bukkit.Material;
// import org.bukkit.boss.BarColor;
// import org.bukkit.entity.Player;
// import org.bukkit.event.EventHandler;
// import org.bukkit.event.EventPriority;
// import org.bukkit.event.player.PlayerMoveEvent;
//
// @Since("1.3")
// public class TrafficLightChallenge extends TimedChallenge {
//    private static final int GREEN = 0;
//    private static final int YELLOW = 1;
//    private static final int RED = 2;
//    private int state;
//
//    public TrafficLightChallenge() {
//       super(MenuType.CHALLENGES, 1, 10, 5);
//       this.setCategory(SettingCategory.MOVEMENT);
//    }
//
//    @Nonnull
//    public ItemBuilder createDisplayItem() {
//       return new ItemBuilder(Material.LIME_STAINED_GLASS, Message.forName("item-traffic-light-challenge"));
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
//    public void onEnable() {
//       this.bossbar.setContent((bossbar, player) -> {
//          switch(this.state) {
//          case 0:
//             bossbar.setColor(BarColor.GREEN);
//             bossbar.setTitle("§8{ §a§l■■■ §8} §8{ §7§l■■■ §8} §8{ §7§l■■■ §8}");
//             break;
//          case 1:
//             bossbar.setColor(BarColor.YELLOW);
//             bossbar.setTitle("§8{ §7§l■■■ §8} §8{ §e§l■■■ §8} §8{ §7§l■■■ §8}");
//             break;
//          case 2:
//             bossbar.setColor(BarColor.RED);
//             bossbar.setTitle("§8{ §7§l■■■ §8} §8{ §7§l■■■ §8} §8{ §c§l■■■ §8}");
//          }
//
//       });
//       this.bossbar.show();
//    }
//
//    public void onDisable() {
//       this.bossbar.hide();
//    }
//
//    protected int getSecondsUntilNextActivation() {
//       return globalRandom.around(this.getValue() * 60, 20);
//    }
//
//    protected void onTimeActivation() {
//       switch(this.state) {
//       case 0:
//          this.state = 1;
//          this.restartTimer(2);
//          SoundSample.BASS_OFF.broadcast();
//          this.bossbar.update();
//          break;
//       case 1:
//          this.state = 2;
//          this.restartTimer(3);
//          SoundSample.BASS_OFF.broadcast();
//          this.bossbar.update();
//          break;
//       case 2:
//          this.state = 0;
//          this.restartTimer();
//          SoundSample.BASS_ON.broadcast();
//          this.bossbar.update();
//       }
//
//    }
//
//    @EventHandler(
//       priority = EventPriority.MONITOR,
//       ignoreCancelled = true
//    )
//    public void onPlayerMove(@Nonnull PlayerMoveEvent event) {
//       if (this.shouldExecuteEffect()) {
//          if (!ignorePlayer(event.getPlayer())) {
//             if (this.state == 2) {
//                if (event.getTo() != null) {
//                   if (!BlockUtils.isSameLocation(event.getFrom(), event.getTo())) {
//                      this.state = 0;
//                      this.bossbar.update();
//                      this.restartTimer();
//                      Player player = event.getPlayer();
//                      Message.forName("traffic-light-challenge-fail").broadcast(Prefix.CHALLENGES, NameHelper.getName(player));
//                      this.kill(player);
//                   }
//                }
//             }
//          }
//       }
//    }
// }
//
