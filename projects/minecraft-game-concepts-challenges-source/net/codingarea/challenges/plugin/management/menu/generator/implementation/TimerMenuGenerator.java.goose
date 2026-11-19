// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/management/menu/generator/implementation/TimerMenuGenerator.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/management/menu/generator/implementation/TimerMenuGenerator.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/management/menu/generator/implementation/TimerMenuGenerator.java), unveraendert, als Inline-Doku ----
// package net.codingarea.challenges.plugin.management.menu.generator.implementation;
//
// import java.util.ArrayList;
// import java.util.List;
// import javax.annotation.Nonnegative;
// import javax.annotation.Nonnull;
// import net.anweisen.utilities.bukkit.utils.animation.SoundSample;
// import net.anweisen.utilities.bukkit.utils.menu.MenuClickInfo;
// import net.anweisen.utilities.bukkit.utils.menu.MenuPosition;
// import net.codingarea.challenges.plugin.ChallengeAPI;
// import net.codingarea.challenges.plugin.Challenges;
// import net.codingarea.challenges.plugin.content.Message;
// import net.codingarea.challenges.plugin.content.loader.LanguageLoader;
// import net.codingarea.challenges.plugin.management.menu.InventoryTitleManager;
// import net.codingarea.challenges.plugin.management.menu.MenuType;
// import net.codingarea.challenges.plugin.management.menu.generator.MenuGenerator;
// import net.codingarea.challenges.plugin.management.scheduler.task.ScheduledTask;
// import net.codingarea.challenges.plugin.management.scheduler.task.TimerTask;
// import net.codingarea.challenges.plugin.management.scheduler.timer.TimerStatus;
// import net.codingarea.challenges.plugin.utils.item.ItemBuilder;
// import net.codingarea.challenges.plugin.utils.misc.InventoryUtils;
// import net.codingarea.challenges.plugin.utils.misc.MinecraftNameWrapper;
// import org.bukkit.Bukkit;
// import org.bukkit.Color;
// import org.bukkit.Material;
// import org.bukkit.entity.Player;
// import org.bukkit.inventory.Inventory;
// import org.bukkit.inventory.ItemStack;
//
// public class TimerMenuGenerator extends MenuGenerator {
//    public static final int SIZE = 45;
//    public static final int[] NAVIGATION_SLOTS = new int[]{36, 44};
//    public static final int START_SLOT = 21;
//    public static final int MODE_SLOT = 23;
//    public static final int[] HOUR_SLOTS = new int[]{11, 20, 29};
//    public static final int[] MINUTE_SLOTS = new int[]{13, 22, 31};
//    public static final int[] SECOND_SLOTS = new int[]{15, 24, 33};
//    private final List inventories = new ArrayList();
//
//    public TimerMenuGenerator() {
//       ChallengeAPI.registerScheduler(this);
//       Challenges.getInstance().getLoaderRegistry().subscribe(LanguageLoader.class, this::generateInventories);
//    }
//
//    @TimerTask(
//       status = {TimerStatus.PAUSED, TimerStatus.RUNNING}
//    )
//    public void updateInventories() {
//       this.updateFirstPage();
//       this.updateSecondPage();
//    }
//
//    public void updateFirstPage() {
//       Inventory inventory = (Inventory)this.inventories.get(0);
//       inventory.setItem(21, Challenges.getInstance().getChallengeTimer().isStarted() ? (new ItemBuilder(Material.LIME_DYE)).name((Object)Message.forName("timer-is-running")).build() : (new ItemBuilder(MinecraftNameWrapper.RED_DYE)).name((Object)Message.forName("timer-is-paused")).build());
//       inventory.setItem(23, Challenges.getInstance().getChallengeTimer().isCountingUp() ? (new ItemBuilder.PotionBuilder(Material.TIPPED_ARROW)).setColor(Color.LIME).name((Object)Message.forName("timer-counting-up")).hideAttributes().build() : (new ItemBuilder.PotionBuilder(Material.TIPPED_ARROW)).setColor(Color.RED).name((Object)Message.forName("timer-counting-down")).hideAttributes().build());
//    }
//
//    @ScheduledTask(
//       ticks = 20
//    )
//    public void updateSecondPage() {
//       this.setTimeNavigation(HOUR_SLOTS, Message.forName("hour"), Message.forName("hours"));
//       this.setTimeNavigation(MINUTE_SLOTS, Message.forName("minute"), Message.forName("minutes"));
//       this.setTimeNavigation(SECOND_SLOTS, Message.forName("second"), Message.forName("seconds"));
//       long seconds = Challenges.getInstance().getChallengeTimer().getTime();
//       long minutes = seconds / 60L;
//       long hours = minutes / 60L;
//       seconds %= 60L;
//       minutes %= 60L;
//       Inventory inventory = (Inventory)this.inventories.get(1);
//       inventory.setItem(HOUR_SLOTS[1], this.getTimeItem(hours, Message.forName("hour"), Message.forName("hours")));
//       inventory.setItem(MINUTE_SLOTS[1], this.getTimeItem(minutes, Message.forName("minute"), Message.forName("minutes")));
//       inventory.setItem(SECOND_SLOTS[1], this.getTimeItem(seconds, Message.forName("second"), Message.forName("seconds")));
//    }
//
//    private void setTimeNavigation(@Nonnull int[] slots, @Nonnull Message singular, @Nonnull Message plural) {
//       Inventory inventory = (Inventory)this.inventories.get(1);
//       inventory.setItem(slots[0], this.getNavigationItem(true, singular, plural));
//       inventory.setItem(slots[2], this.getNavigationItem(false, singular, plural));
//    }
//
//    @Nonnull
//    private ItemStack getNavigationItem(boolean up, @Nonnull Message singular, @Nonnull Message plural) {
//       return (new ItemBuilder(up ? Material.DARK_OAK_BUTTON : Material.STONE_BUTTON)).name(" ", "§7§o[Click] §8» §" + (up ? "a+" : "c-") + "1 " + singular, "§7§o[Shift-Click] §8» §" + (up ? "a+" : "c-") + "10 " + plural, " ").hideAttributes().build();
//    }
//
//    @Nonnull
//    private ItemStack getTimeItem(long value, @Nonnull Message singular, @Nonnull Message plural) {
//       return (new ItemBuilder(Material.CLOCK)).name("§8» §7" + (value == 1L ? singular : plural) + ": §e" + value, " ", "§7§o[Click] §8» §cReset §7timer", " ").hideAttributes().amount((int)Math.max(value, 1L)).build();
//    }
//
//    @Nonnull
//    private Inventory createNewInventory(int page) {
//       Inventory inventory = Bukkit.createInventory(MenuPosition.HOLDER, 45, InventoryTitleManager.getTitle(MenuType.TIMER, page));
//       InventoryUtils.fillInventory(inventory, ItemBuilder.FILL_ITEM);
//       int[] var3 = new int[]{1, 2, 6, 7, 9, 10, 16, 17, 27, 28, 34, 35, 37, 38, 39, 41, 42, 43};
//       int var4 = var3.length;
//
//       for(int var5 = 0; var5 < var4; ++var5) {
//          int i = var3[var5];
//          inventory.setItem(i, ItemBuilder.FILL_ITEM_2);
//       }
//
//       this.inventories.add(inventory);
//       return inventory;
//    }
//
//    private void setNavigation() {
//       InventoryUtils.setNavigationItemsToInventory(this.inventories, NAVIGATION_SLOTS);
//    }
//
//    public void generateInventories() {
//       this.createNewInventory(0);
//       this.createNewInventory(1);
//       this.setNavigation();
//       this.updateInventories();
//    }
//
//    public List getInventories() {
//       return this.inventories;
//    }
//
//    public MenuPosition getMenuPosition(int page) {
//       return new TimerMenuGenerator.TimerMenuPosition(page);
//    }
//
//    private class TimerMenuPosition implements MenuPosition {
//       private final int page;
//
//       public TimerMenuPosition(@Nonnegative int page) {
//          this.page = page;
//       }
//
//       public void handleClick(@Nonnull MenuClickInfo info) {
//          if (info.getSlot() == TimerMenuGenerator.NAVIGATION_SLOTS[0]) {
//             SoundSample.CLICK.play(info.getPlayer());
//             if (this.page == 0) {
//                Challenges.getInstance().getMenuManager().openGUIInstantly(info.getPlayer());
//             } else {
//                TimerMenuGenerator.this.open(info.getPlayer(), this.page - 1);
//             }
//
//          } else if (info.getSlot() == TimerMenuGenerator.NAVIGATION_SLOTS[1]) {
//             SoundSample.CLICK.play(info.getPlayer());
//             if (this.page < TimerMenuGenerator.this.inventories.size() - 1) {
//                TimerMenuGenerator.this.open(info.getPlayer(), this.page + 1);
//             }
//
//          } else {
//             if (this.page == 0) {
//                if (info.getSlot() == 21) {
//                   if (this.playNoPermissionsEffect(info.getPlayer())) {
//                      return;
//                   }
//
//                   if (Challenges.getInstance().getChallengeTimer().isStarted()) {
//                      Challenges.getInstance().getChallengeTimer().pause(true);
//                   } else {
//                      Challenges.getInstance().getChallengeTimer().resume();
//                   }
//
//                   return;
//                }
//
//                if (info.getSlot() == 23) {
//                   if (this.playNoPermissionsEffect(info.getPlayer())) {
//                      return;
//                   }
//
//                   Challenges.getInstance().getChallengeTimer().setCountingUp(!Challenges.getInstance().getChallengeTimer().isCountingUp());
//                   return;
//                }
//             } else if (this.page == 1) {
//                int[][] var2 = new int[][]{TimerMenuGenerator.HOUR_SLOTS, TimerMenuGenerator.MINUTE_SLOTS, TimerMenuGenerator.SECOND_SLOTS};
//                int var3 = var2.length;
//
//                for(int var4 = 0; var4 < var3; ++var4) {
//                   int[] slots = var2[var4];
//
//                   for(int i = 0; i < 3; ++i) {
//                      if (info.getSlot() == slots[i]) {
//                         if (this.playNoPermissionsEffect(info.getPlayer())) {
//                            return;
//                         }
//
//                         if (i == 1) {
//                            Challenges.getInstance().getChallengeTimer().reset();
//                            SoundSample.BASS_OFF.play(info.getPlayer());
//                            TimerMenuGenerator.this.updateInventories();
//                            Challenges.getInstance().getChallengeTimer().updateActionbar();
//                            return;
//                         }
//
//                         int amount = slots == TimerMenuGenerator.HOUR_SLOTS ? 3600 : (slots == TimerMenuGenerator.MINUTE_SLOTS ? 60 : 1);
//                         if (info.isShiftClick()) {
//                            amount *= 10;
//                         }
//
//                         boolean plus = i == 0;
//                         Challenges.getInstance().getChallengeTimer().addSeconds(plus ? amount : -amount);
//                         TimerMenuGenerator.this.updateInventories();
//                         SoundSample.PLOP.play(info.getPlayer());
//                         return;
//                      }
//                   }
//                }
//             }
//
//             SoundSample.CLICK.play(info.getPlayer());
//          }
//       }
//
//       private boolean playNoPermissionsEffect(@Nonnull Player player) {
//          if (this.mayManageTimer(player)) {
//             return false;
//          } else {
//             Challenges.getInstance().getMenuManager().playNoPermissionsEffect(player);
//             return true;
//          }
//       }
//
//       private boolean mayManageTimer(@Nonnull Player player) {
//          return player.hasPermission("challenges.timer");
//       }
//    }
// }
//
