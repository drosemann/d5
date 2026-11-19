// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/management/blocks/BlockDropManager.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/management/blocks/BlockDropManager.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/management/blocks/BlockDropManager.java), unveraendert, als Inline-Doku ----
// package net.codingarea.challenges.plugin.management.blocks;
//
// import java.util.ArrayList;
// import java.util.Collection;
// import java.util.Collections;
// import java.util.HashMap;
// import java.util.Iterator;
// import java.util.List;
// import java.util.Map;
// import java.util.Objects;
// import java.util.Optional;
// import java.util.SortedMap;
// import java.util.TreeMap;
// import java.util.Map.Entry;
// import java.util.function.BooleanSupplier;
// import java.util.stream.Collectors;
// import javax.annotation.Nonnull;
// import javax.annotation.Nullable;
// import net.anweisen.utilities.bukkit.utils.logging.Logger;
// import net.codingarea.challenges.plugin.challenges.implementation.setting.CutCleanSetting;
// import net.codingarea.challenges.plugin.challenges.type.abstraction.AbstractChallenge;
// import net.codingarea.challenges.plugin.challenges.type.abstraction.MenuSetting;
// import org.bukkit.Material;
// import org.bukkit.block.Block;
// import org.bukkit.inventory.ItemStack;
//
// public final class BlockDropManager {
//    private final Map drops = new HashMap();
//    private final Map chance = new HashMap();
//    private MenuSetting.SubSetting directInventorySetting;
//
//    @Nonnull
//    public Collection getDrops(@Nonnull Block block) {
//       if (!this.getDropChance(block.getType()).getAsBoolean()) {
//          return new ArrayList();
//       } else {
//          List customDrops = this.getCustomDrops(block.getType());
//          return !customDrops.isEmpty() ? (Collection)customDrops.stream().map(ItemStack::new).collect(Collectors.toList()) : block.getDrops();
//       }
//    }
//
//    @Nonnull
//    public Collection getDrops(@Nonnull Block block, @Nullable ItemStack tool) {
//       if (!this.getDropChance(block.getType()).getAsBoolean()) {
//          return new ArrayList();
//       } else {
//          List customDrops = this.getCustomDrops(block.getType());
//          return !customDrops.isEmpty() ? (Collection)customDrops.stream().map(ItemStack::new).collect(Collectors.toList()) : block.getDrops(tool);
//       }
//    }
//
//    @Nonnull
//    public List getCustomDrops(@Nonnull Material block) {
//       BlockDropManager.RegisteredDrops option = (BlockDropManager.RegisteredDrops)this.drops.get(block);
//       return (List)(option == null ? new ArrayList() : (List)option.getFirst().orElse(new ArrayList()));
//    }
//
//    public void setCustomDrops(@Nonnull Material block, @Nonnull Material item, byte priority) {
//       this.setCustomDrops(block, Collections.singletonList(item), priority);
//    }
//
//    public void setCustomDrops(@Nonnull Material block, @Nonnull List items, byte priority) {
//       Logger.debug("Setting block drop for {} to {} at priority {}", block, items, priority);
//       BlockDropManager.RegisteredDrops option = (BlockDropManager.RegisteredDrops)this.drops.computeIfAbsent(block, (key) -> {
//          return new BlockDropManager.RegisteredDrops();
//       });
//       option.setOption(priority, items);
//    }
//
//    public void resetCustomDrop(@Nonnull Material block, byte priority) {
//       Logger.debug("Resetting block drop for {} at priority {}", block, priority);
//       BlockDropManager.RegisteredDrops option = (BlockDropManager.RegisteredDrops)this.drops.get(block);
//       if (option != null) {
//          option.resetOption(priority);
//          if (option.isEmpty()) {
//             this.drops.remove(block);
//          }
//
//       }
//    }
//
//    public void resetCustomDrops(byte priority) {
//       Logger.debug("Resetting block drops at priority {}", priority);
//       List remove = new ArrayList();
//       Iterator var3 = this.drops.entrySet().iterator();
//
//       while(var3.hasNext()) {
//          Entry entry = (Entry)var3.next();
//          BlockDropManager.RegisteredDrops option = (BlockDropManager.RegisteredDrops)entry.getValue();
//          option.resetOption(priority);
//          if (option.isEmpty()) {
//             remove.add((Material)entry.getKey());
//          }
//       }
//
//       Map var10001 = this.drops;
//       Objects.requireNonNull(var10001);
//       remove.forEach(var10001::remove);
//    }
//
//    @Nonnull
//    public BooleanSupplier getDropChance(@Nonnull Material block) {
//       BlockDropManager.RegisteredChance option = (BlockDropManager.RegisteredChance)this.chance.get(block);
//       return option == null ? () -> {
//          return true;
//       } : (BooleanSupplier)option.getFirst().orElse(() -> {
//          return true;
//       });
//    }
//
//    public void setDropChance(@Nonnull Material block, byte priority, @Nonnull BooleanSupplier chance) {
//       Logger.debug("Setting block drop chance for {} at priority {}", block, priority);
//       BlockDropManager.RegisteredChance option = (BlockDropManager.RegisteredChance)this.chance.computeIfAbsent(block, (key) -> {
//          return new BlockDropManager.RegisteredChance();
//       });
//       option.setOption(priority, chance);
//    }
//
//    public void resetDropChance(byte priority) {
//       Logger.debug("Resetting block drop chance at priority " + priority);
//       List remove = new ArrayList();
//       Iterator var3 = this.chance.entrySet().iterator();
//
//       while(var3.hasNext()) {
//          Entry entry = (Entry)var3.next();
//          BlockDropManager.RegisteredChance option = (BlockDropManager.RegisteredChance)entry.getValue();
//          option.resetOption(priority);
//          if (option.isEmpty()) {
//             remove.add((Material)entry.getKey());
//          }
//       }
//
//       Map var10001 = this.drops;
//       Objects.requireNonNull(var10001);
//       remove.forEach(var10001::remove);
//    }
//
//    @Nonnull
//    public Map getRegisteredDrops() {
//       return Collections.unmodifiableMap(this.drops);
//    }
//
//    public boolean isItemsDirectIntoInventory() {
//       if (this.directInventorySetting == null) {
//          this.directInventorySetting = ((CutCleanSetting)AbstractChallenge.getFirstInstance(CutCleanSetting.class)).getSetting("items->inventory");
//       }
//
//       return this.directInventorySetting.isEnabled();
//    }
//
//    public static class RegisteredDrops extends BlockDropManager.RegisteredOptions {
//       private RegisteredDrops() {
//          super(null);
//       }
//
//       // $FF: synthetic method
//       RegisteredDrops(Object x0) {
//          this();
//       }
//    }
//
//    public static class RegisteredChance extends BlockDropManager.RegisteredOptions {
//       private RegisteredChance() {
//          super(null);
//       }
//
//       // $FF: synthetic method
//       RegisteredChance(Object x0) {
//          this();
//       }
//    }
//
//    private abstract static class RegisteredOptions {
//       private final SortedMap optionByPriority;
//
//       private RegisteredOptions() {
//          this.optionByPriority = new TreeMap(Collections.reverseOrder());
//       }
//
//       public void setOption(byte priority, @Nonnull Object option) {
//          this.optionByPriority.put(priority, option);
//       }
//
//       public void resetOption(byte priority) {
//          this.optionByPriority.remove(priority);
//       }
//
//       @Nonnull
//       public Optional getFirst() {
//          return this.optionByPriority.values().stream().findFirst();
//       }
//
//       public boolean isEmpty() {
//          return this.optionByPriority.isEmpty();
//       }
//
//       // $FF: synthetic method
//       RegisteredOptions(Object x0) {
//          this();
//       }
//    }
//
//    public static final class DropPriority {
//       public static final byte CUT_CLEAN = 10;
//       public static final byte RANDOMIZER = 5;
//       public static final byte CHANCE = -128;
//
//       private DropPriority() {
//       }
//    }
// }
//
