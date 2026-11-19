package net.codingarea.challenges.plugin.challenges.custom.settings.action.impl;

import java.util.Map;
import net.codingarea.challenges.plugin.Challenges;
import net.codingarea.challenges.plugin.challenges.custom.settings.action.EntityTargetAction;
import net.codingarea.challenges.plugin.challenges.type.helper.SubSettingsHelper;
import org.bukkit.Material;
import org.bukkit.entity.Entity;
import org.bukkit.entity.LivingEntity;
import org.bukkit.potion.PotionEffect;
import org.bukkit.potion.PotionEffectType;

public class PotionEffectAction extends EntityTargetAction {
   public PotionEffectAction(String name) {
      super(name, SubSettingsHelper.createEntityTargetSettingsBuilder(true).addChild(SubSettingsHelper.createPotionSettingsBuilder(true, true)));
   }

   public void executeFor(Entity entity, Map subActions) {
      if (entity instanceof LivingEntity) {
         LivingEntity livingEntity = (LivingEntity)entity;

         try {
            PotionEffectType effectType = PotionEffectType.getByName(((String[])subActions.get("potion_type"))[0]);
            if (effectType == null) {
               return;
            }

            PotionEffect effect = effectType.createEffect(Integer.parseInt(((String[])subActions.get("length"))[0]) * 20 + 1, Integer.parseInt(((String[])subActions.get("amplifier"))[0]));
            livingEntity.addPotionEffect(effect);
         } catch (Exception var6) {
            Challenges.getInstance().getLogger().severe("Error while adding potion effect to player");
            Challenges.getInstance().getLogger().error("", new Object[]{var6});
         }
      }

   }

   public Material getMaterial() {
      return Material.POTION;
   }
}
