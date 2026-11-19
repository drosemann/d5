package net.codingarea.challenges.plugin.management.menu.generator;

import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import javax.annotation.Nonnegative;
import javax.annotation.Nonnull;
import net.anweisen.utilities.bukkit.utils.animation.SoundSample;
import net.anweisen.utilities.bukkit.utils.menu.MenuClickInfo;
import net.anweisen.utilities.bukkit.utils.menu.MenuPosition;
import net.codingarea.challenges.plugin.content.Message;
import net.codingarea.challenges.plugin.management.menu.InventoryTitleManager;
import net.codingarea.challenges.plugin.management.menu.MenuType;
import net.codingarea.challenges.plugin.management.menu.generator.implementation.custom.MainCustomMenuGenerator;
import net.codingarea.challenges.plugin.management.menu.position.GeneratorMenuPosition;
import net.codingarea.challenges.plugin.utils.item.DefaultItem;
import net.codingarea.challenges.plugin.utils.item.ItemBuilder;
import net.codingarea.challenges.plugin.utils.misc.InventoryUtils;
import net.codingarea.challenges.plugin.utils.misc.MinecraftNameWrapper;
import org.bukkit.Material;
import org.bukkit.entity.Player;
import org.bukkit.inventory.Inventory;
import org.bukkit.inventory.ItemStack;

public abstract class ChooseMultipleItemGenerator extends MultiPageMenuGenerator {
   public static final int FINISH_SLOT = 40;
   private final LinkedHashMap items;
   private final List selectedKeys;

   public ChooseMultipleItemGenerator(LinkedHashMap items) {
      this.items = items;
      this.selectedKeys = new LinkedList();
   }

   private static int getNextMiddleSlot(@Nonnegative int currentSlot) {
      if (currentSlot >= 53) {
         return currentSlot;
      } else {
         return isSideSlot(currentSlot) ? getNextMiddleSlot(currentSlot + 1) : currentSlot;
      }
   }

   private static boolean isSideSlot(@Nonnegative int slot) {
      return slot % 9 == 0 || slot % 9 == 8;
   }

   private static boolean isTopOrBottomSlot(@Nonnegative int slot) {
      return slot < 9 || slot > 35;
   }

   public MenuPosition getMenuPosition(int page) {
      return new GeneratorMenuPosition(this, page) {
         public void handleClick(@Nonnull MenuClickInfo info) {
            if (info.getSlot() == 40) {
               ChooseMultipleItemGenerator.this.onItemClick(info.getPlayer(), (String[])ChooseMultipleItemGenerator.this.selectedKeys.toArray(new String[0]));
               SoundSample.PLOP.play(info.getPlayer());
            } else if (!InventoryUtils.handleNavigationClicking(this.generator, ChooseMultipleItemGenerator.this.getNavigationSlots(this.page), this.page, info, () -> {
               ChooseMultipleItemGenerator.this.onBackToMenuItemClick(info.getPlayer());
            })) {
               int slot = info.getSlot();
               int index = ChooseMultipleItemGenerator.this.getItemsPerPage() * this.page + slot - 10;
               if (slot > 18) {
                  index -= 2;
               }

               if (slot > 27) {
                  index -= 2;
               }

               if (index >= ChooseMultipleItemGenerator.this.items.size()) {
                  SoundSample.CLICK.play(info.getPlayer());
               } else {
                  String[] array = (String[])ChooseMultipleItemGenerator.this.items.keySet().toArray(new String[0]);
                  if (!ChooseMultipleItemGenerator.isSideSlot(slot) && !ChooseMultipleItemGenerator.isTopOrBottomSlot(slot)) {
                     String itemKey = array[index];
                     if (ChooseMultipleItemGenerator.this.selectedKeys.contains(itemKey)) {
                        ChooseMultipleItemGenerator.this.selectedKeys.remove(itemKey);
                     } else {
                        ChooseMultipleItemGenerator.this.selectedKeys.add(itemKey);
                     }

                     ChooseMultipleItemGenerator.this.generatePage(info.getInventory(), this.page);
                     SoundSample.LOW_PLOP.play(info.getPlayer());
                  } else {
                     SoundSample.CLICK.play(info.getPlayer());
                  }
               }
            }
         }
      };
   }

   public int getSize() {
      return 45;
   }

   public int getPagesCount() {
      return this.items.size() / this.getItemsPerPage() + 1;
   }

   public int getItemsPerPage() {
      return 21;
   }

   public void generatePage(@Nonnull Inventory inventory, int page) {
      int lastSlot = 10;
      int startIndex = this.getItemsPerPage() * page;

      for(int i = startIndex; i < startIndex + this.getItemsPerPage() && i < this.items.size(); ++i) {
         String key = ((String[])this.items.keySet().toArray(new String[0]))[i];
         ItemBuilder itemBuilder = (new ItemBuilder((ItemStack)this.items.get(key))).clone();
         itemBuilder.hideAttributes();
         if (this.selectedKeys.contains(key)) {
            itemBuilder.addEnchantment(MinecraftNameWrapper.UNBREAKING, 1);
            itemBuilder.appendName(" §8┃ §2§l✔");
         } else {
            itemBuilder.appendName(" §8┃ §c✖");
         }

         lastSlot = getNextMiddleSlot(lastSlot);
         inventory.setItem(lastSlot, itemBuilder.build());
         ++lastSlot;
      }

      inventory.setItem(40, DefaultItem.create(Material.LIME_DYE, Message.forName("custom-sub-finish")).build());
   }

   public int[] getNavigationSlots(int page) {
      return MainCustomMenuGenerator.NAVIGATION_SLOTS;
   }

   protected String getTitle(int page) {
      return InventoryTitleManager.getTitle(MenuType.CUSTOM, this.getSubTitles(page));
   }

   public abstract String[] getSubTitles(int var1);

   public abstract void onItemClick(Player var1, String[] var2);

   public abstract void onBackToMenuItemClick(Player var1);
}
