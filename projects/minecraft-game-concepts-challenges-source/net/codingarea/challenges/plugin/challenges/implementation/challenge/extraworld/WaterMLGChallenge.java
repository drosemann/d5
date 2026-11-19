package net.codingarea.challenges.plugin.challenges.implementation.challenge.extraworld;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import net.codingarea.challenges.plugin.challenges.implementation.setting.OneTeamLifeSetting;
import net.codingarea.challenges.plugin.challenges.type.abstraction.AbstractChallenge;
import net.codingarea.challenges.plugin.challenges.type.abstraction.WorldDependentChallenge;
import net.codingarea.challenges.plugin.challenges.type.helper.ChallengeHelper;
import net.codingarea.challenges.plugin.content.Message;
import net.codingarea.challenges.plugin.management.menu.MenuType;
import net.codingarea.challenges.plugin.management.menu.generator.categorised.SettingCategory;
import net.codingarea.challenges.plugin.utils.item.ItemBuilder;
import org.bukkit.Bukkit;
import org.bukkit.Location;
import org.bukkit.Material;
import org.bukkit.entity.Player;
import org.bukkit.event.EventHandler;
import org.bukkit.event.EventPriority;
import org.bukkit.event.entity.EntityDamageEvent;
import org.bukkit.event.player.PlayerBucketEmptyEvent;
import org.bukkit.inventory.ItemStack;

public class WaterMLGChallenge extends WorldDependentChallenge {
   public WaterMLGChallenge() {
      super(MenuType.CHALLENGES, 1, 10, 5, false);
      this.setCategory(SettingCategory.EXTRA_WORLD);
   }

   @Nonnull
   public ItemBuilder createDisplayItem() {
      return new ItemBuilder(Material.WATER_BUCKET, Message.forName("item-water-mlg-challenge"));
   }

   @Nullable
   protected String[] getSettingsDescription() {
      return Message.forName("item-time-seconds-range-description").asArray(this.getValue() * 60 - 10, this.getValue() * 60 + 10);
   }

   public void playValueChangeTitle() {
      ChallengeHelper.playChallengeSecondsRangeValueChangeTitle(this, this.getValue() * 60 - 10, this.getValue() * 60 + 10);
   }

   protected int getSecondsUntilNextActivation() {
      return globalRandom.around(this.getValue() * 60, 10);
   }

   public void startWorldChallenge() {
      Location currentLocation = new Location(this.getExtraWorld(), 0.0D, 150.0D, 0.0D);
      this.teleportToWorld(false, (player, index) -> {
         currentLocation.add(100.0D, 0.0D, 0.0D);
         player.getInventory().setHeldItemSlot(4);
         player.getInventory().setItem(4, new ItemStack(Material.WATER_BUCKET));
         player.teleport(currentLocation);
      });
      Bukkit.getScheduler().runTaskLater(plugin, () -> {
         this.teleportBack();
         this.restartTimer();
      }, 200L);
   }

   @EventHandler(
      priority = EventPriority.HIGH,
      ignoreCancelled = true
   )
   public void onPlayerBucketEmpty(@Nonnull PlayerBucketEmptyEvent event) {
      if (this.isInExtraWorld()) {
         Bukkit.getScheduler().runTaskLater(plugin, () -> {
            event.getBlock().setType(Material.AIR);
            Bukkit.getScheduler().runTaskLater(plugin, () -> {
               this.teleportBack(event.getPlayer());
            }, 40L);
         }, 10L);
      }
   }

   @EventHandler(
      priority = EventPriority.HIGH
   )
   public void onEntityDamage(@Nonnull EntityDamageEvent event) {
      if (event.getEntity() instanceof Player) {
         if (this.isInExtraWorld()) {
            if (((OneTeamLifeSetting)AbstractChallenge.getFirstInstance(OneTeamLifeSetting.class)).isEnabled()) {
               this.teleportBack();
            } else {
               Player player = (Player)event.getEntity();
               this.teleportBack(player);
            }

         }
      }
   }
}
