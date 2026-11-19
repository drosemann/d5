package net.codingarea.challenges.plugin.challenges.implementation.challenge.damage;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import net.anweisen.utilities.common.annotations.Since;
import net.codingarea.challenges.plugin.challenges.type.abstraction.SettingModifier;
import net.codingarea.challenges.plugin.challenges.type.helper.ChallengeHelper;
import net.codingarea.challenges.plugin.content.Message;
import net.codingarea.challenges.plugin.management.menu.MenuType;
import net.codingarea.challenges.plugin.management.menu.generator.categorised.SettingCategory;
import net.codingarea.challenges.plugin.utils.item.ItemBuilder;
import net.codingarea.challenges.plugin.utils.misc.MinecraftNameWrapper;
import org.bukkit.Material;
import org.bukkit.entity.LivingEntity;
import org.bukkit.entity.Player;
import org.bukkit.event.EventHandler;
import org.bukkit.event.EventPriority;
import org.bukkit.event.entity.EntityDamageEvent;
import org.bukkit.event.player.PlayerMoveEvent;
import org.bukkit.potion.PotionEffect;

@Since("2.0.2")
public class FreezeChallenge extends SettingModifier {
   public FreezeChallenge() {
      super(MenuType.CHALLENGES, 5, 60, 20);
      this.setCategory(SettingCategory.DAMAGE);
   }

   @Nonnull
   public ItemBuilder createDisplayItem() {
      return new ItemBuilder(Material.BLUE_ICE, Message.forName("item-freeze-challenge"));
   }

   @Nullable
   protected String[] getSettingsDescription() {
      return Message.forName("item-time-seconds-description").asArray(this.getValue());
   }

   @EventHandler(
      priority = EventPriority.HIGH,
      ignoreCancelled = true
   )
   public void onDamage(@Nonnull EntityDamageEvent event) {
      if (this.shouldExecuteEffect()) {
         if (event.getEntity() instanceof Player) {
            Player player = (Player)event.getEntity();
            if (!ignorePlayer(player)) {
               if (!ChallengeHelper.finalDamageIsNull(event)) {
                  double damage = ChallengeHelper.getFinalDamage(event);
                  this.setFreeze(player, damage);
               }
            }
         }
      }
   }

   @EventHandler(
      priority = EventPriority.HIGH,
      ignoreCancelled = true
   )
   public void onMove(@Nonnull PlayerMoveEvent event) {
      if (this.shouldExecuteEffect()) {
         if (!ignorePlayer(event.getPlayer())) {
            if (event.getTo() != null) {
               if (event.getTo().getY() != event.getFrom().getY() || event.getTo().getX() != event.getFrom().getX() || event.getTo().getZ() != event.getFrom().getZ()) {
                  PotionEffect effect = event.getPlayer().getPotionEffect(MinecraftNameWrapper.SLOWNESS);
                  if (effect != null && effect.getAmplifier() == 255) {
                     event.setCancelled(true);
                  }
               }
            }
         }
      }
   }

   public void setFreeze(LivingEntity entity, double damage) {
      int time = (int)(damage * (double)this.getValue() * 20.0D / 2.0D);
      PotionEffect effect = entity.getPotionEffect(MinecraftNameWrapper.SLOWNESS);
      entity.removePotionEffect(MinecraftNameWrapper.SLOWNESS);
      if (effect != null && effect.getAmplifier() == 255) {
         time += effect.getDuration();
      }

      entity.addPotionEffect(new PotionEffect(MinecraftNameWrapper.SLOWNESS, time, 255));
   }
}
