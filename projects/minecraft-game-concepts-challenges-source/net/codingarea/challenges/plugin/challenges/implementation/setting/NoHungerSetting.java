package net.codingarea.challenges.plugin.challenges.implementation.setting;

import javax.annotation.Nonnull;
import net.codingarea.challenges.plugin.challenges.type.abstraction.Setting;
import net.codingarea.challenges.plugin.content.Message;
import net.codingarea.challenges.plugin.management.menu.MenuType;
import net.codingarea.challenges.plugin.utils.item.ItemBuilder;
import org.bukkit.Material;
import org.bukkit.entity.Player;
import org.bukkit.event.EventHandler;
import org.bukkit.event.entity.FoodLevelChangeEvent;

public class NoHungerSetting extends Setting {
   public NoHungerSetting() {
      super(MenuType.SETTINGS);
   }

   protected void onEnable() {
      broadcastFiltered(this::feedPlayer);
   }

   @Nonnull
   public ItemBuilder createDisplayItem() {
      return new ItemBuilder(Material.BREAD, Message.forName("no-hunger-setting"));
   }

   @EventHandler(
      ignoreCancelled = true
   )
   public void onHunger(@Nonnull FoodLevelChangeEvent event) {
      if (event.getEntity() instanceof Player) {
         if (this.shouldExecuteEffect()) {
            this.feedPlayer((Player)event.getEntity());
            event.setCancelled(true);
         }
      }
   }

   private void feedPlayer(@Nonnull Player player) {
      player.setFoodLevel(20);
      player.setSaturation(20.0F);
   }
}
