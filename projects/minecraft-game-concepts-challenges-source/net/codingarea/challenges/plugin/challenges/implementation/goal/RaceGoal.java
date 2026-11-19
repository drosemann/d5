package net.codingarea.challenges.plugin.challenges.implementation.goal;

import java.util.Collections;
import java.util.List;
import net.anweisen.utilities.common.annotations.Since;
import net.anweisen.utilities.common.collection.IRandom;
import net.anweisen.utilities.common.config.Document;
import net.codingarea.challenges.plugin.ChallengeAPI;
import net.codingarea.challenges.plugin.Challenges;
import net.codingarea.challenges.plugin.challenges.type.abstraction.SettingModifierGoal;
import net.codingarea.challenges.plugin.challenges.type.helper.ChallengeHelper;
import net.codingarea.challenges.plugin.content.Message;
import net.codingarea.challenges.plugin.content.Prefix;
import net.codingarea.challenges.plugin.management.menu.MenuType;
import net.codingarea.challenges.plugin.management.menu.generator.categorised.SettingCategory;
import net.codingarea.challenges.plugin.management.scheduler.task.ScheduledTask;
import net.codingarea.challenges.plugin.management.server.ChallengeEndCause;
import net.codingarea.challenges.plugin.utils.item.ItemBuilder;
import net.codingarea.challenges.plugin.utils.misc.BlockUtils;
import net.codingarea.challenges.plugin.utils.misc.MinecraftNameWrapper;
import net.codingarea.challenges.plugin.utils.misc.NameHelper;
import net.codingarea.challenges.plugin.utils.misc.ParticleUtils;
import org.bukkit.Color;
import org.bukkit.Location;
import org.bukkit.Material;
import org.bukkit.World;
import org.bukkit.Particle.DustOptions;
import org.bukkit.World.Environment;
import org.bukkit.boss.BarColor;
import org.bukkit.event.EventHandler;
import org.bukkit.event.EventPriority;
import org.bukkit.event.player.PlayerMoveEvent;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Since("2.1.0")
public class RaceGoal extends SettingModifierGoal {
   protected long seed = IRandom.create().getSeed();
   private Location goal;

   public RaceGoal() {
      super(MenuType.GOAL, 1, 30, 5);
      this.setCategory(SettingCategory.FASTEST_TIME);
   }

   public void getWinnersOnEnd(@NotNull List winners) {
   }

   protected void onEnable() {
      this.reloadGoalLocation();
      this.bossbar.setContent((bar, player) -> {
         bar.setColor(BarColor.GREEN);
         if (player.getWorld() == this.goal.getWorld()) {
            Location relativeGoal = this.goal.clone();
            relativeGoal.setY(player.getLocation().getY());
            relativeGoal.add(0.5D, 0.0D, 0.5D);
            int distance = (int)Math.round(player.getLocation().distance(relativeGoal));
            bar.setTitle(Message.forName("bossbar-race-goal-info").asString(this.goal.getBlockX(), this.goal.getBlockZ(), distance));
         } else {
            bar.setTitle(Message.forName("bossbar-race-goal").asString(this.goal.getBlockX(), this.goal.getBlockZ()));
         }

      });
      this.bossbar.show();
   }

   protected void onDisable() {
      this.bossbar.hide();
      this.goal = null;
   }

   public void playValueChangeTitle() {
      ChallengeHelper.playChangeChallengeValueTitle(this, (Object)Message.forName("subtitle-range-blocks").asString(this.getValue() * 100));
   }

   @Nullable
   protected String[] getSettingsDescription() {
      return Message.forName("item-range-blocks-description").asArray(this.getValue() * 100);
   }

   protected void onValueChange() {
      this.reloadGoalLocation();
      this.bossbar.update();
   }

   @NotNull
   public ItemBuilder createDisplayItem() {
      return new ItemBuilder(Material.STRUCTURE_VOID, Message.forName("item-race-goal"));
   }

   @ScheduledTask(
      ticks = 20
   )
   public void onSecond() {
      if (this.goal != null) {
         this.bossbar.update();
         broadcast((player) -> {
            Location relativeGoal = this.goal.clone();
            relativeGoal.setY(player.getLocation().getY());
            relativeGoal.add(0.5D, 0.0D, 0.5D);
            ParticleUtils.drawLine(player, player.getLocation(), relativeGoal, MinecraftNameWrapper.REDSTONE_DUST, new DustOptions(Color.LIME, 1.0F), 1, 0.5D, 50);
            if (player.getWorld() == this.goal.getWorld()) {
               if (!(player.getLocation().distance(relativeGoal) > 20.0D)) {
                  ParticleUtils.spawnParticleCircleAroundRadius(Challenges.getInstance(), relativeGoal, MinecraftNameWrapper.INSTANT_EFFECT, 0.75D, 0.5D);
               }
            }
         });
      }
   }

   @EventHandler(
      priority = EventPriority.HIGH,
      ignoreCancelled = true
   )
   public void onMove(PlayerMoveEvent event) {
      if (this.shouldExecuteEffect()) {
         if (!ignorePlayer(event.getPlayer())) {
            if (!BlockUtils.isSameBlockLocationIgnoreHeight(event.getFrom(), event.getTo())) {
               if (event.getTo().getWorld() == this.goal.getWorld()) {
                  if (event.getTo() != null) {
                     if (BlockUtils.isSameBlockLocationIgnoreHeight(event.getTo(), this.goal)) {
                        Message.forName("race-goal-reached").broadcast(Prefix.CHALLENGES, NameHelper.getName(event.getPlayer()));
                        ChallengeAPI.endChallenge(ChallengeEndCause.GOAL_REACHED, () -> {
                           return Collections.singletonList(event.getPlayer());
                        });
                        ParticleUtils.spawnParticleCircleAroundRadius(Challenges.getInstance(), event.getTo(), MinecraftNameWrapper.ENTITY_EFFECT, 0.75D, 2.0D);
                     }

                  }
               }
            }
         }
      }
   }

   private void reloadGoalLocation() {
      World world = ChallengeAPI.getGameWorld(Environment.NORMAL);
      int y = 999;
      IRandom iRandom = IRandom.create(this.seed);
      int max = this.getValue() * 100 - iRandom.nextInt(this.getValue() - this.getValue() / 2);
      int x = iRandom.nextInt(max * 2) - max;
      int z = iRandom.nextInt(max * 2) - max;
      this.goal = new Location(world, (double)x, (double)y, (double)z);
   }

   public void loadGameState(@NotNull Document document) {
      if (!document.contains("seed")) {
         this.seed = IRandom.create().getSeed();
      } else {
         long seed = document.getLong("seed");
         if (this.seed != seed) {
            this.seed = seed;
            if (this.isEnabled()) {
               this.reloadGoalLocation();
               this.bossbar.update();
            }
         }
      }
   }

   public void writeGameState(@NotNull Document document) {
      document.set("seed", this.seed);
   }
}
