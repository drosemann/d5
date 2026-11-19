package net.codingarea.challenges.plugin.challenges.implementation.challenge.world;

import net.anweisen.utilities.common.annotations.Since;
import net.codingarea.challenges.plugin.challenges.type.abstraction.Setting;
import net.codingarea.challenges.plugin.content.Message;
import net.codingarea.challenges.plugin.management.menu.MenuType;
import net.codingarea.challenges.plugin.management.menu.generator.categorised.SettingCategory;
import net.codingarea.challenges.plugin.utils.item.ItemBuilder;
import net.codingarea.challenges.plugin.utils.misc.BlockUtils;
import org.bukkit.Bukkit;
import org.bukkit.Material;
import org.bukkit.block.Block;
import org.bukkit.entity.FallingBlock;
import org.bukkit.event.EventHandler;
import org.bukkit.event.EventPriority;
import org.bukkit.event.player.PlayerMoveEvent;
import org.bukkit.util.Vector;
import org.jetbrains.annotations.NotNull;

@Since("2.1.1")
public class BlockFlyInAirChallenge extends Setting {
   public BlockFlyInAirChallenge() {
      super(MenuType.CHALLENGES);
      this.setCategory(SettingCategory.WORLD);
   }

   @NotNull
   public ItemBuilder createDisplayItem() {
      return new ItemBuilder(Material.FERN, Message.forName("item-blocks-fly-challenge"));
   }

   @EventHandler(
      priority = EventPriority.MONITOR,
      ignoreCancelled = true
   )
   public void onMove(PlayerMoveEvent event) {
      if (event.getTo() != null) {
         if (this.shouldExecuteEffect()) {
            if (!ignorePlayer(event.getPlayer())) {
               Block blockBelow = BlockUtils.getBlockBelow(event.getTo());
               if (blockBelow != null) {
                  if (blockBelow.getType().isSolid()) {
                     Bukkit.getScheduler().runTaskLater(plugin, () -> {
                        this.boostBlockInAir(blockBelow);
                     }, 20L);
                  }
               }
            }
         }
      }
   }

   private void boostBlockInAir(Block block) {
      if (block.getType().isSolid()) {
         FallingBlock fallingBlock = block.getWorld().spawnFallingBlock(block.getLocation().add(0.5D, 0.0D, 0.5D), block.getBlockData());
         fallingBlock.setInvulnerable(true);
         fallingBlock.setVelocity(new Vector(0, 1, 0));
         block.setType(Material.AIR);
      }
   }
}
