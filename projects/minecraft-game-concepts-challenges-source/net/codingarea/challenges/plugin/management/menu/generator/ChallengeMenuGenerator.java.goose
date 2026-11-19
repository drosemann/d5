// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/management/menu/generator/ChallengeMenuGenerator.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/management/menu/generator/ChallengeMenuGenerator.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/management/menu/generator/ChallengeMenuGenerator.java), unveraendert, als Inline-Doku ----
// package net.codingarea.challenges.plugin.management.menu.generator;
//
// import com.google.common.collect.ImmutableList;
// import java.util.Iterator;
// import java.util.LinkedList;
// import java.util.List;
// import java.util.function.Consumer;
// import javax.annotation.Nonnegative;
// import javax.annotation.Nonnull;
// import net.anweisen.utilities.bukkit.utils.animation.SoundSample;
// import net.anweisen.utilities.bukkit.utils.logging.Logger;
// import net.anweisen.utilities.bukkit.utils.menu.MenuClickInfo;
// import net.anweisen.utilities.bukkit.utils.menu.MenuPosition;
// import net.anweisen.utilities.common.version.Version;
// import net.codingarea.challenges.plugin.Challenges;
// import net.codingarea.challenges.plugin.challenges.type.IChallenge;
// import net.codingarea.challenges.plugin.content.Message;
// import net.codingarea.challenges.plugin.management.menu.MenuManager;
// import net.codingarea.challenges.plugin.management.menu.position.GeneratorMenuPosition;
// import net.codingarea.challenges.plugin.utils.item.ItemBuilder;
// import net.codingarea.challenges.plugin.utils.misc.InventoryUtils;
// import org.bukkit.Material;
// import org.bukkit.entity.Player;
// import org.bukkit.inventory.Inventory;
// import org.bukkit.inventory.ItemStack;
//
// public abstract class ChallengeMenuGenerator extends MultiPageMenuGenerator {
//    protected final List challenges;
//    protected final boolean newSuffix;
//    private final int startPage;
//    protected Consumer onLeaveClick;
//
//    public ChallengeMenuGenerator(int startPage, Consumer onLeaveClick) {
//       this.challenges = new LinkedList();
//       this.newSuffix = Challenges.getInstance().getConfigDocument().getBoolean("new-suffix");
//       this.startPage = startPage;
//       this.onLeaveClick = onLeaveClick;
//    }
//
//    public ChallengeMenuGenerator(int startPage) {
//       this(startPage, (player) -> {
//          Challenges.getInstance().getMenuManager().openGUIInstantly(player);
//       });
//    }
//
//    public ChallengeMenuGenerator() {
//       this(0);
//    }
//
//    public static boolean playNoPermissionsEffect(@Nonnull Player player) {
//       MenuManager menuManager = Challenges.getInstance().getMenuManager();
//       if (!menuManager.permissionToManageGUI()) {
//          return false;
//       } else if (mayManageSettings(player)) {
//          return false;
//       } else {
//          menuManager.playNoPermissionsEffect(player);
//          return true;
//       }
//    }
//
//    private static boolean mayManageSettings(@Nonnull Player player) {
//       return player.hasPermission("challenges.manage");
//    }
//
//    public MenuPosition getMenuPosition(int page) {
//       return new ChallengeMenuGenerator.ChallengeMenuPositionGenerator(this, page);
//    }
//
//    public int getPagesCount() {
//       return (int)(Math.ceil((double)this.challenges.size() / (double)this.getSlots().length) + (double)this.startPage);
//    }
//
//    public void generatePage(@Nonnull Inventory inventory, int page) {
//    }
//
//    public void generateInventories() {
//       super.generateInventories();
//       Iterator var1 = this.challenges.iterator();
//
//       while(var1.hasNext()) {
//          IChallenge challenge = (IChallenge)var1.next();
//          this.updateItem(challenge);
//       }
//
//    }
//
//    public void updateItem(IChallenge challenge) {
//       int index = this.challenges.indexOf(challenge);
//       if (index != -1) {
//          int page = index / this.getSlots().length;
//          if (page < this.getInventories().size()) {
//             int slot = index - this.getSlots().length * page;
//             Inventory inventory = (Inventory)this.getInventories().get(page + this.startPage);
//             this.setSettingsItems(inventory, challenge, slot);
//             if (this.newSuffix && this.isNew(challenge)) {
//                inventory.setItem(slot + 1, (new ItemBuilder(Material.LIME_STAINED_GLASS_PANE, "§0")).build());
//                inventory.setItem(slot + 28, (new ItemBuilder(Material.LIME_STAINED_GLASS_PANE, "§0")).build());
//             }
//
//          }
//       }
//    }
//
//    public int getPageOfChallenge(IChallenge challenge) {
//       int index = this.challenges.indexOf(challenge);
//       if (index == -1) {
//          return -1;
//       } else {
//          int page = index / this.getSlots().length;
//          return page >= this.getInventories().size() ? -1 : page;
//       }
//    }
//
//    public void setSettingsItems(@Nonnull Inventory inventory, @Nonnull IChallenge challenge, int topSlot) {
//       inventory.setItem(this.getSlots()[topSlot], this.getDisplayItem(challenge));
//       inventory.setItem(this.getSlots()[topSlot] + 9, this.getSettingsItem(challenge));
//    }
//
//    public void resetChallengeCache() {
//       this.challenges.clear();
//    }
//
//    public boolean isInChallengeCache(@Nonnull IChallenge challenge) {
//       return this.challenges.contains(challenge);
//    }
//
//    public void addChallengeToCache(@Nonnull IChallenge challenge) {
//       if (this.isNew(challenge) && Challenges.getInstance().getMenuManager().isDisplayNewInFront()) {
//          this.challenges.add(this.countNewChallenges(), challenge);
//       } else {
//          this.challenges.add(challenge);
//       }
//
//    }
//
//    public void removeChallengeFromCache(@Nonnull IChallenge challenge) {
//       this.challenges.remove(challenge);
//    }
//
//    protected ItemStack getDisplayItem(@Nonnull IChallenge challenge) {
//       return this.getDisplayItemBuilder(challenge).build();
//    }
//
//    protected ItemBuilder getDisplayItemBuilder(@Nonnull IChallenge challenge) {
//       try {
//          ItemBuilder item = (new ItemBuilder(challenge.getDisplayItem())).hideAttributes();
//          return this.newSuffix && this.isNew(challenge) ? item.appendName(" " + Message.forName("new-challenge")) : item;
//       } catch (Exception var3) {
//          Logger.error("Error while generating challenge display item for challenge {}", challenge.getClass().getSimpleName(), var3);
//          return new ItemBuilder();
//       }
//    }
//
//    protected ItemStack getSettingsItem(@Nonnull IChallenge challenge) {
//       try {
//          ItemBuilder item = (new ItemBuilder(challenge.getSettingsItem())).hideAttributes();
//          return item.build();
//       } catch (Exception var3) {
//          Logger.error("Error while generating challenge settings item for challenge {}", challenge.getClass().getSimpleName(), var3);
//          return (new ItemBuilder()).build();
//       }
//    }
//
//    protected boolean isNew(@Nonnull IChallenge challenge) {
//       Version version = Challenges.getInstance().getVersion();
//       Version since = Version.getAnnotatedSince(challenge);
//       return since.isNewerOrEqualThan(version);
//    }
//
//    protected int countNewChallenges() {
//       return (int)this.challenges.stream().filter(this::isNew).count();
//    }
//
//    public abstract int[] getSlots();
//
//    public abstract void executeClickAction(@Nonnull IChallenge var1, @Nonnull MenuClickInfo var2, int var3);
//
//    public void onPreChallengePageClicking(@Nonnull MenuClickInfo clickInfo, @Nonnegative int page) {
//    }
//
//    public List getChallenges() {
//       return ImmutableList.copyOf(this.challenges);
//    }
//
//    private class ChallengeMenuPositionGenerator extends GeneratorMenuPosition {
//       public ChallengeMenuPositionGenerator(MenuGenerator generator, int page) {
//          super(generator, page);
//       }
//
//       public void handleClick(@Nonnull MenuClickInfo info) {
//          if (!InventoryUtils.handleNavigationClicking(this.generator, ChallengeMenuGenerator.this.getNavigationSlots(this.page), this.page, info, () -> {
//             ChallengeMenuGenerator.this.onLeaveClick.accept(info.getPlayer());
//          })) {
//             if (this.page < ChallengeMenuGenerator.this.startPage) {
//                ChallengeMenuGenerator.this.onPreChallengePageClicking(info, this.page);
//             } else {
//                int itemIndex = 0;
//                int index = 0;
//                int[] var4 = ChallengeMenuGenerator.this.getSlots();
//                int var5 = var4.length;
//
//                for(int var6 = 0; var6 < var5; ++var6) {
//                   int i = var4[var6];
//                   if (i == info.getSlot()) {
//                      break;
//                   }
//
//                   if (i + 9 == info.getSlot()) {
//                      itemIndex = 1;
//                      break;
//                   }
//
//                   if (i + 18 == info.getSlot()) {
//                      itemIndex = 2;
//                      break;
//                   }
//
//                   ++index;
//                }
//
//                if (itemIndex >= 2) {
//                   SoundSample.CLICK.play(info.getPlayer());
//                } else if (index == ChallengeMenuGenerator.this.getSlots().length) {
//                   SoundSample.CLICK.play(info.getPlayer());
//                } else {
//                   int offset = (this.page - ChallengeMenuGenerator.this.startPage) * ChallengeMenuGenerator.this.getSlots().length;
//                   index += offset;
//                   if (index >= ChallengeMenuGenerator.this.challenges.size()) {
//                      SoundSample.CLICK.play(info.getPlayer());
//                   } else {
//                      IChallenge challenge = (IChallenge)ChallengeMenuGenerator.this.challenges.get(index);
//                      if (!ChallengeMenuGenerator.playNoPermissionsEffect(info.getPlayer())) {
//                         try {
//                            ChallengeMenuGenerator.this.executeClickAction(challenge, info, itemIndex);
//                            ChallengeMenuGenerator.this.updateItem(challenge);
//                         } catch (Exception var8) {
//                            Logger.error("An exception occurred while handling click on {}", challenge.getClass().getName(), var8);
//                         }
//
//                      }
//                   }
//                }
//             }
//          }
//       }
//    }
// }
//
