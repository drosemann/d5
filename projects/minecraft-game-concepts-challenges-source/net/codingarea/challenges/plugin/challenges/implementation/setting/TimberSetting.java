package net.codingarea.challenges.plugin.challenges.implementation.setting;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import javax.annotation.Nonnull;
import net.anweisen.utilities.bukkit.utils.misc.BukkitReflectionUtils;
import net.codingarea.challenges.plugin.challenges.type.abstraction.AbstractChallenge;
import net.codingarea.challenges.plugin.challenges.type.abstraction.SettingModifier;
import net.codingarea.challenges.plugin.challenges.type.helper.ChallengeHelper;
import net.codingarea.challenges.plugin.content.Message;
import net.codingarea.challenges.plugin.management.menu.MenuType;
import net.codingarea.challenges.plugin.utils.item.DefaultItem;
import net.codingarea.challenges.plugin.utils.item.ItemBuilder;
import net.codingarea.challenges.plugin.utils.item.ItemUtils;
import net.codingarea.challenges.plugin.utils.misc.BlockUtils;
import org.bukkit.Bukkit;
import org.bukkit.Material;
import org.bukkit.block.Block;
import org.bukkit.event.EventHandler;
import org.bukkit.event.EventPriority;
import org.bukkit.event.block.BlockBreakEvent;
import org.bukkit.inventory.ItemStack;

public class TimberSetting extends SettingModifier {
   public static final int LOGS_LEAVES = 2;

   public TimberSetting() {
      super(MenuType.SETTINGS, 2);
   }

   @Nonnull
   public ItemBuilder createDisplayItem() {
      return new ItemBuilder(Material.DIAMOND_AXE, Message.forName("item-timber-setting"));
   }

   @Nonnull
   public ItemBuilder createSettingsItem() {
      return this.getValue() == 2 ? DefaultItem.create(Material.OAK_LEAVES, Message.forName("item-timber-setting-logs-and-leaves")) : DefaultItem.create(Material.OAK_LOG, Message.forName("item-timber-setting-logs"));
   }

   public void playValueChangeTitle() {
      ChallengeHelper.playChangeChallengeValueTitle(this, (Object)(this.getValue() == 2 ? Message.forName("item-timber-setting-logs-and-leaves") : Message.forName("item-timber-setting-logs")));
   }

   @EventHandler(
      priority = EventPriority.MONITOR,
      ignoreCancelled = true
   )
   public void onBreak(@Nonnull BlockBreakEvent event) {
      if (this.shouldExecuteEffect()) {
         if (this.isLog(event.getBlock().getType())) {
            List treeBlocks = this.getAllTreeBlocks(event.getBlock(), this.getValue() == 2);
            ItemStack item = event.getPlayer().getInventory().getItemInMainHand();
            int[] index = new int[]{0};
            boolean damageItem = !item.getItemMeta().isUnbreakable() && !((NoItemDamageSetting)AbstractChallenge.getFirstInstance(NoItemDamageSetting.class)).isEnabled();
            Bukkit.getScheduler().runTaskTimer(plugin, (timer) -> {
               for(int i = 0; i < 2 && !treeBlocks.isEmpty(); ++i) {
                  Block block = (Block)treeBlocks.get(index[0]);
                  this.breakBlock(block, item, damageItem);
                  int var10002 = index[0]++;
                  if (index[0] >= treeBlocks.size()) {
                     timer.cancel();
                     return;
                  }
               }

            }, 0L, 1L);
         }
      }
   }

   private void breakBlock(@Nonnull Block block, @Nonnull ItemStack item, boolean damageItem) {
      if (this.isLog(block.getType())) {
         ChallengeHelper.breakBlock(block, item);
         if (damageItem) {
            ItemUtils.damageItem(item);
         }
      } else if (this.isLeaves(block.getType())) {
         ChallengeHelper.breakBlock(block, item);
      }

   }

   private List getAllTreeBlocks(@Nonnull Block block, boolean leaves) {
      List allBlocks = new ArrayList();
      List currentBlocks = new ArrayList();
      currentBlocks.add(block);

      for(int i = 0; i < 8; ++i) {
         ArrayList lastBlocks = new ArrayList(currentBlocks);
         currentBlocks.clear();
         Iterator var7 = lastBlocks.iterator();

         label52:
         while(var7.hasNext()) {
            Block currentBlock = (Block)var7.next();
            Iterator var9 = BlockUtils.getBlocksAroundBlock(currentBlock).iterator();

            while(true) {
               Block blockAround;
               do {
                  do {
                     do {
                        if (!var9.hasNext()) {
                           continue label52;
                        }

                        blockAround = (Block)var9.next();
                     } while(BukkitReflectionUtils.isAir(blockAround.getType()));
                  } while(allBlocks.contains(blockAround));
               } while(currentBlock.getType() != blockAround.getType() && (!leaves || !this.isLeaveMaterial(currentBlock.getType(), blockAround.getType())));

               allBlocks.add(blockAround);
               currentBlocks.add(blockAround);
            }
         }

         if (currentBlocks.isEmpty()) {
            break;
         }
      }

      return allBlocks;
   }

   private boolean isLog(Material material) {
      String name = material.name();
      return name.contains("LOG") || name.contains("STEM");
   }

   private boolean isLeaves(Material material) {
      return material.name().endsWith("LEAVES") || material.name().endsWith("WART_BLOCK");
   }

   public boolean isLeaveMaterial(@Nonnull Material logMaterial, @Nonnull Material leaveMaterial) {
      if (logMaterial.name().equals("CRIMSON_STEM")) {
         return leaveMaterial.name().equals("NETHER_WART_BLOCK") || leaveMaterial.name().equals("SHROOMLIGHT");
      } else if (logMaterial.name().equals("WARPED_STEM")) {
         return leaveMaterial.name().equals("WARPED_WART_BLOCK") || leaveMaterial.name().equals("SHROOMLIGHT");
      } else {
         int firstUnderscore = logMaterial.name().indexOf("_");
         if (firstUnderscore == -1) {
            return false;
         } else {
            String logPrefix = logMaterial.name().substring(0, firstUnderscore);
            return leaveMaterial.name().startsWith(logPrefix) && leaveMaterial.name().endsWith("LEAVES");
         }
      }
   }
}
