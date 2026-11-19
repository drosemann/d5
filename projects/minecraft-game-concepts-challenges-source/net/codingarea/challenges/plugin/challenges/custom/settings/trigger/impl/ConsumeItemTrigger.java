package net.codingarea.challenges.plugin.challenges.custom.settings.trigger.impl;

import net.codingarea.challenges.plugin.challenges.custom.settings.sub.SubSettingsBuilder;
import net.codingarea.challenges.plugin.challenges.custom.settings.trigger.ChallengeTrigger;
import net.codingarea.challenges.plugin.utils.bukkit.misc.BukkitStringUtils;
import net.codingarea.challenges.plugin.utils.item.DefaultItem;
import net.codingarea.challenges.plugin.utils.item.ItemBuilder;
import net.codingarea.challenges.plugin.utils.misc.ExperimentalUtils;
import org.bukkit.Material;
import org.bukkit.event.EventHandler;
import org.bukkit.event.EventPriority;
import org.bukkit.event.player.PlayerItemConsumeEvent;

public class ConsumeItemTrigger extends ChallengeTrigger {
   public ConsumeItemTrigger(String name) {
      super(name, (SubSettingsBuilder)SubSettingsBuilder.createChooseMultipleItem("item").fill((builder) -> {
         Material[] var1 = ExperimentalUtils.getMaterials();
         int var2 = var1.length;

         for(int var3 = 0; var3 < var2; ++var3) {
            Material material = var1[var3];
            if (material.isEdible()) {
               builder.addSetting(material.name(), (new ItemBuilder(material, DefaultItem.getItemPrefix() + BukkitStringUtils.getItemName(material).toPlainText())).build());
            }
         }

      }));
   }

   public Material getMaterial() {
      return Material.COOKED_BEEF;
   }

   @EventHandler(
      priority = EventPriority.HIGH,
      ignoreCancelled = true
   )
   public void onConsumeItem(PlayerItemConsumeEvent event) {
      this.createData().entity(event.getPlayer()).event(event).data("item", "any", event.getItem().getType().name()).execute();
   }
}
