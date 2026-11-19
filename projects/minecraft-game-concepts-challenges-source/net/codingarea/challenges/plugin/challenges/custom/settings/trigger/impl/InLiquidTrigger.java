package net.codingarea.challenges.plugin.challenges.custom.settings.trigger.impl;

import java.util.Iterator;
import net.codingarea.challenges.plugin.Challenges;
import net.codingarea.challenges.plugin.challenges.custom.settings.sub.SubSettingsBuilder;
import net.codingarea.challenges.plugin.challenges.custom.settings.trigger.ChallengeTrigger;
import net.codingarea.challenges.plugin.management.scheduler.task.ScheduledTask;
import net.codingarea.challenges.plugin.utils.item.DefaultItem;
import net.codingarea.challenges.plugin.utils.item.ItemBuilder;
import net.codingarea.challenges.plugin.utils.misc.BlockUtils;
import org.bukkit.Bukkit;
import org.bukkit.Material;
import org.bukkit.entity.Player;
import org.bukkit.event.EventHandler;
import org.bukkit.event.EventPriority;
import org.bukkit.event.player.PlayerMoveEvent;

public class InLiquidTrigger extends ChallengeTrigger {
   public InLiquidTrigger(String name) {
      super(name, (SubSettingsBuilder)SubSettingsBuilder.createChooseMultipleItem("liquid").fill((builder) -> {
         builder.addSetting("LAVA", new ItemBuilder(Material.LAVA_BUCKET, DefaultItem.getItemPrefix() + "§cLava"));
         builder.addSetting("WATER", new ItemBuilder(Material.WATER_BUCKET, DefaultItem.getItemPrefix() + "§9Water"));
      }));
      Challenges.getInstance().getScheduler().register((Object)this);
   }

   public Material getMaterial() {
      return Material.BUCKET;
   }

   @EventHandler(
      priority = EventPriority.HIGH,
      ignoreCancelled = true
   )
   public void onMove(PlayerMoveEvent event) {
      if (!BlockUtils.isSameBlockLocation(event.getTo(), event.getFrom())) {
         if (event.getTo() != null) {
            Material type = event.getTo().getBlock().getType();
            Material oldType = event.getFrom().getBlock().getType();
            if ((type == Material.WATER || type == Material.LAVA) && oldType != Material.WATER && oldType != Material.LAVA) {
               this.createData().entity(event.getPlayer()).data("liquid", type.name()).execute();
            }

         }
      }
   }

   @ScheduledTask(
      ticks = 5,
      async = false
   )
   public void onFifthTick() {
      Iterator var1 = Bukkit.getOnlinePlayers().iterator();

      while(true) {
         Player player;
         Material type;
         do {
            if (!var1.hasNext()) {
               return;
            }

            player = (Player)var1.next();
            type = player.getLocation().getBlock().getType();
         } while(type != Material.WATER && type != Material.LAVA);

         this.createData().entity(player).data("liquid", type.name()).execute();
      }
   }
}
