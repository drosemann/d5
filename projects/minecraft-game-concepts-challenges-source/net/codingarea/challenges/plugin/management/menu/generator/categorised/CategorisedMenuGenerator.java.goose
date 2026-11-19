// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/management/menu/generator/categorised/CategorisedMenuGenerator.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/management/menu/generator/categorised/CategorisedMenuGenerator.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/management/menu/generator/categorised/CategorisedMenuGenerator.java), unveraendert, als Inline-Doku ----
// package net.codingarea.challenges.plugin.management.menu.generator.categorised;
//
// import java.util.Comparator;
// import java.util.Iterator;
// import java.util.LinkedHashMap;
// import java.util.List;
// import java.util.Map;
// import java.util.Map.Entry;
// import java.util.stream.Collectors;
// import net.anweisen.utilities.bukkit.utils.animation.SoundSample;
// import net.anweisen.utilities.bukkit.utils.menu.MenuPosition;
// import net.codingarea.challenges.plugin.Challenges;
// import net.codingarea.challenges.plugin.challenges.type.IChallenge;
// import net.codingarea.challenges.plugin.content.Message;
// import net.codingarea.challenges.plugin.management.menu.InventoryTitleManager;
// import net.codingarea.challenges.plugin.management.menu.MenuType;
// import net.codingarea.challenges.plugin.management.menu.generator.implementation.SettingsMenuGenerator;
// import net.codingarea.challenges.plugin.utils.item.ItemBuilder;
// import net.codingarea.challenges.plugin.utils.misc.InventoryUtils;
// import org.bukkit.ChatColor;
// import org.bukkit.inventory.Inventory;
// import org.jetbrains.annotations.NotNull;
//
// public class CategorisedMenuGenerator extends SettingsMenuGenerator {
//    private final Map categories = new LinkedHashMap();
//
//    public void addChallengeToCache(@NotNull IChallenge challenge) {
//       SettingCategory category = challenge.getCategory() != null ? challenge.getCategory() : this.getMiscCategory();
//       if (!this.categories.containsKey(challenge.getCategory())) {
//          this.categories.computeIfAbsent(category, (challengeCategory) -> {
//             CategorisedMenuGenerator.CategorisedSettingsMenuGenerator generator = new CategorisedMenuGenerator.CategorisedSettingsMenuGenerator(this, category);
//             generator.setMenuType(this.getMenuType());
//             return generator;
//          });
//       }
//
//       ((CategorisedMenuGenerator.CategorisedSettingsMenuGenerator)this.categories.get(category)).addChallengeToCache(challenge);
//    }
//
//    public void resetChallengeCache() {
//       this.categories.clear();
//    }
//
//    private SettingCategory getMiscCategory() {
//       return this.getMenuType() == MenuType.GOAL ? SettingCategory.MISC_GOAL : SettingCategory.MISC_CHALLENGE;
//    }
//
//    public void generatePage(@NotNull Inventory inventory, int page) {
//       int i = 0;
//
//       for(Iterator var4 = this.getCategoriesForPage(page).iterator(); var4.hasNext(); ++i) {
//          Entry entry = (Entry)var4.next();
//          SettingCategory category = (SettingCategory)entry.getKey();
//          CategorisedMenuGenerator.CategorisedSettingsMenuGenerator generator = (CategorisedMenuGenerator.CategorisedSettingsMenuGenerator)entry.getValue();
//          ItemBuilder builder = category.getDisplayItem();
//          String attachment = this.getLoreAttachment(generator);
//          if (!attachment.isEmpty()) {
//             builder.appendLore("", attachment);
//          }
//
//          int slot = i + 10;
//          if (i >= 7) {
//             slot += 2;
//          }
//
//          Iterator var11 = generator.getChallenges().iterator();
//
//          while(var11.hasNext()) {
//             IChallenge challenge = (IChallenge)var11.next();
//             if (this.newSuffix && this.isNew(challenge)) {
//                builder.appendName(" " + Message.forName("new-challenge"));
//                break;
//             }
//          }
//
//          inventory.setItem(slot, builder.build());
//       }
//
//    }
//
//    private String getLoreAttachment(CategorisedMenuGenerator.CategorisedSettingsMenuGenerator generator) {
//       if (this.getMenuType() == MenuType.GOAL) {
//          Iterator var4 = generator.getChallenges().iterator();
//
//          IChallenge challenge;
//          do {
//             if (!var4.hasNext()) {
//                return Message.forName("lore-category-deactivated").asString();
//             }
//
//             challenge = (IChallenge)var4.next();
//          } while(!challenge.isEnabled());
//
//          return Message.forName("lore-category-activated").asString();
//       } else {
//          long activatedCount = generator.getChallenges().stream().filter(IChallenge::isEnabled).count();
//          return Message.forName("lore-category-activated-count").asString(activatedCount, generator.getChallenges().size());
//       }
//    }
//
//    public void updateItem(IChallenge challenge) {
//       this.generateInventories();
//       Iterator var2 = this.categories.entrySet().iterator();
//
//       while(var2.hasNext()) {
//          Entry entry = (Entry)var2.next();
//          if (((CategorisedMenuGenerator.CategorisedSettingsMenuGenerator)entry.getValue()).getChallenges().contains(challenge)) {
//             ((CategorisedMenuGenerator.CategorisedSettingsMenuGenerator)entry.getValue()).updateGeneratorItem(challenge);
//          }
//       }
//
//    }
//
//    public int getPagesCount() {
//       return (int)Math.ceil((double)this.categories.size() / (double)this.getEntriesPerPage());
//    }
//
//    public int getEntriesPerPage() {
//       return 14;
//    }
//
//    public MenuPosition getMenuPosition(int page) {
//       return (info) -> {
//          if (!InventoryUtils.handleNavigationClicking(this, this.getNavigationSlots(page), page, info, () -> {
//             Challenges.getInstance().getMenuManager().openGUIInstantly(info.getPlayer());
//          })) {
//             int i = 0;
//
//             for(Iterator var4 = this.getCategoriesForPage(page).iterator(); var4.hasNext(); ++i) {
//                Entry entry = (Entry)var4.next();
//                int slot = i + 10;
//                if (i >= 7) {
//                   slot += 2;
//                }
//
//                if (slot == info.getSlot()) {
//                   SettingsMenuGenerator generator = (SettingsMenuGenerator)entry.getValue();
//                   SoundSample.CLICK.play(info.getPlayer());
//                   generator.open(info.getPlayer(), 0);
//                   return;
//                }
//             }
//
//             SoundSample.CLICK.play(info.getPlayer());
//          }
//       };
//    }
//
//    private List getCategoriesForPage(int page) {
//       List list = (List)this.categories.entrySet().stream().sorted(Comparator.comparingInt((value) -> {
//          return ((SettingCategory)value.getKey()).getPriority();
//       })).collect(Collectors.toList());
//       int entriesPerPage = this.getEntriesPerPage();
//       int startIndex = page * entriesPerPage;
//       int endIndex = Math.min(page * entriesPerPage + entriesPerPage, this.categories.size());
//       return list.subList(startIndex, endIndex);
//    }
//
//    public static class CategorisedSettingsMenuGenerator extends SettingsMenuGenerator {
//       private final CategorisedMenuGenerator generator;
//       private final SettingCategory category;
//
//       public CategorisedSettingsMenuGenerator(CategorisedMenuGenerator generator, SettingCategory category) {
//          this.generator = generator;
//          this.category = category;
//          this.onLeaveClick = (player) -> {
//             SoundSample.CLICK.play(player);
//             generator.open(player, 0);
//          };
//       }
//
//       protected String getTitle(int page) {
//          String[] strings = ((Message)this.category.getMessageSupplier().get()).asArray();
//          String display = strings.length == 0 ? "" : ChatColor.stripColor(strings[0]);
//          return InventoryTitleManager.getTitle(this.getMenuType(), display, String.valueOf(page + 1));
//       }
//
//       public void updateItem(IChallenge challenge) {
//          this.generator.updateItem(challenge);
//          super.updateItem(challenge);
//       }
//
//       public void updateGeneratorItem(IChallenge challenge) {
//          super.updateItem(challenge);
//       }
//    }
// }
//
