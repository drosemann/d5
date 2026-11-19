package net.codingarea.challenges.plugin.challenges.custom.settings.trigger.impl;

import javax.annotation.Nonnull;
import net.codingarea.challenges.plugin.challenges.custom.settings.trigger.ChallengeTrigger;
import org.bukkit.Material;
import org.bukkit.event.EventHandler;
import org.bukkit.event.EventPriority;
import org.bukkit.event.player.PlayerToggleSneakEvent;

public class PlayerSneakTrigger extends ChallengeTrigger {
   public PlayerSneakTrigger(String name) {
      super(name);
   }

   public Material getMaterial() {
      return Material.SANDSTONE_SLAB;
   }

   @EventHandler(
      priority = EventPriority.HIGH,
      ignoreCancelled = true
   )
   public void onJump(@Nonnull PlayerToggleSneakEvent event) {
      if (event.isSneaking()) {
         this.createData().entity(event.getPlayer()).execute();
      }

   }
}
