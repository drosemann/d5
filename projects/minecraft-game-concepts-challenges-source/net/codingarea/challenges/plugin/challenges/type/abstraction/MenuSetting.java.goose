// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/type/abstraction/MenuSetting.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/type/abstraction/MenuSetting.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/type/abstraction/MenuSetting.java), unveraendert, als Inline-Doku ----
// package net.codingarea.challenges.plugin.challenges.type.abstraction;
//
// import java.util.ArrayList;
// import java.util.Collection;
// import java.util.Iterator;
// import java.util.LinkedHashMap;
// import java.util.List;
// import java.util.Map;
// import java.util.Map.Entry;
// import java.util.function.Function;
// import java.util.function.Supplier;
// import javax.annotation.Nonnull;
// import javax.annotation.Nullable;
// import lombok.Generated;
// import net.anweisen.utilities.bukkit.utils.animation.SoundSample;
// import net.anweisen.utilities.bukkit.utils.menu.MenuClickInfo;
// import net.anweisen.utilities.bukkit.utils.menu.MenuPosition;
// import net.anweisen.utilities.bukkit.utils.menu.positions.EmptyMenuPosition;
// import net.anweisen.utilities.common.config.Document;
// import net.codingarea.challenges.plugin.Challenges;
// import net.codingarea.challenges.plugin.content.Message;
// import net.codingarea.challenges.plugin.management.menu.InventoryTitleManager;
// import net.codingarea.challenges.plugin.management.menu.MenuType;
// import net.codingarea.challenges.plugin.management.menu.generator.implementation.SettingsMenuGenerator;
// import net.codingarea.challenges.plugin.management.menu.info.ChallengeMenuClickInfo;
// import net.codingarea.challenges.plugin.utils.item.DefaultItem;
// import net.codingarea.challenges.plugin.utils.item.ItemBuilder;
// import net.codingarea.challenges.plugin.utils.misc.InventoryUtils;
// import org.bukkit.Bukkit;
// import org.bukkit.Material;
// import org.bukkit.entity.Player;
// import org.bukkit.event.Listener;
// import org.bukkit.inventory.Inventory;
// import org.bukkit.inventory.ItemStack;
//
// public abstract class MenuSetting extends Setting {
//    private final Map settings = new LinkedHashMap();
//    private final List inventories = new ArrayList();
//    private final Message title;
//
//    public MenuSetting(@Nonnull MenuType menu, @Nonnull Message title) {
//       super(menu);
//       this.title = title;
//    }
//
//    @Nonnull
//    public static int[] getSlots(int amount) {
//       switch(amount) {
//       case 1:
//          return new int[]{13};
//       case 2:
//          return new int[]{12, 14};
//       case 3:
//          return new int[]{11, 13, 15};
//       case 4:
//          return new int[]{10, 12, 14, 16};
//       default:
//          return new int[0];
//       }
//    }
//
//    protected final void generateInventories() {
//       this.inventories.clear();
//       int maxRowLength = 4;
//       int page = 0;
//       int index = 0;
//       Collection settings = this.settings.values();
//       int pagesTotal = settings.size() / maxRowLength;
//       if (settings.size() % maxRowLength != 0) {
//          ++pagesTotal;
//       }
//
//       for(Iterator var6 = settings.iterator(); var6.hasNext(); ++index) {
//          MenuSetting.SubSetting setting = (MenuSetting.SubSetting)var6.next();
//          if (index >= maxRowLength) {
//             index = 0;
//             ++page;
//             this.createNewInventory(page, pagesTotal);
//          } else if (this.inventories.isEmpty()) {
//             this.createNewInventory(page, pagesTotal);
//          }
//
//          int added = page * maxRowLength + index;
//          int left = settings.size() - added;
//          int fitOnThisPage = index + left;
//          if (fitOnThisPage > 4) {
//             fitOnThisPage = 4;
//          }
//
//          int[] slots = getSlots(fitOnThisPage);
//          int displaySlot = slots[index];
//          setting.setPage(page);
//          setting.setSlot(displaySlot);
//          setting.updateItems();
//       }
//
//       InventoryUtils.setNavigationItemsToInventory(this.inventories, SettingsMenuGenerator.NAVIGATION_SLOTS, true);
//    }
//
//    @Nonnull
//    private Inventory createNewInventory(int page, int pagesAmount) {
//       Inventory inventory = Bukkit.createInventory(MenuPosition.HOLDER, 36, InventoryTitleManager.getMenuSettingTitle(this.getType(), this.title.asString(), page, pagesAmount > 1));
//       InventoryUtils.fillInventory(inventory, ItemBuilder.FILL_ITEM);
//       this.inventories.add(inventory);
//       return inventory;
//    }
//
//    protected final void registerSetting(@Nonnull String name, @Nonnull MenuSetting.SubSetting setting) {
//       if (name.equals("enabled")) {
//          throw new IllegalArgumentException();
//       } else {
//          this.settings.put(name, setting);
//          Challenges.getInstance().registerListener(new Listener[]{setting});
//       }
//    }
//
//    public final MenuSetting.SubSetting getSetting(@Nonnull String name) {
//       return (MenuSetting.SubSetting)this.settings.get(name);
//    }
//
//    public void handleClick(@Nonnull ChallengeMenuClickInfo info) {
//       if (info.isUpperItemClick()) {
//          super.handleClick(info);
//       } else if (this.isEnabled() && !info.isRightClick()) {
//          this.openMenu(info);
//       } else {
//          super.handleClick(info);
//       }
//
//    }
//
//    private void openMenu(@Nonnull ChallengeMenuClickInfo event) {
//       MenuPosition position = MenuPosition.get(event.getPlayer());
//       if (position == null) {
//          position = new EmptyMenuPosition();
//       }
//
//       Inventory inventory = event.getInventory();
//       SoundSample.CLICK.play(event.getPlayer());
//       this.open(event.getPlayer(), inventory, (MenuPosition)position, 0);
//    }
//
//    private void open(@Nonnull Player player, @Nonnull Inventory inventory, @Nonnull MenuPosition position, int page) {
//       if (this.inventories.isEmpty()) {
//          this.generateInventories();
//       }
//
//       if (this.inventories.isEmpty()) {
//          SoundSample.BASS_OFF.play(player);
//       } else {
//          if (page >= this.inventories.size()) {
//             page = this.inventories.size() - 1;
//          }
//
//          Inventory menu = (Inventory)this.inventories.get(page);
//          MenuPosition.set(player, new MenuSetting.SettingMenuPosition(position, inventory, page));
//          player.openInventory(menu);
//       }
//    }
//
//    @Nonnull
//    public final ItemBuilder createSettingsItem() {
//       return this.isEnabled() ? DefaultItem.customize() : DefaultItem.disabled();
//    }
//
//    public void writeSettings(@Nonnull Document document) {
//       document.set("enabled", this.isEnabled());
//       Iterator var2 = this.settings.entrySet().iterator();
//
//       while(var2.hasNext()) {
//          Entry entry = (Entry)var2.next();
//          Document subDocument = document.getDocument((String)entry.getKey());
//          ((MenuSetting.SubSetting)entry.getValue()).writeSettings(subDocument);
//       }
//
//    }
//
//    public void loadSettings(@Nonnull Document document) {
//       this.setEnabled(document.getBoolean("enabled"));
//       Iterator var2 = this.settings.entrySet().iterator();
//
//       while(var2.hasNext()) {
//          Entry entry = (Entry)var2.next();
//          if (document.contains((String)entry.getKey())) {
//             Document subDocument = document.getDocument((String)entry.getKey());
//             ((MenuSetting.SubSetting)entry.getValue()).loadSettings(subDocument);
//          }
//       }
//
//    }
//
//    public void restoreDefaults() {
//       super.restoreDefaults();
//       this.settings.values().forEach(MenuSetting.SubSetting::restoreDefaults);
//    }
//
//    public abstract class SubSetting implements Listener {
//       private int page = -1;
//       private int slot = -1;
//
//       private void setPage(int page) {
//          this.page = page;
//       }
//
//       private void setSlot(int slot) {
//          this.slot = slot;
//       }
//
//       public final void updateItems() {
//          if (!MenuSetting.this.inventories.isEmpty()) {
//             if (this.page != -1 && this.slot != -1) {
//                Inventory inventory = (Inventory)MenuSetting.this.inventories.get(this.page);
//                inventory.setItem(this.slot, this.getDisplayItem().hideAttributes().build());
//                inventory.setItem(this.slot + 9, this.buildSettingsItem());
//             }
//          }
//       }
//
//       @Nonnull
//       private ItemStack buildSettingsItem() {
//          ItemBuilder item = this.getSettingsItem();
//          String[] description = this.getSettingsDescription();
//          if (description != null && this.isEnabled()) {
//             item.appendLore(" ");
//             item.appendLore(description);
//          }
//
//          return item.build();
//       }
//
//       @Nonnull
//       public abstract ItemBuilder getDisplayItem();
//
//       @Nonnull
//       public abstract ItemBuilder getSettingsItem();
//
//       @Nullable
//       protected abstract String[] getSettingsDescription();
//
//       public boolean isEnabled() {
//          return MenuSetting.this.isEnabled() && this.getAsBoolean();
//       }
//
//       public abstract int getAsInt();
//
//       public abstract boolean getAsBoolean();
//
//       public abstract void restoreDefaults();
//
//       public abstract void loadSettings(@Nonnull Document var1);
//
//       public abstract void writeSettings(@Nonnull Document var1);
//
//       public abstract void handleClick(@Nonnull ChallengeMenuClickInfo var1);
//    }
//
//    private final class SettingMenuPosition implements MenuPosition {
//       private final MenuPosition before;
//       private final Inventory inventoryBefore;
//       private final int page;
//
//       public SettingMenuPosition(@Nonnull MenuPosition before, @Nonnull Inventory inventoryBefore, int page) {
//          this.before = before;
//          this.inventoryBefore = inventoryBefore;
//          this.page = page;
//       }
//
//       public void handleClick(@Nonnull MenuClickInfo info) {
//          if (info.getSlot() == SettingsMenuGenerator.NAVIGATION_SLOTS[0]) {
//             if (this.page == 0) {
//                MenuPosition.set(info.getPlayer(), this.before);
//                info.getPlayer().openInventory(this.inventoryBefore);
//             } else {
//                MenuSetting.this.open(info.getPlayer(), this.inventoryBefore, this.before, this.page - 1);
//             }
//
//             SoundSample.CLICK.play(info.getPlayer());
//          } else if (info.getSlot() == SettingsMenuGenerator.NAVIGATION_SLOTS[1]) {
//             MenuSetting.this.open(info.getPlayer(), this.inventoryBefore, this.before, this.page + 1);
//             SoundSample.CLICK.play(info.getPlayer());
//          } else {
//             Iterator var2 = MenuSetting.this.settings.values().iterator();
//
//             MenuSetting.SubSetting setting;
//             do {
//                do {
//                   if (!var2.hasNext()) {
//                      SoundSample.CLICK.play(info.getPlayer());
//                      return;
//                   }
//
//                   setting = (MenuSetting.SubSetting)var2.next();
//                } while(setting.page != this.page);
//             } while(info.getSlot() != setting.slot && info.getSlot() != setting.slot + 9);
//
//             setting.handleClick(new ChallengeMenuClickInfo(info, info.getSlot() == setting.slot));
//          }
//       }
//    }
//
//    public class NumberAndBooleanSubSetting extends MenuSetting.NumberSubSetting {
//       private final boolean enabledByDefault = false;
//       private boolean enabled;
//
//       public NumberAndBooleanSubSetting(@Nonnull Supplier item, @Nonnull Function description, @Nullable Function name) {
//          super(item, description, name);
//       }
//
//       public NumberAndBooleanSubSetting(@Nonnull Supplier item, @Nonnull Function description, @Nullable Function name, int max) {
//          super(item, description, name, max);
//       }
//
//       public NumberAndBooleanSubSetting(@Nonnull Supplier item, @Nonnull Function description, @Nullable Function name, int min, int max) {
//          super(item, description, name, min, max);
//       }
//
//       public NumberAndBooleanSubSetting(@Nonnull Supplier item, @Nonnull Function description, @Nullable Function name, int min, int max, int defaultValue) {
//          super(item, description, name, min, max, defaultValue);
//       }
//
//       public NumberAndBooleanSubSetting(@Nonnull Supplier item, @Nonnull Function description) {
//          super(item, description);
//       }
//
//       public NumberAndBooleanSubSetting(@Nonnull Supplier item, @Nonnull Function description, int max) {
//          super(item, description, max);
//       }
//
//       public NumberAndBooleanSubSetting(@Nonnull Supplier item, @Nonnull Function description, int min, int max) {
//          super(item, description, min, max);
//       }
//
//       public NumberAndBooleanSubSetting(@Nonnull Supplier item, @Nonnull Function description, int min, int max, int defaultValue) {
//          super(item, description, min, max, defaultValue);
//       }
//
//       public NumberAndBooleanSubSetting(@Nonnull Supplier item) {
//          super(item);
//       }
//
//       public NumberAndBooleanSubSetting(@Nonnull Supplier item, int max) {
//          super(item, max);
//       }
//
//       public NumberAndBooleanSubSetting(@Nonnull Supplier item, int min, int max) {
//          super(item, min, max);
//       }
//
//       public void restoreDefaults() {
//          super.restoreDefaults();
//          this.setEnabled(false);
//       }
//
//       public void setEnabled(boolean enabled) {
//          if (this.enabled != enabled) {
//             this.enabled = enabled;
//             if (enabled) {
//                this.onEnable();
//             } else {
//                this.onDisable();
//             }
//
//             this.updateItems();
//          }
//       }
//
//       public boolean getAsBoolean() {
//          return this.enabled;
//       }
//
//       public void handleClick(@Nonnull ChallengeMenuClickInfo info) {
//          if (!info.isUpperItemClick() && this.enabled) {
//             super.handleClick(info);
//          } else {
//             this.setEnabled(!this.enabled);
//             SoundSample.playStatusSound(info.getPlayer(), this.enabled);
//          }
//
//       }
//
//       public void loadSettings(@Nonnull Document document) {
//          super.loadSettings(document);
//          this.setEnabled(document.getBoolean("enabled"));
//       }
//
//       public void writeSettings(@Nonnull Document document) {
//          super.writeSettings(document);
//          document.set("enabled", this.enabled);
//       }
//
//       protected void onEnable() {
//       }
//
//       protected void onDisable() {
//       }
//    }
//
//    public class NumberSubSetting extends MenuSetting.SubSetting {
//       private final Supplier item;
//       private final Function description;
//       private final Function name;
//       private final int max;
//       private final int min;
//       private final int defaultValue;
//       private int value;
//
//       public NumberSubSetting(@Nonnull Supplier item, @Nonnull Function description, @Nullable Function name) {
//          this(item, description, name, 64);
//       }
//
//       public NumberSubSetting(@Nonnull Supplier item, @Nonnull Function description, @Nullable Function name, int max) {
//          this(item, description, name, max, 1);
//       }
//
//       public NumberSubSetting(@Nonnull Supplier item, @Nonnull Function description, @Nullable Function name, int min, int max) {
//          this(item, description, name, min, max, min);
//       }
//
//       public NumberSubSetting(@Nonnull Supplier item, @Nonnull Function description, @Nullable Function name, int min, int max, int defaultValue) {
//          super();
//          if (max <= min) {
//             throw new IllegalArgumentException("max <= min");
//          } else if (min < 0) {
//             throw new IllegalArgumentException("min < 0");
//          } else if (defaultValue > max) {
//             throw new IllegalArgumentException("defaultValue > max");
//          } else if (defaultValue < min) {
//             throw new IllegalArgumentException("defaultValue < min");
//          } else {
//             this.value = defaultValue;
//             this.defaultValue = defaultValue;
//             this.max = max;
//             this.min = min;
//             this.item = item;
//             this.description = description;
//             this.name = name;
//          }
//       }
//
//       public NumberSubSetting(@Nonnull Supplier item, @Nonnull Function description) {
//          this(item, description, (Function)null, 64, 1);
//       }
//
//       public NumberSubSetting(@Nonnull Supplier item, @Nonnull Function description, int max) {
//          this(item, description, (Function)null, max, 1);
//       }
//
//       public NumberSubSetting(@Nonnull Supplier item, @Nonnull Function description, int min, int max) {
//          this(item, description, (Function)null, min, max, min);
//       }
//
//       public NumberSubSetting(@Nonnull Supplier item, @Nonnull Function description, int min, int max, int defaultValue) {
//          this(item, description, (Function)null, min, max, defaultValue);
//       }
//
//       public NumberSubSetting(@Nonnull Supplier item) {
//          this(item, (value) -> {
//             return null;
//          });
//       }
//
//       public NumberSubSetting(@Nonnull Supplier item, int max) {
//          this(item, (value) -> {
//             return null;
//          }, max);
//       }
//
//       public NumberSubSetting(@Nonnull Supplier item, int min, int max) {
//          this(item, (value) -> {
//             return null;
//          }, min, max);
//       }
//
//       public NumberSubSetting(@Nonnull Supplier item, int min, int max, int defaultValue) {
//          this(item, (value) -> {
//             return null;
//          }, min, max, defaultValue);
//       }
//
//       @Nonnull
//       public ItemBuilder getDisplayItem() {
//          return (ItemBuilder)this.item.get();
//       }
//
//       @Nonnull
//       public ItemBuilder getSettingsItem() {
//          return this.name != null ? DefaultItem.create(Material.STONE_BUTTON, (String)this.name.apply(this.getValue())).amount(this.getValue()) : DefaultItem.value(this.value);
//       }
//
//       @Nullable
//       protected String[] getSettingsDescription() {
//          return (String[])this.description.apply(this.getValue());
//       }
//
//       public void restoreDefaults() {
//          this.setValue(this.defaultValue);
//       }
//
//       public void setValue(int value) {
//          if (this.value != value) {
//             this.value = value;
//             this.updateItems();
//             this.onValueChange();
//          }
//       }
//
//       public int getAsInt() {
//          return this.value;
//       }
//
//       public boolean getAsBoolean() {
//          return this.value > 0;
//       }
//
//       public void handleClick(@Nonnull ChallengeMenuClickInfo info) {
//          int amount = info.isShiftClick() ? 10 : 1;
//          int newValue = this.value;
//          if (info.isRightClick()) {
//             newValue -= amount;
//          } else {
//             newValue += amount;
//          }
//
//          if (newValue > this.max) {
//             newValue = this.min;
//          }
//
//          if (newValue < this.min) {
//             newValue = this.max;
//          }
//
//          this.setValue(newValue);
//          SoundSample.CLICK.play(info.getPlayer());
//       }
//
//       public void loadSettings(@Nonnull Document document) {
//          this.setValue(document.getInt("value"));
//       }
//
//       public void writeSettings(@Nonnull Document document) {
//          document.set("value", this.value);
//       }
//
//       protected void onValueChange() {
//       }
//
//       @Generated
//       public int getValue() {
//          return this.value;
//       }
//    }
//
//    public class BooleanSubSetting extends MenuSetting.SubSetting {
//       private final Supplier item;
//       private final Supplier description;
//       private final boolean enabledByDefault;
//       private boolean enabled;
//
//       public BooleanSubSetting(@Nonnull Supplier item) {
//          this(item, () -> {
//             return null;
//          });
//       }
//
//       public BooleanSubSetting(@Nonnull Supplier item, boolean enabledByDefault) {
//          this(item, () -> {
//             return null;
//          }, enabledByDefault);
//       }
//
//       public BooleanSubSetting(@Nonnull Supplier item, @Nonnull Supplier description) {
//          this(item, description, false);
//       }
//
//       public BooleanSubSetting(@Nonnull Supplier item, @Nonnull Supplier description, boolean enabledByDefault) {
//          super();
//          this.item = item;
//          this.description = description;
//          this.enabledByDefault = enabledByDefault;
//          this.setEnabled(enabledByDefault);
//       }
//
//       @Nonnull
//       public ItemBuilder getDisplayItem() {
//          return (ItemBuilder)this.item.get();
//       }
//
//       @Nonnull
//       public ItemBuilder getSettingsItem() {
//          return DefaultItem.status(this.enabled);
//       }
//
//       @Nullable
//       protected String[] getSettingsDescription() {
//          return (String[])this.description.get();
//       }
//
//       public int getAsInt() {
//          return this.enabled ? 1 : 0;
//       }
//
//       public boolean getAsBoolean() {
//          return this.enabled;
//       }
//
//       public void restoreDefaults() {
//          this.setEnabled(this.enabledByDefault);
//       }
//
//       @Nonnull
//       public MenuSetting.BooleanSubSetting setEnabled(boolean enabled) {
//          if (this.enabled == enabled) {
//             return this;
//          } else {
//             this.enabled = enabled;
//             if (enabled) {
//                this.onEnable();
//             } else {
//                this.onDisable();
//             }
//
//             this.updateItems();
//             return this;
//          }
//       }
//
//       public final void handleClick(@Nonnull ChallengeMenuClickInfo info) {
//          this.setEnabled(!this.enabled);
//          SoundSample.playStatusSound(info.getPlayer(), this.enabled);
//       }
//
//       public void loadSettings(@Nonnull Document document) {
//          this.setEnabled(document.getBoolean("enabled"));
//       }
//
//       public void writeSettings(@Nonnull Document document) {
//          document.set("enabled", this.enabled);
//       }
//
//       protected void onEnable() {
//       }
//
//       protected void onDisable() {
//       }
//    }
// }
//
