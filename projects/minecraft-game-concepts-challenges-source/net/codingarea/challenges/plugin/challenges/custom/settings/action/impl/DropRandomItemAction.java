package net.codingarea.challenges.plugin.challenges.custom.settings.action.impl;

import java.util.Map;
import net.codingarea.challenges.plugin.challenges.custom.settings.action.PlayerTargetAction;
import net.codingarea.challenges.plugin.challenges.implementation.challenge.randomizer.RandomItemDroppingChallenge;
import net.codingarea.challenges.plugin.challenges.type.helper.SubSettingsHelper;
import org.bukkit.Material;
import org.bukkit.entity.Player;

public class DropRandomItemAction extends PlayerTargetAction {
   public DropRandomItemAction(String name) {
      super(name, SubSettingsHelper.createEntityTargetSettingsBuilder(false, true));
   }

   public Material getMaterial() {
      return Material.DISPENSER;
   }

   public void executeForPlayer(Player player, Map subActions) {
      RandomItemDroppingChallenge.dropRandomItem(player);
   }
}
