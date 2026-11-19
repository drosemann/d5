// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/challenge/movement/MoveMouseDamage.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/challenge/movement/MoveMouseDamage.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/challenge/movement/MoveMouseDamage.java), unveraendert, als Inline-Doku ----
// package net.codingarea.challenges.plugin.challenges.implementation.challenge.movement;
//
// import java.util.HashMap;
// import java.util.Iterator;
// import java.util.Map;
// import java.util.AbstractMap.SimpleEntry;
// import java.util.Map.Entry;
// import javax.annotation.Nonnull;
// import javax.annotation.Nullable;
// import net.anweisen.utilities.common.annotations.Since;
// import net.codingarea.challenges.plugin.challenges.type.abstraction.SettingModifier;
// import net.codingarea.challenges.plugin.challenges.type.helper.ChallengeHelper;
// import net.codingarea.challenges.plugin.content.Message;
// import net.codingarea.challenges.plugin.content.Prefix;
// import net.codingarea.challenges.plugin.management.menu.MenuType;
// import net.codingarea.challenges.plugin.management.menu.generator.categorised.SettingCategory;
// import net.codingarea.challenges.plugin.management.scheduler.policy.TimerPolicy;
// import net.codingarea.challenges.plugin.management.scheduler.task.ScheduledTask;
// import net.codingarea.challenges.plugin.utils.item.ItemBuilder;
// import net.codingarea.challenges.plugin.utils.misc.NameHelper;
// import org.bukkit.Bukkit;
// import org.bukkit.Material;
// import org.bukkit.entity.Player;
//
// @Since("2.0")
// public class MoveMouseDamage extends SettingModifier {
//    private final Map lastView = new HashMap();
//
//    public MoveMouseDamage() {
//       super(MenuType.CHALLENGES, 60);
//       this.setCategory(SettingCategory.MOVEMENT);
//    }
//
//    @Nonnull
//    public ItemBuilder createDisplayItem() {
//       return new ItemBuilder(Material.COMPASS, Message.forName("item-no-mouse-move-challenge"));
//    }
//
//    @Nullable
//    protected String[] getSettingsDescription() {
//       return Message.forName("item-heart-damage-description").asArray((float)this.getValue() / 2.0F);
//    }
//
//    public void playValueChangeTitle() {
//       ChallengeHelper.playChallengeHeartsValueChangeTitle(this, this.getValue() / 2);
//    }
//
//    @ScheduledTask(
//       ticks = 1,
//       timerPolicy = TimerPolicy.ALWAYS
//    )
//    public void onTick() {
//       if (!this.shouldExecuteEffect()) {
//          this.lastView.clear();
//       } else {
//          Iterator var1 = Bukkit.getOnlinePlayers().iterator();
//
//          while(true) {
//             while(var1.hasNext()) {
//                Player player = (Player)var1.next();
//                if (ignorePlayer(player)) {
//                   this.lastView.remove(player.getUniqueId());
//                } else if (player.getNoDamageTicks() <= 0) {
//                   float yaw = player.getLocation().getYaw();
//                   float pitch = player.getLocation().getPitch();
//                   Entry pair = (Entry)this.lastView.getOrDefault(player.getUniqueId(), new SimpleEntry(yaw, pitch));
//                   this.lastView.put(player.getUniqueId(), pair);
//                   if (yaw != (Float)pair.getKey() || pitch != (Float)pair.getValue()) {
//                      Bukkit.getScheduler().runTask(plugin, () -> {
//                         if (player.getNoDamageTicks() <= 0) {
//                            Message.forName("no-mouse-move-failed").broadcast(Prefix.CHALLENGES, NameHelper.getName(player));
//                            player.damage((double)this.getValue());
//                            player.setNoDamageTicks(5);
//                            Bukkit.getScheduler().runTaskLater(plugin, () -> {
//                               this.lastView.remove(player.getUniqueId());
//                            }, 3L);
//                         }
//                      });
//                   }
//                }
//             }
//
//             return;
//          }
//       }
//    }
// }
//
