package net.codingarea.challenges.plugin.challenges.implementation.setting;

import javax.annotation.Nonnull;
import net.codingarea.challenges.plugin.challenges.type.abstraction.Setting;
import net.codingarea.challenges.plugin.content.Message;
import net.codingarea.challenges.plugin.management.menu.MenuType;
import net.codingarea.challenges.plugin.utils.item.ItemBuilder;
import org.bukkit.Material;
import org.bukkit.event.EventHandler;
import org.bukkit.event.player.PlayerItemDamageEvent;

public class NoItemDamageSetting extends Setting {
   public NoItemDamageSetting() {
      super(MenuType.SETTINGS);
   }

   @EventHandler
   public void onItemDamage(PlayerItemDamageEvent event) {
      if (this.shouldExecuteEffect()) {
         if (!ignorePlayer(event.getPlayer())) {
            event.setCancelled(true);
            event.getPlayer().updateInventory();
         }
      }
   }

   @Nonnull
   public ItemBuilder createDisplayItem() {
      return new ItemBuilder(Material.ANVIL, Message.forName("item-no-item-damage-setting"));
   }
}
