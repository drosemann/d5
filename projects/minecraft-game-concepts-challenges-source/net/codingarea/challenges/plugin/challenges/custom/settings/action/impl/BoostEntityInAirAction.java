package net.codingarea.challenges.plugin.challenges.custom.settings.action.impl;

import java.util.Map;
import net.anweisen.utilities.bukkit.utils.logging.Logger;
import net.codingarea.challenges.plugin.challenges.custom.settings.action.EntityTargetAction;
import net.codingarea.challenges.plugin.challenges.custom.settings.sub.SubSettingsBuilder;
import net.codingarea.challenges.plugin.challenges.type.helper.SubSettingsHelper;
import net.codingarea.challenges.plugin.content.Message;
import net.codingarea.challenges.plugin.utils.item.ItemBuilder;
import net.codingarea.challenges.plugin.utils.misc.EntityUtils;
import org.bukkit.Material;
import org.bukkit.entity.Entity;
import org.bukkit.util.Vector;

public class BoostEntityInAirAction extends EntityTargetAction {
   public BoostEntityInAirAction(String name) {
      super(name, (SubSettingsBuilder)SubSettingsHelper.createEntityTargetSettingsBuilder(true).createValueChild().fill((builder) -> {
         builder.addModifierSetting("strength", new ItemBuilder(Material.FEATHER, Message.forName("item-custom-action-boost_in_air-strength")), 1, 1, 10, (value) -> {
            return Message.forName("amplifier").asString();
         }, (integer) -> {
            return "";
         });
      }));
   }

   public Material getMaterial() {
      return Material.FEATHER;
   }

   public void executeFor(Entity entity, Map subActions) {
      int strength = 1;

      try {
         strength = Integer.parseInt(((String[])subActions.get("strength"))[0]);
      } catch (NumberFormatException var6) {
         Logger.error("", var6);
      }

      Vector velocityToAdd = (new Vector(0, 1, 0)).multiply(strength);
      Vector newVelocity = EntityUtils.getSucceedingVelocity(entity.getVelocity()).add(velocityToAdd);
      entity.setVelocity(newVelocity);
   }
}
