package net.codingarea.challenges.plugin.challenges.custom.settings.action.impl;

import java.util.Map;
import net.codingarea.challenges.plugin.challenges.custom.settings.action.PlayerTargetAction;
import net.codingarea.challenges.plugin.challenges.type.helper.SubSettingsHelper;
import net.codingarea.challenges.plugin.utils.misc.InventoryUtils;
import org.bukkit.Material;
import org.bukkit.entity.Player;

public class RemoveRandomItemAction extends PlayerTargetAction {
   public RemoveRandomItemAction(String name) {
      super(name, SubSettingsHelper.createEntityTargetSettingsBuilder(false, true));
   }

   public Material getMaterial() {
      return Material.DROPPER;
   }

   public void executeForPlayer(Player player, Map subActions) {
      InventoryUtils.removeRandomItem(player.getInventory());
   }
}
