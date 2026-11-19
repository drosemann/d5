// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/utils/misc/InventoryUtils.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/utils/misc/InventoryUtils.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/utils/misc/InventoryUtils.java), unveraendert, als Inline-Doku ----
// package net.codingarea.challenges.plugin.utils.misc;
//
// import java.util.ArrayList;
// import java.util.Arrays;
// import java.util.List;
// import java.util.concurrent.ThreadLocalRandom;
// import javax.annotation.Nonnull;
// import javax.annotation.Nullable;
// import net.anweisen.utilities.bukkit.utils.animation.AnimationFrame;
// import net.anweisen.utilities.bukkit.utils.animation.SoundSample;
// import net.anweisen.utilities.bukkit.utils.menu.MenuClickInfo;
// import net.anweisen.utilities.common.collection.IRandom;
// import net.codingarea.challenges.plugin.ChallengeAPI;
// import net.codingarea.challenges.plugin.management.menu.generator.MenuGenerator;
// import net.codingarea.challenges.plugin.utils.item.DefaultItem;
// import net.codingarea.challenges.plugin.utils.item.ItemBuilder;
// import org.bukkit.Location;
// import org.bukkit.Material;
// import org.bukkit.World.Environment;
// import org.bukkit.entity.Item;
// import org.bukkit.entity.Player;
// import org.bukkit.inventory.Inventory;
// import org.bukkit.inventory.ItemStack;
//
// public final class InventoryUtils {
//    private static final IRandom random = IRandom.create();
//    private static final List items = new ArrayList(Arrays.asList(ExperimentalUtils.getMaterials()));
//
//    private InventoryUtils() {
//    }
//
//    public static void fillInventory(@Nonnull Inventory inventory, @Nullable ItemStack item) {
//       for(int i = 0; i < inventory.getSize(); ++i) {
//          inventory.setItem(i, item);
//       }
//
//    }
//
//    public static void fillInventory(@Nonnull Inventory inventory, @Nullable ItemStack item, @Nonnull int... slots) {
//       int[] var3 = slots;
//       int var4 = slots.length;
//
//       for(int var5 = 0; var5 < var4; ++var5) {
//          int i = var3[var5];
//          inventory.setItem(i, item);
//       }
//
//    }
//
//    public static void setNavigationItemsToInventory(@Nonnull List inventories, @Nonnull int[] navigationSlots) {
//       setNavigationItemsToInventory(inventories, navigationSlots, true);
//    }
//
//    public static void setNavigationItemsToInventory(@Nonnull List inventories, @Nonnull int[] navigationSlots, boolean goBackExit) {
//       setNavigationItems(inventories, navigationSlots, goBackExit, InventoryUtils.InventorySetter.INVENTORY);
//    }
//
//    public static void setNavigationItemsToFrame(@Nonnull List frames, @Nonnull int[] navigationSlots) {
//       setNavigationItemsToFrame(frames, navigationSlots, true);
//    }
//
//    public static void setNavigationItemsToFrame(@Nonnull List inventories, @Nonnull int[] navigationSlots, boolean goBackExit) {
//       setNavigationItems(inventories, navigationSlots, goBackExit, InventoryUtils.InventorySetter.FRAME);
//    }
//
//    public static void setNavigationItemsToFrame(@Nonnull AnimationFrame frame, @Nonnull int[] navigationSlots, boolean goBackExit, int index, int size) {
//       setNavigationItems(frame, navigationSlots, goBackExit, InventoryUtils.InventorySetter.FRAME, index, size);
//    }
//
//    public static void setNavigationItems(@Nonnull List inventories, @Nonnull int[] navigationSlots, boolean goBackExit, @Nonnull InventoryUtils.InventorySetter setter) {
//       for(int i = 0; i < inventories.size(); ++i) {
//          setNavigationItems(inventories.get(i), navigationSlots, goBackExit, setter, i, inventories.size());
//       }
//
//    }
//
//    public static void setNavigationItems(@Nonnull Object inventory, @Nonnull int[] navigationSlots, boolean goBackExit, @Nonnull InventoryUtils.InventorySetter setter, int index, int size) {
//       setNavigationItems(inventory, navigationSlots, goBackExit, setter, index, size, DefaultItem.navigateBack(), DefaultItem.navigateNext());
//    }
//
//    public static void setNavigationItems(@Nonnull Object inventory, @Nonnull int[] navigationSlots, boolean goBackExit, @Nonnull InventoryUtils.InventorySetter setter, int index, int size, ItemBuilder navigateBack, ItemBuilder navigateNext) {
//       if (navigationSlots.length >= 1) {
//          ItemBuilder left = index == 0 && goBackExit ? DefaultItem.navigateBackMainMenu() : navigateBack;
//          setter.set(inventory, navigationSlots[0], left);
//       }
//
//       if (navigationSlots.length >= 2 && index < size - 1) {
//          setter.set(inventory, navigationSlots[1], navigateNext);
//       }
//
//    }
//
//    public static boolean isEmpty(@Nonnull Inventory inventory) {
//       ItemStack[] var1 = inventory.getContents();
//       int var2 = var1.length;
//
//       for(int var3 = 0; var3 < var2; ++var3) {
//          ItemStack content = var1[var3];
//          if (content != null) {
//             return false;
//          }
//       }
//
//       return true;
//    }
//
//    public static int getRandomEmptySlot(@Nonnull Inventory inventory) {
//       List emptySlots = new ArrayList();
//
//       for(int slot = 0; slot < inventory.getSize(); ++slot) {
//          if (inventory.getItem(slot) == null) {
//             emptySlots.add(slot);
//          }
//       }
//
//       if (emptySlots.isEmpty()) {
//          return -1;
//       } else {
//          return (Integer)emptySlots.get(ThreadLocalRandom.current().nextInt(emptySlots.size()));
//       }
//    }
//
//    public static int getRandomFullSlot(@Nonnull Inventory inventory) {
//       List fullSlots = new ArrayList();
//
//       for(int slot = 0; slot < inventory.getSize(); ++slot) {
//          ItemStack item = inventory.getItem(slot);
//          if (item != null && !item.isSimilar(ItemBuilder.BLOCKED_ITEM)) {
//             fullSlots.add(slot);
//          }
//       }
//
//       if (fullSlots.isEmpty()) {
//          return -1;
//       } else {
//          return (Integer)fullSlots.get(ThreadLocalRandom.current().nextInt(fullSlots.size()));
//       }
//    }
//
//    public static int getRandomSlot(@Nonnull Inventory inventory) {
//       List slots = new ArrayList();
//
//       for(int slot = 0; slot < inventory.getSize(); ++slot) {
//          ItemStack item = inventory.getItem(slot);
//          if (item == null || !item.isSimilar(ItemBuilder.BLOCKED_ITEM)) {
//             slots.add(slot);
//          }
//       }
//
//       if (slots.isEmpty()) {
//          return -1;
//       } else {
//          return (Integer)slots.get(ThreadLocalRandom.current().nextInt(slots.size()));
//       }
//    }
//
//    public static void dropItemByPlayer(@Nonnull Location location, @Nonnull ItemStack itemStack) {
//       if (location.getWorld() != null) {
//          Item droppedItem = location.getWorld().dropItem(location.clone().add(0.0D, 1.4D, 0.0D), itemStack);
//          droppedItem.setVelocity(location.getDirection().multiply(0.4D));
//       }
//    }
//
//    public static void dropOrGiveItem(@Nonnull Inventory inventory, @Nonnull Location location, @Nonnull Material material) {
//       dropOrGiveItem(inventory, location, new ItemStack(material));
//    }
//
//    public static void dropOrGiveItem(@Nonnull Inventory inventory, @Nonnull Location location, @Nonnull ItemStack itemStack) {
//       location = location.clone();
//       if (inventory.firstEmpty() == -1) {
//          if (location.getWorld() == null) {
//             location.setWorld(ChallengeAPI.getGameWorld(Environment.NORMAL));
//          }
//
//          location.getWorld().dropItem(location, itemStack);
//       } else {
//          inventory.addItem(new ItemStack[]{itemStack});
//       }
//    }
//
//    public static void removeRandomItem(@Nonnull Inventory inventory) {
//       int slot = getRandomFullSlot(inventory);
//       if (slot != -1) {
//          inventory.setItem(slot, (ItemStack)null);
//       }
//    }
//
//    public static void giveItem(@Nonnull Player player, @Nonnull ItemStack itemStack) {
//       giveItem(player.getInventory(), player.getLocation(), itemStack);
//    }
//
//    public static void giveItem(@Nonnull Inventory inventory, @Nonnull Location locationToDrop, @Nonnull ItemStack itemStack) {
//       if (inventory.firstEmpty() == -1) {
//          dropItemByPlayer(locationToDrop, itemStack);
//       } else {
//          inventory.addItem(new ItemStack[]{itemStack});
//       }
//    }
//
//    public static ItemStack getRandomItem(boolean onlyOne, boolean respectMaxStackSize) {
//       Material material = (Material)random.choose(items);
//       int stackSize = onlyOne ? 1 : (respectMaxStackSize && material.getMaxStackSize() == 1 ? 1 : random.range(1, respectMaxStackSize ? material.getMaxStackSize() : 64));
//       return new ItemStack(material, stackSize);
//    }
//
//    public static boolean handleNavigationClicking(MenuGenerator generator, int[] navigationSlots, int page, MenuClickInfo info, Runnable onDoorClick) {
//       int pagesSwitching = info.isShiftClick() ? 5 : 1;
//       if (navigationSlots.length >= 1 && info.getSlot() == navigationSlots[0]) {
//          if (page <= 0) {
//             if (page == 0) {
//                onDoorClick.run();
//             } else {
//                SoundSample.CLICK.play(info.getPlayer());
//             }
//
//             return page == 0;
//          } else {
//             SoundSample.CLICK.play(info.getPlayer());
//             generator.open(info.getPlayer(), Math.max(page - pagesSwitching, 0));
//             return true;
//          }
//       } else if (navigationSlots.length >= 2 && info.getSlot() == navigationSlots[1]) {
//          SoundSample.CLICK.play(info.getPlayer());
//          if (page < generator.getInventories().size()) {
//             generator.open(info.getPlayer(), Math.min(page + pagesSwitching, generator.getInventories().size()));
//             return true;
//          } else {
//             return false;
//          }
//       } else {
//          return false;
//       }
//    }
//
//    static {
//       items.removeIf((material) -> {
//          return !material.isItem();
//       });
//    }
//
//    @FunctionalInterface
//    public interface InventorySetter {
//       InventoryUtils.InventorySetter FRAME = AnimationFrame::setItem;
//       InventoryUtils.InventorySetter INVENTORY = (inventory, slot, item) -> {
//          inventory.setItem(slot, item.build());
//       };
//
//       void set(@Nonnull Object var1, int var2, @Nonnull ItemBuilder var3);
//    }
// }
//
