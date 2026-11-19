package net.codingarea.challenges.plugin.challenges.custom.settings.action.impl;

import java.util.Map;
import net.codingarea.challenges.plugin.challenges.custom.settings.action.PlayerTargetAction;
import net.codingarea.challenges.plugin.challenges.implementation.challenge.effect.PermanentEffectOnDamageChallenge;
import net.codingarea.challenges.plugin.challenges.type.abstraction.AbstractChallenge;
import net.codingarea.challenges.plugin.challenges.type.helper.SubSettingsHelper;
import org.bukkit.Material;
import org.bukkit.entity.Player;

public class AddPermanentEffectAction extends PlayerTargetAction {
   PermanentEffectOnDamageChallenge instance = (PermanentEffectOnDamageChallenge)AbstractChallenge.getFirstInstance(PermanentEffectOnDamageChallenge.class);

   public AddPermanentEffectAction(String name) {
      super(name, SubSettingsHelper.createEntityTargetSettingsBuilder(false, true));
   }

   public Material getMaterial() {
      return Material.MAGMA_CREAM;
   }

   public void executeForPlayer(Player player, Map subActions) {
      this.instance.addRandomEffect(player);
      this.instance.updateEffects();
   }
}
