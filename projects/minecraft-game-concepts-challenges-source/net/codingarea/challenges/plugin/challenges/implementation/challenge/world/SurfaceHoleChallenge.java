package net.codingarea.challenges.plugin.challenges.implementation.challenge.world;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import net.anweisen.utilities.bukkit.utils.misc.BukkitReflectionUtils;
import net.codingarea.challenges.plugin.challenges.type.abstraction.SettingModifier;
import net.codingarea.challenges.plugin.content.Message;
import net.codingarea.challenges.plugin.management.menu.MenuType;
import net.codingarea.challenges.plugin.management.menu.generator.categorised.SettingCategory;
import net.codingarea.challenges.plugin.utils.item.ItemBuilder;
import net.codingarea.challenges.plugin.utils.misc.BlockUtils;
import org.bukkit.Bukkit;
import org.bukkit.GameMode;
import org.bukkit.Location;
import org.bukkit.Material;
import org.bukkit.World;
import org.bukkit.block.Block;
import org.bukkit.event.EventHandler;
import org.bukkit.event.player.PlayerMoveEvent;

public class SurfaceHoleChallenge extends SettingModifier {
   public SurfaceHoleChallenge() {
      super(MenuType.CHALLENGES, 1, 60, 30);
      this.setCategory(SettingCategory.WORLD);
   }

   @EventHandler
   public void onMove(@Nonnull PlayerMoveEvent event) {
      if (this.shouldExecuteEffect()) {
         if (event.getPlayer().getGameMode() != GameMode.CREATIVE && event.getPlayer().getGameMode() != GameMode.SPECTATOR) {
            Location location = event.getTo();
            if (location != null) {
               if (!BlockUtils.isSameBlockLocationIgnoreHeight(event.getFrom(), location)) {
                  Bukkit.getScheduler().runTaskLaterAsynchronously(plugin, () -> {
                     if (this.shouldExecuteEffect()) {
                        World world = event.getPlayer().getWorld();
                        List blocks = new ArrayList();

                        for(int y = BukkitReflectionUtils.getMinHeight(world); y < world.getMaxHeight(); ++y) {
                           Location blockLocation = location.clone();
                           blockLocation.setY((double)y);
                           blocks.add(blockLocation.getBlock());
                        }

                        Bukkit.getScheduler().runTask(plugin, () -> {
                           Iterator var1 = blocks.iterator();

                           while(var1.hasNext()) {
                              Block block = (Block)var1.next();
                              block.setType(Material.AIR, false);
                           }

                        });
                     }
                  }, (long)this.getValue() * 20L);
               }
            }
         }
      }
   }

   @Nonnull
   public ItemBuilder createDisplayItem() {
      return new ItemBuilder(Material.BARRIER, Message.forName("item-surface-hole-challenge"));
   }

   @Nullable
   protected String[] getSettingsDescription() {
      return Message.forName("item-time-seconds-description").asArray(this.getValue());
   }
}
