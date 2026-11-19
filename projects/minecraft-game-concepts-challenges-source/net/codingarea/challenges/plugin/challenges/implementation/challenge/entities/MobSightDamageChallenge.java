package net.codingarea.challenges.plugin.challenges.implementation.challenge.entities;

import java.util.Iterator;
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
import org.bukkit.Bukkit;
import org.bukkit.Location;
import org.bukkit.Material;
import org.bukkit.entity.LivingEntity;
import org.bukkit.entity.Player;
import org.bukkit.util.BoundingBox;
import org.bukkit.util.RayTraceResult;

@Since("2.0")
public class MobSightDamageChallenge extends SettingModifier {
   public MobSightDamageChallenge() {
      super(MenuType.CHALLENGES);
      this.setCategory(SettingCategory.ENTITIES);
   }

   @Nonnull
   public ItemBuilder createDisplayItem() {
      return new ItemBuilder(Material.SPIDER_EYE, Message.forName("item-no-mob-sight-challenge"));
   }

   @Nullable
   protected String[] getSettingsDescription() {
      return Message.forName("item-heart-damage-description").asArray((float)this.getValue() / 2.0F);
   }

   public void playValueChangeTitle() {
      ChallengeHelper.playChallengeHeartsValueChangeTitle(this);
   }

   @ScheduledTask(
      ticks = 1,
      async = false
   )
   public void onTick() {
      Iterator var1 = Bukkit.getOnlinePlayers().iterator();

      while(var1.hasNext()) {
         Player player = (Player)var1.next();
         if (!ignorePlayer(player)) {
            RayTraceResult result = player.getWorld().rayTraceEntities(player.getEyeLocation(), player.getLocation().getDirection(), 30.0D, 0.01D, (entityx) -> {
               return !(entityx instanceof Player) && entityx instanceof LivingEntity;
            });
            if (result != null) {
               Location location = result.getHitPosition().toLocation(player.getWorld());
               LivingEntity entity = (LivingEntity)result.getHitEntity();
               if (entity != null) {
                  double distance = entity.getEyeLocation().distance(location) * 5.0D;
                  BoundingBox box = entity.getBoundingBox();
                  double volume = box.getWidthX() + box.getWidthZ() + box.getHeight();
                  if (!(distance > volume)) {
                     player.damage((double)this.getValue());
                  }
               }
            }
         }
      }

   }
}
