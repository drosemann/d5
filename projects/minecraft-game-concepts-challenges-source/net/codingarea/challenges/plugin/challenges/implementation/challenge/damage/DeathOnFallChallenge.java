package net.codingarea.challenges.plugin.challenges.implementation.challenge.damage;

import javax.annotation.Nonnull;
import net.anweisen.utilities.common.annotations.Since;
import net.codingarea.challenges.plugin.challenges.type.abstraction.Setting;
import net.codingarea.challenges.plugin.content.Message;
import net.codingarea.challenges.plugin.management.menu.MenuType;
import net.codingarea.challenges.plugin.management.menu.generator.categorised.SettingCategory;
import net.codingarea.challenges.plugin.utils.item.ItemBuilder;
import org.bukkit.Material;
import org.bukkit.entity.Player;
import org.bukkit.event.EventHandler;
import org.bukkit.event.EventPriority;
import org.bukkit.event.entity.EntityDamageEvent;
import org.bukkit.event.entity.EntityDamageEvent.DamageCause;

@Since("2.0")
public class DeathOnFallChallenge extends Setting {
   public DeathOnFallChallenge() {
      super(MenuType.CHALLENGES);
      this.setCategory(SettingCategory.DAMAGE);
   }

   @Nonnull
   public ItemBuilder createDisplayItem() {
      return new ItemBuilder(Material.FEATHER, Message.forName("item-death-on-fall-challenge"));
   }

   @EventHandler(
      priority = EventPriority.HIGH
   )
   public void onEntityDamage(@Nonnull EntityDamageEvent event) {
      if (event.getEntity() instanceof Player) {
         if (this.shouldExecuteEffect()) {
            Player player = (Player)event.getEntity();
            if (!ignorePlayer(player)) {
               if (event.getCause() == DamageCause.FALL) {
                  event.setDamage(player.getHealth());
                  event.setCancelled(false);
               }
            }
         }
      }
   }
}
