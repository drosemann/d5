package net.codingarea.challenges.plugin.challenges.implementation.setting;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.function.Supplier;
import javax.annotation.Nonnull;
import net.anweisen.utilities.bukkit.utils.animation.SoundSample;
import net.anweisen.utilities.common.annotations.Since;
import net.codingarea.challenges.plugin.Challenges;
import net.codingarea.challenges.plugin.challenges.type.abstraction.MenuSetting;
import net.codingarea.challenges.plugin.challenges.type.helper.ChallengeHelper;
import net.codingarea.challenges.plugin.content.Message;
import net.codingarea.challenges.plugin.management.menu.MenuType;
import net.codingarea.challenges.plugin.utils.item.DefaultItem;
import net.codingarea.challenges.plugin.utils.item.ItemBuilder;
import net.codingarea.challenges.plugin.utils.item.ItemUtils;
import net.codingarea.challenges.plugin.utils.misc.BlockUtils;
import net.codingarea.challenges.plugin.utils.misc.InventoryUtils;
import net.codingarea.challenges.plugin.utils.misc.Utils;
import org.bukkit.Bukkit;
import org.bukkit.Material;
import org.bukkit.block.Block;
import org.bukkit.entity.Player;
import org.bukkit.event.EventHandler;
import org.bukkit.event.EventPriority;
import org.bukkit.event.block.BlockBreakEvent;
import org.bukkit.event.entity.EntityDeathEvent;
import org.bukkit.inventory.ItemStack;

@Since("2.0")
public class CutCleanSetting extends MenuSetting {
   public CutCleanSetting() {
      super(MenuType.SETTINGS, Message.forName("menu-cut-clean-setting-settings"));
      this.registerSetting("iron->iron_ingot", new CutCleanSetting.ConvertDropSubSetting(() -> {
         return new ItemBuilder(Material.IRON_INGOT, Message.forName("item-cut-clean-iron-setting"));
      }, true, Material.IRON_INGOT, new String[]{"IRON_ORE", "DEEPSLATE_IRON_ORE"}));
      this.registerSetting("gold->gold_ingot", new CutCleanSetting.ConvertDropSubSetting(() -> {
         return new ItemBuilder(Material.GOLD_INGOT, Message.forName("item-cut-clean-gold-setting"));
      }, true, Material.GOLD_INGOT, new String[]{"GOLD_ORE", "DEEPSLATE_GOLD_ORE"}));
      this.registerSetting("coal->torch", new CutCleanSetting.ConvertDropSubSetting(() -> {
         return new ItemBuilder(Material.COAL, Message.forName("item-cut-clean-coal-setting"));
      }, false, Material.TORCH, new String[]{"COAL_ORE", "DEEPSLATE_COAL_ORE"}));
      this.registerSetting("gravel->flint", new CutCleanSetting.ConvertDropSubSetting(() -> {
         return new ItemBuilder(Material.FLINT, Message.forName("item-cut-clean-flint-setting"));
      }, false, Material.FLINT, new String[]{"GRAVEL"}));
      this.registerSetting("ore->veins", new CutCleanSetting.BreakOreVeinsSubSetting(() -> {
         return new ItemBuilder(Material.GOLDEN_PICKAXE, Message.forName("item-cut-clean-vein-setting"));
      }, 1, 10));
      this.registerSetting("items->inventory", new CutCleanSetting.DirectIntoInventorySubSetting(() -> {
         return new ItemBuilder(Material.CHEST, Message.forName("item-cut-clean-inventory-setting"));
      }));
      this.registerSetting("row->cooked", new CutCleanSetting.CookFoodSubSetting(() -> {
         return new ItemBuilder(Material.COOKED_BEEF, Message.forName("item-cut-clean-food-setting"));
      }, true));
   }

   @Nonnull
   public ItemBuilder createDisplayItem() {
      return new ItemBuilder(Material.IRON_AXE, Message.forName("item-cut-clean-setting"));
   }

   protected boolean directIntoInventory() {
      return this.getSetting("items->inventory").getAsBoolean();
   }

   private class ConvertDropSubSetting extends MenuSetting.BooleanSubSetting {
      protected final Material[] from;
      protected final Material to;

      public ConvertDropSubSetting(@Nonnull Supplier item, boolean enabledByDefault, @Nonnull Material to, @Nonnull String... from) {
         super(item, enabledByDefault);
         List materials = new ArrayList();
         String[] var7 = from;
         int var8 = from.length;

         for(int var9 = 0; var9 < var8; ++var9) {
            String s = var7[var9];
            Material material = Utils.getMaterial(s);
            if (material != null) {
               materials.add(material);
            }
         }

         this.from = (Material[])materials.toArray(new Material[0]);
         this.to = to;
      }

      public void onEnable() {
         if (this.from != null) {
            Material[] var1 = this.from;
            int var2 = var1.length;

            for(int var3 = 0; var3 < var2; ++var3) {
               Material material = var1[var3];
               Challenges.getInstance().getBlockDropManager().setCustomDrops(material, (Material)this.to, (byte)10);
            }

         }
      }

      public void onDisable() {
         if (this.from != null) {
            Material[] var1 = this.from;
            int var2 = var1.length;

            for(int var3 = 0; var3 < var2; ++var3) {
               Material material = var1[var3];
               Challenges.getInstance().getBlockDropManager().resetCustomDrop(material, (byte)10);
            }

         }
      }

