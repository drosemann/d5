package net.codingarea.challenges.plugin.challenges.custom.settings.action.impl;

import java.util.Map;
import net.codingarea.challenges.plugin.challenges.custom.settings.action.EntityTargetAction;
import net.codingarea.challenges.plugin.challenges.implementation.challenge.inventory.UncraftItemsChallenge;
import net.codingarea.challenges.plugin.challenges.type.helper.SubSettingsHelper;
import org.bukkit.Material;
import org.bukkit.entity.Entity;
import org.bukkit.entity.Player;

public class UncraftInventoryAction extends EntityTargetAction {
   public UncraftInventoryAction(String name) {
      super(name, SubSettingsHelper.createEntityTargetSettingsBuilder(false));
   }

   public void executeFor(Entity entity, Map subActions) {
      if (entity instanceof Player) {
         Player player = (Player)entity;
         UncraftItemsChallenge.uncraftInventory(player);
      }

   }

   public Material getMaterial() {
      return Material.CRAFTING_TABLE;
   }
}
