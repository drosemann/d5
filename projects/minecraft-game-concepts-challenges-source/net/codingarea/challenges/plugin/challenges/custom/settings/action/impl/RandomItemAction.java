package net.codingarea.challenges.plugin.challenges.custom.settings.action.impl;

import java.util.Iterator;
import java.util.Map;
import javax.annotation.Nonnull;
import net.codingarea.challenges.plugin.challenges.custom.settings.ChallengeExecutionData;
import net.codingarea.challenges.plugin.challenges.custom.settings.action.ChallengeAction;
import net.codingarea.challenges.plugin.challenges.custom.settings.action.IEntityTargetAction;
import net.codingarea.challenges.plugin.challenges.type.helper.SubSettingsHelper;
import net.codingarea.challenges.plugin.utils.misc.InventoryUtils;
import org.bukkit.Material;
import org.bukkit.entity.Entity;
import org.bukkit.entity.Player;

public class RandomItemAction extends ChallengeAction {
   public RandomItemAction(String name) {
      super(name, SubSettingsHelper.createEntityTargetSettingsBuilder(false, true));
   }

   public static void giveRandomItemToPlayer(@Nonnull Player player) {
      InventoryUtils.giveItem(player.getInventory(), player.getLocation(), InventoryUtils.getRandomItem(true, false));
   }

   public void execute(ChallengeExecutionData executionData, Map subActions) {
      Iterator var3 = IEntityTargetAction.getTargets(executionData.getEntity(), subActions).iterator();

      while(var3.hasNext()) {
         Entity target = (Entity)var3.next();
         if (target instanceof Player) {
            Player player = (Player)target;
            giveRandomItemToPlayer(player);
         }
      }

   }

   public Material getMaterial() {
      return Material.BEACON;
   }
}
