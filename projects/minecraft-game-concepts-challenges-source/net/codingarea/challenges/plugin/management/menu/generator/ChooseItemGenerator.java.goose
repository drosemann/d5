// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/management/menu/generator/ChooseItemGenerator.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/management/menu/generator/ChooseItemGenerator.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/management/menu/generator/ChooseItemGenerator.java), unveraendert, als Inline-Doku ----
// package net.codingarea.challenges.plugin.management.menu.generator;
//
// import java.util.LinkedHashMap;
// import javax.annotation.Nonnegative;
// import javax.annotation.Nonnull;
// import net.anweisen.utilities.bukkit.utils.animation.SoundSample;
// import net.anweisen.utilities.bukkit.utils.menu.MenuClickInfo;
// import net.anweisen.utilities.bukkit.utils.menu.MenuPosition;
// import net.codingarea.challenges.plugin.management.menu.InventoryTitleManager;
// import net.codingarea.challenges.plugin.management.menu.MenuType;
// import net.codingarea.challenges.plugin.management.menu.generator.implementation.custom.MainCustomMenuGenerator;
// import net.codingarea.challenges.plugin.management.menu.position.GeneratorMenuPosition;
// import net.codingarea.challenges.plugin.utils.misc.InventoryUtils;
// import org.bukkit.entity.Player;
// import org.bukkit.inventory.Inventory;
// import org.bukkit.inventory.ItemStack;
//
// public abstract class ChooseItemGenerator extends MultiPageMenuGenerator {
//    private final LinkedHashMap items;
//
//    public ChooseItemGenerator(LinkedHashMap items) {
//       this.items = items;
//    }
//
//    private static int getNextMiddleSlot(@Nonnegative int currentSlot) {
//       if (currentSlot >= 53) {
//          return currentSlot;
//       } else {
//          return isSideSlot(currentSlot) ? getNextMiddleSlot(currentSlot + 1) : currentSlot;
//       }
//    }
//
//    private static boolean isSideSlot(@Nonnegative int slot) {
//       return slot % 9 == 0 || slot % 9 == 8;
//    }
//
//    private static boolean isTopOrBottomSlot(@Nonnegative int slot) {
//       return slot < 9 || slot > 35;
//    }
//
//    public MenuPosition getMenuPosition(int page) {
//       return new GeneratorMenuPosition(this, page) {
//          public void handleClick(@Nonnull MenuClickInfo info) {
//             if (!InventoryUtils.handleNavigationClicking(this.generator, ChooseItemGenerator.this.getNavigationSlots(this.page), this.page, info, () -> {
//                ChooseItemGenerator.this.onBackToMenuItemClick(info.getPlayer());
//             })) {
//                int slot = info.getSlot();
//                int index = ChooseItemGenerator.this.getItemsPerPage() * this.page + slot - 10;
//                if (slot > 18) {
//                   index -= 2;
//                }
//
//                if (slot > 27) {
//                   index -= 2;
//                }
//
//                if (index >= ChooseItemGenerator.this.items.size()) {
//                   SoundSample.CLICK.play(info.getPlayer());
//                } else {
//                   String[] array = (String[])ChooseItemGenerator.this.items.keySet().toArray(new String[0]);
//                   if (!ChooseItemGenerator.isSideSlot(slot) && !ChooseItemGenerator.isTopOrBottomSlot(slot)) {
//                      String itemKey = array[index];
//                      ChooseItemGenerator.this.onItemClick(info.getPlayer(), itemKey);
//                      SoundSample.PLOP.play(info.getPlayer());
//                   } else {
//                      SoundSample.CLICK.play(info.getPlayer());
//                   }
//                }
//             }
//          }
//       };
//    }
//
//    public int getSize() {
//       return 45;
//    }
//
//    public int getPagesCount() {
//       return (int)Math.ceil((double)((float)this.items.size() / (float)this.getItemsPerPage()));
//    }
//
//    public int getItemsPerPage() {
//       return 21;
//    }
//
//    public void generatePage(@Nonnull Inventory inventory, int page) {
//       int lastSlot = 10;
//       int startIndex = this.getItemsPerPage() * page;
//
//       for(int i = startIndex; i < startIndex + this.getItemsPerPage() && i < this.items.size(); ++i) {
//          String key = ((String[])this.items.keySet().toArray(new String[0]))[i];
//          ItemStack itemStack = (ItemStack)this.items.get(key);
//          lastSlot = getNextMiddleSlot(lastSlot);
//          inventory.setItem(lastSlot, itemStack);
//          ++lastSlot;
//       }
//
//    }
//
//    public int[] getNavigationSlots(int page) {
//       return MainCustomMenuGenerator.NAVIGATION_SLOTS;
//    }
//
//    protected String getTitle(int page) {
//       return InventoryTitleManager.getTitle(MenuType.CUSTOM, this.getSubTitles(page));
//    }
//
//    public abstract String[] getSubTitles(int var1);
//
//    public abstract void onItemClick(Player var1, String var2);
//
//    public abstract void onBackToMenuItemClick(Player var1);
// }
//
