package net.codingarea.challenges.plugin.challenges.custom.settings.trigger.impl;

import javax.annotation.Nonnull;
import net.codingarea.challenges.plugin.challenges.custom.settings.sub.SubSettingsBuilder;
import net.codingarea.challenges.plugin.challenges.custom.settings.trigger.ChallengeTrigger;
import net.codingarea.challenges.plugin.challenges.type.helper.SubSettingsHelper;
import org.bukkit.Material;
import org.bukkit.event.EventHandler;
import org.bukkit.event.EventPriority;
import org.bukkit.event.entity.EntityDeathEvent;

public class EntityDeathTrigger extends ChallengeTrigger {
   public EntityDeathTrigger(String name) {
      super(name, (SubSettingsBuilder)SubSettingsHelper.createEntityTypeSettingsBuilder(true, true));
   }

   public Material getMaterial() {
      return Material.BONE;
   }

   @EventHandler(
      priority = EventPriority.HIGH,
      ignoreCancelled = true
   )
   public void onDeath(@Nonnull EntityDeathEvent event) {
      this.createData().entity(event.getEntity()).entityType(event.getEntityType()).execute();
   }
}