      @EventHandler(
         priority = EventPriority.HIGH,
         ignoreCancelled = true
      )
      public void onBlockBreak(@Nonnull BlockBreakEvent event) {
         if (CutCleanSetting.this.shouldExecuteEffect()) {
            if (CutCleanSetting.this.directIntoInventory()) {
               if (event.isDropItems()) {
                  Material type = event.getBlock().getType();
                  Material[] var3 = this.from;
                  int var4 = var3.length;

                  for(int var5 = 0; var5 < var4; ++var5) {
                     Material material = var3[var5];
                     if (type == material) {
                        List customDrops = Challenges.getInstance().getBlockDropManager().getCustomDrops(event.getBlock().getType());
                        if (customDrops.isEmpty()) {
                           return;
                        }

                        event.setDropItems(false);
                        customDrops.forEach((drop) -> {
                           InventoryUtils.dropOrGiveItem(event.getPlayer().getInventory(), event.getBlock().getLocation(), (Material)drop);
                        });
                     }
                  }

               }
            }
         }
      }
   }

   private class BreakOreVeinsSubSetting extends MenuSetting.NumberAndBooleanSubSetting {
      public BreakOreVeinsSubSetting(@Nonnull Supplier item, int min, int max) {
         super(item, min, max);
      }

      @EventHandler(
         priority = EventPriority.HIGH,
         ignoreCancelled = true
      )
      public void onBlockBreak(@Nonnull BlockBreakEvent event) {
         if (CutCleanSetting.this.shouldExecuteEffect()) {
            ItemStack itemInMainHand = event.getPlayer().getInventory().getItemInMainHand();
            if (this.canBeBroken(event.getBlock(), itemInMainHand)) {
               if (event.getBlock().getType().name().contains("ORE")) {
                  this.breakBlockVein(event.getPlayer(), event.getBlock(), itemInMainHand);
               }
            }
         }
      }

      private void breakBlockVein(@Nonnull Player player, @Nonnull Block block, @Nonnull ItemStack tool) {
         Material material = block.getType();
         List allBlocks = new ArrayList();
         List nextBlocks = new ArrayList();
         nextBlocks.add(block);

         for(int i = 0; i < this.getValue() && !nextBlocks.isEmpty(); ++i) {
            List lastBlocks = new ArrayList(nextBlocks);
            nextBlocks.clear();
            Iterator var9 = lastBlocks.iterator();

            while(var9.hasNext()) {
               Block currentMiddleBlock = (Block)var9.next();
               Iterator var11 = BlockUtils.getBlocksAroundBlock(currentMiddleBlock).iterator();

               while(var11.hasNext()) {
                  Block sideBlock = (Block)var11.next();
                  if (sideBlock.getType() == material && sideBlock != block && !allBlocks.contains(sideBlock) && allBlocks.size() < this.getValue()) {
                     allBlocks.add(sideBlock);
                     nextBlocks.add(sideBlock);
                  }
               }
            }
         }

         AtomicInteger index = new AtomicInteger();
         Bukkit.getScheduler().runTaskTimer(CutCleanSetting.plugin, (timer) -> {
            SoundSample.LOW_PLOP.play(player);

            for(int i = 0; i < 2; ++i) {
               if (index.get() >= allBlocks.size()) {
                  timer.cancel();
                  return;
               }

               Block currentBlock = (Block)allBlocks.get(index.get());
               if (currentBlock.getType() == material) {
                  ChallengeHelper.breakBlock(currentBlock, tool, player.getInventory());
               }

               index.getAndIncrement();
            }

         }, 0L, 2L);
      }

      private boolean canBeBroken(@Nonnull Block block, @Nonnull ItemStack tool) {
         return !block.getDrops(tool).isEmpty();
      }

      @Nonnull
      public ItemBuilder getSettingsItem() {
         return this.getAsBoolean() ? DefaultItem.value(this.getValue(), "§7Max Vein Size: §e") : DefaultItem.disabled();
      }
   }

   private class DirectIntoInventorySubSetting extends MenuSetting.BooleanSubSetting {
      public DirectIntoInventorySubSetting(@Nonnull Supplier item) {
         super(item);
      }

      @Nonnull
      public MenuSetting.BooleanSubSetting setEnabled(boolean enabled) {
         return super.setEnabled(enabled);
      }
   }

   private class CookFoodSubSetting extends MenuSetting.BooleanSubSetting {
      public CookFoodSubSetting(@Nonnull Supplier item, boolean enabledByDefault) {
         super(item, enabledByDefault);
      }

      @EventHandler(
         priority = EventPriority.NORMAL,
         ignoreCancelled = true
      )
      public void onEntityKill(@Nonnull EntityDeathEvent event) {
         if (this.isEnabled()) {
            event.getDrops().replaceAll((item) -> {
               return (new ItemBuilder(ItemUtils.convertFoodToCookedFood(item.getType()))).amount(item.getAmount()).build();
            });
            Player killer = event.getEntity().getKiller();
            if (killer != null && CutCleanSetting.this.directIntoInventory()) {
               event.getDrops().forEach((itemStack) -> {
                  InventoryUtils.dropOrGiveItem(killer.getInventory(), killer.getLocation(), (ItemStack)itemStack);
               });
               event.getDrops().clear();
            }

         }
      }
   }
}
