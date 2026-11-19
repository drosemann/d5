package net.codingarea.challenges.plugin.management.menu.generator.categorised;

public class SmallCategorisedMenuGenerator extends CategorisedMenuGenerator {
   public int getEntriesPerPage() {
      return 7;
   }

   public int getSize() {
      return 27;
   }

   public int[] getNavigationSlots(int page) {
      return new int[]{18, 26};
   }
}
