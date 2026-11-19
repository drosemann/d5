package net.codingarea.challenges.plugin.challenges.custom.settings.action.impl;

import java.util.Map;
import net.codingarea.challenges.plugin.challenges.custom.settings.action.PlayerTargetAction;
import net.codingarea.challenges.plugin.challenges.implementation.challenge.miscellaneous.InvertHealthChallenge;
import net.codingarea.challenges.plugin.challenges.type.helper.SubSettingsHelper;
import org.bukkit.Material;
import org.bukkit.entity.Player;

public class InvertHealthAction extends PlayerTargetAction {
   public InvertHealthAction(String name) {
      super(name, SubSettingsHelper.createEntityTargetSettingsBuilder(false, true));
   }

   public Material getMaterial() {
      return Material.REDSTONE;
   }

   public void executeForPlayer(Player player, Map subActions) {
      InvertHealthChallenge.invertHealth(player);
   }
}
