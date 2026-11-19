package net.codingarea.challenges.plugin.challenges.custom.settings.action.impl;

import java.util.Map;
import net.codingarea.challenges.plugin.challenges.custom.settings.action.PlayerTargetAction;
import net.codingarea.challenges.plugin.challenges.implementation.challenge.randomizer.RandomItemSwappingChallenge;
import net.codingarea.challenges.plugin.challenges.type.helper.SubSettingsHelper;
import org.bukkit.Material;
import org.bukkit.entity.Player;

public class SwapRandomItemAction extends PlayerTargetAction {
   public SwapRandomItemAction(String name) {
      super(name, SubSettingsHelper.createEntityTargetSettingsBuilder(false, true));
   }

   public Material getMaterial() {
      return Material.HOPPER;
   }

   public void executeForPlayer(Player player, Map subActions) {
      RandomItemSwappingChallenge.swapRandomItems(player);
   }
}
