package net.codingarea.challenges.plugin.management.menu.generator;

import java.util.ArrayList;
import java.util.List;
import javax.annotation.Nonnegative;
import javax.annotation.Nonnull;
import net.anweisen.utilities.bukkit.utils.menu.MenuPosition;
import net.codingarea.challenges.plugin.management.menu.InventoryTitleManager;
import net.codingarea.challenges.plugin.utils.item.DefaultItem;
import net.codingarea.challenges.plugin.utils.item.ItemBuilder;
import net.codingarea.challenges.plugin.utils.misc.InventoryUtils;
import org.bukkit.Bukkit;
import org.bukkit.inventory.Inventory;

public abstract class MultiPageMenuGenerator extends MenuGenerator {
   protected final List inventories = new ArrayList();

   @Nonnull
   protected Inventory createNewInventory(int page) {
      Inventory inventory = Bukkit.createInventory(MenuPosition.HOLDER, this.getSize(), this.getTitle(page));
      InventoryUtils.fillInventory(inventory, ItemBuilder.FILL_ITEM);
      this.inventories.add(inventory);
      return inventory;
   }

   protected String getTitle(@Nonnegative int page) {
      return InventoryTitleManager.getTitle(this.getMenuType(), page);
   }

   public abstract int getSize();

   public abstract int getPagesCount();

   public abstract void generatePage(@Nonnull Inventory var1, int var2);

   public abstract int[] getNavigationSlots(@Nonnegative int var1);

   public void generateInventories() {
      this.inventories.clear();

      int i;
      for(i = 0; i < this.getPagesCount(); ++i) {
         Inventory inventory = this.createNewInventory(i);
         this.generatePage(inventory, i);
      }

      for(i = 0; i < this.inventories.size(); ++i) {
         this.addNavigationItems((Inventory)this.inventories.get(i), i);
      }

      this.reopenInventoryForPlayers();
   }

   public List getInventories() {
      return this.inventories;
   }

   public void addNavigationItems(@Nonnull Inventory inventory, int page) {
      InventoryUtils.setNavigationItems(inventory, this.getNavigationSlots(page), true, InventoryUtils.InventorySetter.INVENTORY, page, this.inventories.size(), DefaultItem.navigateBack().clone().setLore("", "§7Shift §8» §7-5"), DefaultItem.navigateNext().clone().setLore("", "§7Shift §8» §7+5"));
   }
}
