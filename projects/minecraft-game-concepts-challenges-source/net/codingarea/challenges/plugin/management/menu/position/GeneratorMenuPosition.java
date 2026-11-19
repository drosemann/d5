package net.codingarea.challenges.plugin.management.menu.position;

import lombok.Generated;
import net.anweisen.utilities.bukkit.utils.menu.MenuPosition;
import net.codingarea.challenges.plugin.management.menu.generator.MenuGenerator;

public abstract class GeneratorMenuPosition implements MenuPosition {
   protected final MenuGenerator generator;
   protected final int page;

   public GeneratorMenuPosition(MenuGenerator generator, int page) {
      this.generator = generator;
      this.page = page;
   }

   @Generated
   public MenuGenerator getGenerator() {
      return this.generator;
   }

   @Generated
   public int getPage() {
      return this.page;
   }
}
