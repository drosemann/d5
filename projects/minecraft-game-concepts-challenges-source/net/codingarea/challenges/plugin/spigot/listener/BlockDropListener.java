package net.codingarea.challenges.plugin.spigot.listener;

import java.util.Iterator;
import java.util.List;
import javax.annotation.Nonnull;
import net.anweisen.utilities.bukkit.utils.logging.Logger;
import net.anweisen.utilities.bukkit.utils.misc.BukkitReflectionUtils;
import net.codingarea.challenges.plugin.ChallengeAPI;
import net.codingarea.challenges.plugin.Challenges;
import org.bukkit.GameMode;
import org.bukkit.Location;
import org.bukkit.Material;
import org.bukkit.block.Block;
import org.bukkit.event.EventHandler;
import org.bukkit.event.EventPriority;
import org.bukkit.event.Listener;
import org.bukkit.event.block.BlockBreakEvent;
import org.bukkit.event.block.BlockExplodeEvent;
import org.bukkit.event.entity.EntityExplodeEvent;
import org.bukkit.inventory.ItemStack;

public class BlockDropListener implements Listener {
   @EventHandler(
      priority = EventPriority.HIGHEST,
      ignoreCancelled = true
   )
   public void onBlockBreak(@Nonnull BlockBreakEvent event) {
      if (event.getPlayer().getGameMode() != GameMode.CREATIVE) {
         if (event.isDropItems()) {
            this.dropCustomDrops(event.getBlock(), () -> {
               event.setDropItems(false);
            });
         }
      }
   }

   @EventHandler(
      priority = EventPriority.HIGHEST,
      ignoreCancelled = true
   )
   public void onBlockExplosion(@Nonnull BlockExplodeEvent event) {
      this.handleExplosion(event.blockList(), () -> {
         event.setYield(0.0F);
      });
   }

   @EventHandler(
      priority = EventPriority.HIGHEST,
      ignoreCancelled = true
   )
   public void onEntityExplosion(@Nonnull EntityExplodeEvent event) {
      this.handleExplosion(event.blockList(), () -> {
         event.setYield(0.0F);
      });
   }

   protected void handleExplosion(@Nonnull Iterable blocklist, @Nonnull Runnable dropsExist) {
      Iterator var3 = blocklist.iterator();

      while(var3.hasNext()) {
         Block block = (Block)var3.next();
         this.dropCustomDrops(block, dropsExist);
      }

   }

   protected void dropCustomDrops(@Nonnull Block block, @Nonnull Runnable dropsExist) {
      Material material = block.getType();
      if (!BukkitReflectionUtils.isAir(material)) {
         if (!ChallengeAPI.getDropChance(material)) {
            dropsExist.run();
         } else {
            List drops = Challenges.getInstance().getBlockDropManager().getCustomDrops(material);
            if (!drops.isEmpty()) {
               Location location = block.getLocation().clone().add(0.5D, 0.0D, 0.5D);
               if (location.getWorld() != null) {
                  dropsExist.run();
                  Iterator var6 = drops.iterator();

                  while(var6.hasNext()) {
                     Material drop = (Material)var6.next();

                     try {
                        location.getWorld().dropItem(location, new ItemStack(drop));
                     } catch (Exception var9) {
                        Logger.warn("Unable to drop custom drop {}", drop, var9);
                     }
                  }

               }
            }
         }
      }
   }
}
