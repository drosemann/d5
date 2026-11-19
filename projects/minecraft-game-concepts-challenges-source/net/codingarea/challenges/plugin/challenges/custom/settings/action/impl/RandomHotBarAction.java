package net.codingarea.challenges.plugin.challenges.custom.settings.action.impl;

import java.util.Map;
import net.codingarea.challenges.plugin.challenges.custom.settings.action.PlayerTargetAction;
import net.codingarea.challenges.plugin.challenges.implementation.challenge.randomizer.HotBarRandomizerChallenge;
import net.codingarea.challenges.plugin.challenges.type.helper.SubSettingsHelper;
import org.bukkit.Material;
import org.bukkit.entity.Player;

public class RandomHotBarAction extends PlayerTargetAction {
   public RandomHotBarAction(String name) {
      super(name, SubSettingsHelper.createEntityTargetSettingsBuilder(true, true));
   }

   public Material getMaterial() {
      return Material.ARMOR_STAND;
   }

   public void executeForPlayer(Player player, Map subActions) {
      HotBarRandomizerChallenge.addItems(player, true);
   }
}
