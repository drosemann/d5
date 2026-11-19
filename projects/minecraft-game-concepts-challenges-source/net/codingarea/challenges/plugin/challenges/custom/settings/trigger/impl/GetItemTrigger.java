package net.codingarea.challenges.plugin.challenges.custom.settings.trigger.impl;

import net.codingarea.challenges.plugin.challenges.custom.settings.sub.SubSettingsBuilder;
import net.codingarea.challenges.plugin.challenges.custom.settings.trigger.ChallengeTrigger;
import net.codingarea.challenges.plugin.challenges.type.helper.SubSettingsHelper;
import net.codingarea.challenges.plugin.spigot.events.PlayerInventoryClickEvent;
import net.codingarea.challenges.plugin.spigot.events.PlayerPickupItemEvent;
import org.bukkit.Material;
import org.bukkit.event.EventHandler;

public class GetItemTrigger extends ChallengeTrigger {
   public GetItemTrigger(String name) {
      super(name, (SubSettingsBuilder)SubSettingsHelper.createItemSettingsBuilder());
   }

   public Material getMaterial() {
      return Material.HOPPER;
   }

   @EventHandler
   public void onPickupItem(PlayerPickupItemEvent event) {
      this.createData().entity(event.getPlayer()).data("item", event.getItem().getItemStack().getType().name()).execute();
   }

   @EventHandler
   public void onPlayerInventoryClick(PlayerInventoryClickEvent event) {
      if (event.getClickedInventory() != null) {
         if (event.getClickedInventory().getHolder() == event.getPlayer()) {
            if (event.getCurrentItem() != null) {
               this.createData().entity(event.getPlayer()).data("item", event.getCurrentItem().getType().name()).execute();
            }
         }
      }
   }
}
