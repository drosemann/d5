package net.codingarea.challenges.plugin.challenges.custom.settings.action.impl;

import java.util.Map;
import net.codingarea.challenges.plugin.challenges.custom.settings.action.PlayerTargetAction;
import net.codingarea.challenges.plugin.challenges.custom.settings.sub.SubSettingsBuilder;
import net.codingarea.challenges.plugin.challenges.type.helper.SubSettingsHelper;
import net.codingarea.challenges.plugin.utils.item.DefaultItem;
import net.codingarea.challenges.plugin.utils.item.ItemBuilder;
import org.bukkit.Material;
import org.bukkit.entity.Player;

public class HungerPlayerAction extends PlayerTargetAction {
   public HungerPlayerAction(String name) {
      super(name, (SubSettingsBuilder)SubSettingsHelper.createEntityTargetSettingsBuilder(false, true).createChooseItemChild("amount").fill((builder) -> {
         String prefix = DefaultItem.getItemPrefix();

         for(int i = 1; i < 21; ++i) {
            builder.addSetting(String.valueOf(i), (new ItemBuilder(Material.ROTTEN_FLESH, prefix + "§7" + i)).setAmount(i).build());
         }

      }));
   }

   public Material getMaterial() {
      return Material.ROTTEN_FLESH;
   }

   public void executeForPlayer(Player player, Map subActions) {
      int newFoodLevel = player.getFoodLevel() - Integer.parseInt(((String[])subActions.get("amount"))[0]);
      player.setFoodLevel(Math.max(newFoodLevel, 0));
   }
}
