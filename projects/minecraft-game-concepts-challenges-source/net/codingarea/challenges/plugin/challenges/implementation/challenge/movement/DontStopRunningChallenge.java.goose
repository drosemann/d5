// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/challenge/movement/DontStopRunningChallenge.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/challenge/movement/DontStopRunningChallenge.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/challenge/movement/DontStopRunningChallenge.java), unveraendert, als Inline-Doku ----
// package net.codingarea.challenges.plugin.challenges.implementation.challenge.movement;
//
// import java.util.ArrayList;
// import java.util.HashMap;
// import java.util.Iterator;
// import java.util.Map;
// import javax.annotation.Nonnull;
// import net.anweisen.utilities.common.annotations.Since;
// import net.codingarea.challenges.plugin.challenges.type.abstraction.SettingModifier;
// import net.codingarea.challenges.plugin.content.Message;
// import net.codingarea.challenges.plugin.content.Prefix;
// import net.codingarea.challenges.plugin.management.menu.MenuType;
// import net.codingarea.challenges.plugin.management.menu.generator.categorised.SettingCategory;
// import net.codingarea.challenges.plugin.management.scheduler.task.ScheduledTask;
// import net.codingarea.challenges.plugin.utils.item.ItemBuilder;
// import net.codingarea.challenges.plugin.utils.misc.NameHelper;
// import org.bukkit.Material;
// import org.bukkit.boss.BarColor;
// import org.bukkit.entity.Player;
// import org.bukkit.event.EventHandler;
// import org.bukkit.event.EventPriority;
// import org.bukkit.event.player.PlayerMoveEvent;
//
// @Since("2.0.2")
// public class DontStopRunningChallenge extends SettingModifier {
//    private static final int YELLOW = 5;
//    private static final int RED = 3;
//    private final Map playerStandingCount = new HashMap();
//
//    public DontStopRunningChallenge() {
//       super(MenuType.CHALLENGES, 3, 30, 10);
//       this.setCategory(SettingCategory.MOVEMENT);
//    }
//
//    protected void onEnable() {
//       this.bossbar.setContent((bossbar, player) -> {
//          int count = (Integer)this.playerStandingCount.getOrDefault(player, 1);
//          int timeLeft = this.getValue() - count + 1;
//          if (timeLeft <= 3) {
//             bossbar.setColor(BarColor.RED);
//          } else if (timeLeft <= 5) {
//             bossbar.setColor(BarColor.YELLOW);
//          } else {
//             bossbar.setColor(BarColor.GREEN);
//          }
//
//          String time = "§e" + timeLeft + " §7" + (timeLeft == 1 ? Message.forName("second").asString() : Message.forName("seconds").asString());
//          bossbar.setTitle(Message.forName("bossbar-dont-stop-running").asString(time));
//       });
//       this.bossbar.show();
//    }
//
//    protected void onDisable() {
//       this.bossbar.hide();
//    }
//
//    @Nonnull
//    public ItemBuilder createDisplayItem() {
//       return new ItemBuilder(Material.SADDLE, Message.forName("item-dont-stop-running-challenge"));
//    }
//
//    @ScheduledTask(
//       ticks = 20
//    )
//    public void onSecond() {
//       this.removeOfflinePlayers();
//       this.countUpOrKillEveryone();
//       this.bossbar.update();
//    }
//
//    private void removeOfflinePlayers() {
//       Iterator var1 = (new ArrayList(this.playerStandingCount.keySet())).iterator();
//
//       while(true) {
//          Player player;
//          do {
//             if (!var1.hasNext()) {
//                return;
//             }
//
//             player = (Player)var1.next();
//          } while(player.isOnline() && !ignorePlayer(player));
//
//          this.playerStandingCount.remove(player);
//       }
//    }
//
//    private void countUpOrKillEveryone() {
//       broadcastFiltered((player) -> {
//          Integer count = (Integer)this.playerStandingCount.getOrDefault(player, 0);
//          if (count >= this.getValue()) {
//             Message.forName("stopped-moving").broadcast(Prefix.CHALLENGES, NameHelper.getName(player));
//             this.playerStandingCount.remove(player);
//             this.kill(player);
//          } else {
//             this.playerStandingCount.put(player, count + 1);
//          }
//       });
//    }
//
//    @EventHandler(
//       priority = EventPriority.MONITOR,
//       ignoreCancelled = true
//    )
//    public void onPlayerMove(@Nonnull PlayerMoveEvent event) {
//       if (this.shouldExecuteEffect()) {
//          if (!ignorePlayer(event.getPlayer())) {
//             if (event.getTo() != null) {
//                if (event.getFrom().getX() != event.getTo().getX() || event.getFrom().getZ() != event.getTo().getZ() || event.getFrom().getY() != event.getTo().getY()) {
//                   this.playerStandingCount.remove(event.getPlayer());
//                }
//             }
//          }
//       }
//    }
// }
//
