package net.codingarea.challenges.plugin.management.menu.generator;

import java.util.Iterator;
import java.util.List;
import javax.annotation.Nonnegative;
import javax.annotation.Nonnull;
import net.anweisen.utilities.bukkit.utils.menu.MenuPosition;
import net.anweisen.utilities.bukkit.utils.misc.CompatibilityUtils;
import net.codingarea.challenges.plugin.management.menu.MenuType;
import net.codingarea.challenges.plugin.management.menu.position.GeneratorMenuPosition;
import org.bukkit.Bukkit;
import org.bukkit.entity.Player;
import org.bukkit.event.inventory.InventoryType;
import org.bukkit.inventory.Inventory;

public abstract class MenuGenerator {
   private MenuType menuType;

   public abstract void generateInventories();

   public abstract List getInventories();

   public abstract MenuPosition getMenuPosition(@Nonnegative int var1);

   public boolean hasInventoryOpen(Player player) {
      MenuPosition menuPosition = MenuPosition.get(player);
      return menuPosition instanceof GeneratorMenuPosition && CompatibilityUtils.getTopInventory(player).getType() != InventoryType.CRAFTING && ((GeneratorMenuPosition)menuPosition).getGenerator() == this;
   }

   public int getPage(Player player) {
      MenuPosition menuPosition = MenuPosition.get(player);
      return menuPosition instanceof GeneratorMenuPosition ? ((GeneratorMenuPosition)menuPosition).getPage() : 0;
   }

   public void reopenInventoryForPlayers() {
      Iterator var1 = Bukkit.getOnlinePlayers().iterator();

      while(var1.hasNext()) {
         Player player = (Player)var1.next();
         if (this.hasInventoryOpen(player)) {
            this.open(player, this.getPage(player));
         }
      }

   }

   public void open(@Nonnull Player player, @Nonnegative int page) {
      List inventories = this.getInventories();
      if (inventories == null || inventories.isEmpty()) {
         this.generateInventories();
      }

      if (inventories != null && !inventories.isEmpty()) {
         if (page >= inventories.size()) {
            page = inventories.size() - 1;
         }

         Inventory inventory = (Inventory)inventories.get(page);
         MenuPosition.set(player, this.getMenuPosition(page));
         player.openInventory(inventory);
      }
   }

   public MenuType getMenuType() {
      return this.menuType;
   }

   public void setMenuType(MenuType menuType) {
      this.menuType = menuType;
   }
}
