package net.codingarea.challenges.plugin.challenges.custom.settings.sub.builder;

import net.codingarea.challenges.plugin.challenges.custom.settings.sub.SubSettingsBuilder;
import net.codingarea.challenges.plugin.management.menu.InventoryTitleManager;
import net.codingarea.challenges.plugin.management.menu.generator.MenuGenerator;
import net.codingarea.challenges.plugin.management.menu.generator.implementation.custom.IParentCustomGenerator;
import org.bukkit.entity.Player;

public abstract class GeneratorSubSettingsBuilder extends SubSettingsBuilder {
   public GeneratorSubSettingsBuilder(String key) {
      super(key);
   }

   public GeneratorSubSettingsBuilder(String key, SubSettingsBuilder parent) {
      super(key, parent);
   }

   public boolean open(Player player, IParentCustomGenerator parentGenerator, String title) {
      if (this.hasSettings()) {
         MenuGenerator generator = this.getGenerator(player, parentGenerator, title + InventoryTitleManager.getTitleSplitter() + this.getKeyTranslation());
         if (generator == null) {
            return false;
         } else {
            generator.open(player, 0);
            return true;
         }
      } else {
         return false;
      }
   }

   public abstract MenuGenerator getGenerator(Player var1, IParentCustomGenerator var2, String var3);
}
