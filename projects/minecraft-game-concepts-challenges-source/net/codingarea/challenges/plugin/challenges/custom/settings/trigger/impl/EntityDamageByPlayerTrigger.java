package net.codingarea.challenges.plugin.challenges.custom.settings.trigger.impl;

import javax.annotation.Nonnull;
import net.codingarea.challenges.plugin.challenges.custom.settings.sub.SubSettingsBuilder;
import net.codingarea.challenges.plugin.challenges.custom.settings.trigger.ChallengeTrigger;
import net.codingarea.challenges.plugin.challenges.type.helper.SubSettingsHelper;
import net.codingarea.challenges.plugin.spigot.events.EntityDamageByPlayerEvent;
import org.bukkit.Material;
import org.bukkit.event.EventHandler;
import org.bukkit.event.EventPriority;

public class EntityDamageByPlayerTrigger extends ChallengeTrigger {
   public EntityDamageByPlayerTrigger(String name) {
      super(name, (SubSettingsBuilder)SubSettingsHelper.createEntityTypeSettingsBuilder(true, true));
   }

   public Material getMaterial() {
      return Material.WOODEN_SWORD;
   }

   @EventHandler(
      priority = EventPriority.HIGH,
      ignoreCancelled = true
   )
   public void onDeath(@Nonnull EntityDamageByPlayerEvent event) {
      this.createData().entity(event.getDamager()).event(event).entityType(event.getEntityType()).execute();
   }
}
