package net.codingarea.challenges.plugin.challenges.implementation.challenge.time;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import net.anweisen.utilities.common.annotations.Since;
import net.codingarea.challenges.plugin.challenges.type.abstraction.SettingModifier;
import net.codingarea.challenges.plugin.challenges.type.helper.ChallengeHelper;
import net.codingarea.challenges.plugin.content.Message;
import net.codingarea.challenges.plugin.management.menu.MenuType;
import net.codingarea.challenges.plugin.management.menu.generator.categorised.SettingCategory;
import net.codingarea.challenges.plugin.management.scheduler.task.ScheduledTask;
import net.codingarea.challenges.plugin.utils.item.ItemBuilder;
import org.bukkit.Material;
import org.bukkit.block.Biome;
import org.bukkit.boss.BarColor;
import org.bukkit.entity.Player;
import org.bukkit.event.EventHandler;
import org.bukkit.event.player.PlayerMoveEvent;

@Since("2.0")
public class MaxBiomeTimeChallenge extends SettingModifier {
   public MaxBiomeTimeChallenge() {
      super(MenuType.CHALLENGES, 3, 20);
      this.setCategory(SettingCategory.LIMITED_TIME);
   }

   protected void onEnable() {
      this.bossbar.setContent((bossbar, player) -> {
         int currentTime = this.getCurrentTime(player);
         int maxTime = this.getValue() * 60;
         bossbar.setTitle(Message.forName("bossbar-biome-time-left").asComponent(this.getBiome(player), maxTime - currentTime));
         bossbar.setColor(BarColor.GREEN);
         bossbar.setProgress((double)(1.0F - (float)currentTime / (float)maxTime));
      });
      this.bossbar.show();
   }

   protected void onDisable() {
      this.bossbar.hide();
   }

   protected void onValueChange() {
      this.bossbar.update();
   }

   @Nonnull
   public ItemBuilder createDisplayItem() {
      return new ItemBuilder(Material.SPRUCE_SAPLING, Message.forName("item-max-biome-time-challenge"));
   }

   @Nullable
   protected String[] getSettingsDescription() {
      return Message.forName("item-time-seconds-description").asArray(this.getValue() * 60);
   }

   public void playValueChangeTitle() {
      ChallengeHelper.playChallengeSecondsValueChangeTitle(this, this.getValue() * 60);
   }

   @EventHandler
   public void onPlayerMove(@Nonnull PlayerMoveEvent event) {
      if (this.shouldExecuteEffect()) {
         if (!ignorePlayer(event.getPlayer())) {
            if (event.getTo() != null) {
               if (event.getFrom().getBlock().getBiome() != event.getTo().getBlock().getBiome()) {
                  this.bossbar.update(event.getPlayer());
               }
            }
         }
      }
   }

   @ScheduledTask(
      ticks = 20
   )
   public void onSecond() {
      broadcast(this::updateBiomeTime);
   }

   private void updateBiomeTime(@Nonnull Player player) {
      if (ignorePlayer(player)) {
         this.bossbar.update(player);
      } else {
         Biome biome = player.getLocation().getBlock().getBiome();
         int time = this.getCurrentTime(player) + 1;
         if (time > this.getValue() * 60) {
            this.kill(player);
         }

         if (time < this.getValue() * 60) {
            this.getPlayerData(player).set(biome.name(), time);
         }

         this.bossbar.update(player);
      }
   }

   private int getCurrentTime(@Nonnull Player player) {
      return this.getPlayerData(player).getInt(this.getBiome(player).name(), 0);
   }

   private Biome getBiome(@Nonnull Player player) {
      return player.getLocation().getBlock().getBiome();
   }
}
