package net.codingarea.challenges.plugin.challenges.custom.settings.action.impl;

import java.util.Map;
import net.codingarea.challenges.plugin.challenges.custom.settings.action.EntityTargetAction;
import net.codingarea.challenges.plugin.challenges.implementation.challenge.damage.FreezeChallenge;
import net.codingarea.challenges.plugin.challenges.type.abstraction.AbstractChallenge;
import net.codingarea.challenges.plugin.challenges.type.helper.SubSettingsHelper;
import org.bukkit.Material;
import org.bukkit.entity.Entity;
import org.bukkit.entity.LivingEntity;

public class FreezeAction extends EntityTargetAction {
   FreezeChallenge instance = (FreezeChallenge)AbstractChallenge.getFirstInstance(FreezeChallenge.class);

   public FreezeAction(String name) {
      super(name, SubSettingsHelper.createEntityTargetSettingsBuilder(true));
   }

   public Material getMaterial() {
      return Material.ICE;
   }

   public void executeFor(Entity entity, Map subActions) {
      if (entity instanceof LivingEntity) {
         LivingEntity livingEntity = (LivingEntity)entity;
         this.instance.setFreeze(livingEntity, 2.0D);
      }

   }
}
