package net.codingarea.challenges.plugin.challenges.implementation.challenge.world;

import java.util.HashMap;
import java.util.Map;
import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import net.anweisen.utilities.common.annotations.Since;
import net.codingarea.challenges.plugin.challenges.type.abstraction.SettingModifier;
import net.codingarea.challenges.plugin.content.Message;
import net.codingarea.challenges.plugin.management.menu.MenuType;
import net.codingarea.challenges.plugin.management.menu.generator.categorised.SettingCategory;
import net.codingarea.challenges.plugin.utils.item.ItemBuilder;
import org.bukkit.Bukkit;
import org.bukkit.Material;
import org.bukkit.block.Block;
import org.bukkit.event.EventHandler;
import org.bukkit.event.EventPriority;
import org.bukkit.event.block.BlockBreakEvent;
import org.bukkit.event.block.BlockPlaceEvent;
import org.bukkit.scheduler.BukkitTask;

@Since("2.0")
public class BlocksDisappearAfterTimeChallenge extends SettingModifier {
   private final Map tasks = new HashMap();

   public BlocksDisappearAfterTimeChallenge() {
      super(MenuType.CHALLENGES, 60, 300);
      this.setCategory(SettingCategory.WORLD);
   }

   @Nonnull
   public ItemBuilder createDisplayItem() {
      return new ItemBuilder(Material.STRING, Message.forName("item-blocks-disappear-time-challenge"));
   }

   @Nullable
   protected String[] getSettingsDescription() {
      return Message.forName("item-time-seconds-description").asArray(this.getValue());
   }

   @EventHandler(
      priority = EventPriority.MONITOR,
      ignoreCancelled = true
   )
   public void onBlockPlace(@Nonnull BlockPlaceEvent event) {
      if (this.shouldExecuteEffect()) {
         if (!ignorePlayer(event.getPlayer())) {
            BukkitTask oldTask = (BukkitTask)this.tasks.remove(event.getBlock());
            if (oldTask != null) {
               oldTask.cancel();
            }

            this.tasks.put(event.getBlock(), this.runTask(event.getBlock()));
         }
      }
   }

   @EventHandler(
      priority = EventPriority.MONITOR,
      ignoreCancelled = true
   )
   public void onBlockPlace(@Nonnull BlockBreakEvent event) {
      if (this.shouldExecuteEffect()) {
         if (!ignorePlayer(event.getPlayer())) {
            BukkitTask oldTask = (BukkitTask)this.tasks.remove(event.getBlock());
            if (oldTask != null) {
               oldTask.cancel();
            }

         }
      }
   }

   private BukkitTask runTask(@Nonnull Block block) {
      return Bukkit.getScheduler().runTaskLater(plugin, () -> {
         block.setType(Material.AIR);
      }, (long)this.getValue() * 20L);
   }
}
