package net.codingarea.challenges.plugin.challenges.custom.settings.trigger.impl;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Random;
import javax.annotation.Nonnull;
import net.anweisen.utilities.common.misc.StringUtils;
import net.codingarea.challenges.plugin.challenges.custom.settings.sub.SubSettingsBuilder;
import net.codingarea.challenges.plugin.challenges.custom.settings.trigger.ChallengeTrigger;
import net.codingarea.challenges.plugin.challenges.type.helper.SubSettingsHelper;
import net.codingarea.challenges.plugin.content.Message;
import net.codingarea.challenges.plugin.utils.item.DefaultItem;
import net.codingarea.challenges.plugin.utils.item.ItemBuilder;
import org.bukkit.Material;
import org.bukkit.event.EventHandler;
import org.bukkit.event.EventPriority;
import org.bukkit.event.entity.EntityDamageEvent;
import org.bukkit.event.entity.EntityDamageEvent.DamageCause;
import org.bukkit.potion.PotionEffectType;

public class EntityDamageTrigger extends ChallengeTrigger {
   public EntityDamageTrigger(String name) {
      super(name, (SubSettingsBuilder)SubSettingsHelper.createEntityTypeSettingsBuilder(true, true).createChooseMultipleChild("damage_cause").fill((builder) -> {
         List types = new ArrayList(Arrays.asList(PotionEffectType.values()));
         Collections.shuffle(types, new Random(1L));
         builder.addSetting("any", new ItemBuilder(Material.NETHER_STAR, Message.forName("item-custom-trigger-damage-any")));
         DamageCause[] values = DamageCause.values();

         for(int i = 0; i < values.length; ++i) {
            DamageCause cause = values[i];
            PotionEffectType effectType = (PotionEffectType)types.get(i);
            builder.addSetting(cause.name(), (new net.anweisen.utilities.bukkit.utils.item.ItemBuilder.PotionBuilder(Material.TIPPED_ARROW, DefaultItem.getItemPrefix() + StringUtils.getEnumName((Enum)cause))).color(effectType.getColor()).build());
         }

      }));
   }

   public Material getMaterial() {
      return Material.FLINT_AND_STEEL;
   }

   @EventHandler(
      priority = EventPriority.HIGH,
      ignoreCancelled = true
   )
   public void onDeath(@Nonnull EntityDamageEvent event) {
      this.createData().entity(event.getEntity()).event(event).entityType(event.getEntityType()).data("damage_cause", "any", event.getCause().name()).execute();
   }
}
