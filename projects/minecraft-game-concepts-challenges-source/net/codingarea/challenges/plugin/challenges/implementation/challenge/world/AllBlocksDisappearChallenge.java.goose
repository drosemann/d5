// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/challenge/world/AllBlocksDisappearChallenge.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/challenge/world/AllBlocksDisappearChallenge.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/challenge/world/AllBlocksDisappearChallenge.java), unveraendert, als Inline-Doku ----
// package net.codingarea.challenges.plugin.challenges.implementation.challenge.world;
//
// import java.util.ArrayList;
// import java.util.Collection;
// import java.util.HashMap;
// import java.util.Iterator;
// import java.util.List;
// import java.util.Map;
// import javax.annotation.Nonnull;
// import javax.annotation.Nullable;
// import net.anweisen.utilities.bukkit.utils.misc.BukkitReflectionUtils;
// import net.anweisen.utilities.common.annotations.Since;
// import net.anweisen.utilities.common.config.Document;
// import net.codingarea.challenges.plugin.Challenges;
// import net.codingarea.challenges.plugin.challenges.type.abstraction.MenuSetting;
// import net.codingarea.challenges.plugin.challenges.type.helper.ChallengeConfigHelper;
// import net.codingarea.challenges.plugin.challenges.type.helper.ChallengeHelper;
// import net.codingarea.challenges.plugin.content.Message;
// import net.codingarea.challenges.plugin.management.menu.MenuType;
// import net.codingarea.challenges.plugin.management.menu.generator.categorised.SettingCategory;
// import net.codingarea.challenges.plugin.utils.item.ItemBuilder;
// import net.codingarea.challenges.plugin.utils.misc.ListBuilder;
// import org.bukkit.Chunk;
// import org.bukkit.Location;
// import org.bukkit.Material;
// import org.bukkit.block.Block;
// import org.bukkit.event.EventHandler;
// import org.bukkit.event.EventPriority;
// import org.bukkit.event.block.BlockBreakEvent;
// import org.bukkit.event.block.BlockPlaceEvent;
// import org.bukkit.inventory.Inventory;
// import org.bukkit.inventory.ItemStack;
// import org.bukkit.inventory.PlayerInventory;
//
// @Since("2.0")
// public class AllBlocksDisappearChallenge extends MenuSetting {
//    private final int stackDropLimit;
//
//    public AllBlocksDisappearChallenge() {
//       super(MenuType.CHALLENGES, Message.forName("menu-all-blocks-disappear-challenge-settings"));
//       this.setCategory(SettingCategory.WORLD);
//       this.registerSetting("break", new MenuSetting.BooleanSubSetting(() -> {
//          return new ItemBuilder(Material.DIAMOND_PICKAXE, Message.forName("item-all-blocks-disappear-break-challenge"));
//       }, true));
//       this.registerSetting("place", new MenuSetting.BooleanSubSetting(() -> {
//          return new ItemBuilder(Material.DIAMOND_BLOCK, Message.forName("item-all-blocks-disappear-place-challenge"));
//       }));
//       Document document = ChallengeConfigHelper.getSettingsDocument();
//       this.stackDropLimit = document.contains("all-block-disappear-stack-drop-limit") ? document.getInt("all-block-disappear-stack-drop-limit") : 50;
//    }
//
//    @Nonnull
//    public ItemBuilder createDisplayItem() {
//       return new ItemBuilder(Material.TNT, Message.forName("item-all-blocks-disappear-challenge"));
//    }
//
//    @EventHandler(
//       priority = EventPriority.MONITOR,
//       ignoreCancelled = true
//    )
//    public void onBlockBreak(@Nonnull BlockBreakEvent event) {
//       if (this.shouldExecuteEffect()) {
//          if (this.getSetting("break").getAsBoolean()) {
//             if (!ignorePlayer(event.getPlayer())) {
//                PlayerInventory inventory = event.getPlayer().getInventory();
//                event.setDropItems(false);
//                this.breakBlocks(event.getBlock(), inventory.getItemInMainHand(), inventory);
//             }
//          }
//       }
//    }
//
//    @EventHandler(
//       priority = EventPriority.MONITOR,
//       ignoreCancelled = true
//    )
//    public void onBlockPlace(@Nonnull BlockPlaceEvent event) {
//       if (this.shouldExecuteEffect()) {
//          if (this.getSetting("place").getAsBoolean()) {
//             if (!ignorePlayer(event.getPlayer())) {
//                if (event.getBlockAgainst().getType() != Material.BEDROCK) {
//                   if (event.getBlockAgainst().getType() != Material.END_PORTAL) {
//                      this.breakBlocks(event.getBlockAgainst(), (ItemStack)null, event.getPlayer().getInventory());
//                   }
//                }
//             }
//          }
//       }
//    }
//
//    private void breakBlocks(@Nonnull Block block, @Nullable ItemStack tool, @Nonnull Inventory inventory) {
//       Chunk chunk = block.getChunk();
//       List blocks = this.getAllBlocksToBreak(chunk, block.getType());
//       List allDrops = new ArrayList();
//       Iterator var7 = blocks.iterator();
//
//       while(var7.hasNext()) {
//          Block current = (Block)var7.next();
//          Collection drops = Challenges.getInstance().getBlockDropManager().getDrops(current, tool);
//          current.setType(Material.AIR);
//          Iterator var10 = drops.iterator();
//
//          while(var10.hasNext()) {
//             ItemStack currentBlockDrop = (ItemStack)var10.next();
//             boolean containsType = false;
//             Iterator var13 = allDrops.iterator();
//
//             while(var13.hasNext()) {
//                ItemStack currentAllDrop = (ItemStack)var13.next();
//                if (currentAllDrop.getType() == currentBlockDrop.getType() && currentAllDrop.getAmount() + currentBlockDrop.getAmount() <= currentAllDrop.getMaxStackSize()) {
//                   containsType = true;
//                   currentAllDrop.setAmount(currentAllDrop.getAmount() + currentBlockDrop.getAmount());
//                }
//             }
//
//             if (!containsType) {
//                allDrops.add(currentBlockDrop);
//             }
//          }
//       }
//
//       this.dropList(allDrops, block.getLocation(), inventory);
//    }
//
//    private void dropList(@Nonnull Collection itemStacks, @Nonnull Location location, @Nonnull Inventory inventory) {
//       if (location.getWorld() != null) {
//          Map stackCount = new HashMap();
//          Iterator var5 = itemStacks.iterator();
//
//          while(var5.hasNext()) {
//             ItemStack itemStack = (ItemStack)var5.next();
//             if (this.increaseStackCount(stackCount, itemStack.getType())) {
//                ChallengeHelper.dropItem(itemStack, location, inventory);
//                location.getWorld().dropItemNaturally(location, itemStack);
//             }
//          }
//
//       }
//    }
//
//    private boolean increaseStackCount(Map map, Material material) {
//       int droppedStacks = (Integer)map.getOrDefault(material, 0);
//       if (droppedStacks >= this.stackDropLimit) {
//          return false;
//       } else {
//          ++droppedStacks;
//          map.put(material, droppedStacks);
//          return true;
//       }
//    }
//
//    protected List getAllBlocksToBreak(@Nonnull Chunk chunk, @Nonnull Material material) {
//       return (new ListBuilder(new Block[0])).fill((builder) -> {
//          for(int x = 0; x < 16; ++x) {
//             for(int z = 0; z < 16; ++z) {
//                for(int y = BukkitReflectionUtils.getMinHeight(chunk.getWorld()); y < chunk.getWorld().getMaxHeight(); ++y) {
//                   Block block = chunk.getBlock(x, y, z);
//                   if (block.getType() == material) {
//                      builder.add(block);
//                   }
//                }
//             }
//          }
//
//       }).build();
//    }
// }
//
