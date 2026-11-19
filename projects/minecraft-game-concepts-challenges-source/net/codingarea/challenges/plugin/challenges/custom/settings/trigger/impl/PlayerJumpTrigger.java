package net.codingarea.challenges.plugin.challenges.custom.settings.trigger.impl;

import javax.annotation.Nonnull;
import net.codingarea.challenges.plugin.challenges.custom.settings.trigger.ChallengeTrigger;
import net.codingarea.challenges.plugin.spigot.events.PlayerJumpEvent;
import org.bukkit.Material;
import org.bukkit.event.EventHandler;
import org.bukkit.event.EventPriority;

public class PlayerJumpTrigger extends ChallengeTrigger {
   public PlayerJumpTrigger(String name) {
      super(name);
   }

   public Material getMaterial() {
      return Material.RABBIT_FOOT;
   }

   @EventHandler(
      priority = EventPriority.HIGH,
      ignoreCancelled = true
   )
   public void onJump(@Nonnull PlayerJumpEvent event) {
      this.createData().entity(event.getPlayer()).execute();
   }
}
