package net.codingarea.challenges.plugin.challenges.custom.settings.trigger.impl;

import net.codingarea.challenges.plugin.challenges.custom.settings.sub.SubSettingsBuilder;
import net.codingarea.challenges.plugin.challenges.custom.settings.trigger.ChallengeTrigger;
import net.codingarea.challenges.plugin.challenges.type.helper.SubSettingsHelper;
import org.bukkit.Material;
import org.bukkit.event.EventHandler;
import org.bukkit.event.EventPriority;
import org.bukkit.event.block.BlockPlaceEvent;

public class PlaceBlockTrigger extends ChallengeTrigger {
   public PlaceBlockTrigger(String name) {
      super(name, (SubSettingsBuilder)SubSettingsHelper.createBlockSettingsBuilder());
   }

   public Material getMaterial() {
      return Material.BRICKS;
   }

   @EventHandler(
      priority = EventPriority.HIGH,
      ignoreCancelled = true
   )
   public void onBlockPlace(BlockPlaceEvent event) {
      this.createData().entity(event.getPlayer()).event(event).block(event.getBlock().getType()).execute();
   }
}
