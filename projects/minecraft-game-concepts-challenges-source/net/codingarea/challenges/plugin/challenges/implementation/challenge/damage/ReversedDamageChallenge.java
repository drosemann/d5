package net.codingarea.challenges.plugin.challenges.implementation.challenge.damage;

import javax.annotation.Nonnull;
import net.codingarea.challenges.plugin.challenges.type.abstraction.Setting;
import net.codingarea.challenges.plugin.content.Message;
import net.codingarea.challenges.plugin.management.menu.MenuType;
import net.codingarea.challenges.plugin.management.menu.generator.categorised.SettingCategory;
import net.codingarea.challenges.plugin.spigot.events.EntityDamageByPlayerEvent;
import net.codingarea.challenges.plugin.utils.item.ItemBuilder;
import org.bukkit.Material;
import org.bukkit.event.EventHandler;
import org.bukkit.event.EventPriority;

public class ReversedDamageChallenge extends Setting {
   public ReversedDamageChallenge() {
      super(MenuType.CHALLENGES);
      this.setCategory(SettingCategory.DAMAGE);
   }

   @Nonnull
   public ItemBuilder createDisplayItem() {
      return new ItemBuilder(Material.GOLDEN_SWORD, Message.forName("item-reversed-damage-challenge"));
   }

   @EventHandler(
      priority = EventPriority.HIGH,
      ignoreCancelled = true
   )
   public void onDamageByPlayer(@Nonnull EntityDamageByPlayerEvent event) {
      if (this.shouldExecuteEffect()) {
         if (!ignorePlayer(event.getDamager())) {
            double damage = event.getFinalDamage();
            event.getDamager().damage(damage);
         }
      }
   }
}
