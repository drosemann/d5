package net.codingarea.challenges.plugin.challenges.implementation.setting;

import javax.annotation.Nonnull;
import net.codingarea.challenges.plugin.challenges.type.abstraction.Modifier;
import net.codingarea.challenges.plugin.challenges.type.helper.ChallengeHelper;
import net.codingarea.challenges.plugin.content.Message;
import net.codingarea.challenges.plugin.management.menu.MenuType;
import net.codingarea.challenges.plugin.utils.item.DefaultItem;
import net.codingarea.challenges.plugin.utils.item.ItemBuilder;
import org.bukkit.Material;
import org.bukkit.entity.Player;
import org.bukkit.event.EventHandler;
import org.bukkit.event.EventPriority;
import org.bukkit.event.entity.EntityDamageEvent;

public class DamageMultiplierModifier extends Modifier {
   public DamageMultiplierModifier() {
      super(MenuType.SETTINGS, 10);
   }

   @Nonnull
   public ItemBuilder createDisplayItem() {
      return new ItemBuilder(Material.STONE_SWORD, Message.forName("item-damage-setting"));
   }

   @Nonnull
   public ItemBuilder createSettingsItem() {
      return DefaultItem.value(this.getValue()).appendName("x");
   }

   @EventHandler(
      priority = EventPriority.NORMAL,
      ignoreCancelled = true
   )
   public void onDamage(@Nonnull EntityDamageEvent event) {
      if (event.getEntity() instanceof Player) {
         event.setDamage(event.getDamage() * (double)this.getValue());
      }
   }

   public void playValueChangeTitle() {
      ChallengeHelper.playChangeChallengeValueTitle(this, (Object)(this.getValue() + "x"));
   }
}
