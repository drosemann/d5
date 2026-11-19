package net.codingarea.challenges.plugin.challenges.implementation.goal;

import java.util.Collections;
import java.util.List;
import net.anweisen.utilities.common.annotations.Since;
import net.codingarea.challenges.plugin.ChallengeAPI;
import net.codingarea.challenges.plugin.challenges.type.abstraction.SettingGoal;
import net.codingarea.challenges.plugin.content.Message;
import net.codingarea.challenges.plugin.management.menu.generator.categorised.SettingCategory;
import net.codingarea.challenges.plugin.management.server.ChallengeEndCause;
import net.codingarea.challenges.plugin.utils.item.ItemBuilder;
import org.bukkit.Bukkit;
import org.bukkit.Material;
import org.bukkit.event.EventHandler;
import org.bukkit.event.EventPriority;
import org.bukkit.event.player.PlayerInteractEvent;
import org.jetbrains.annotations.NotNull;

@Since("2.1.2")
public class EatCakeGoal extends SettingGoal {
   public EatCakeGoal() {
      this.setCategory(SettingCategory.FASTEST_TIME);
   }

   public void getWinnersOnEnd(@NotNull List winners) {
   }

   @NotNull
   public ItemBuilder createDisplayItem() {
      return new ItemBuilder(Material.CAKE, Message.forName("item-eat-cake-goal"));
   }

   @EventHandler(
      priority = EventPriority.MONITOR,
      ignoreCancelled = true
   )
   public void onInteract(PlayerInteractEvent event) {
      if (this.shouldExecuteEffect()) {
         if (!ignorePlayer(event.getPlayer())) {
            if (event.getClickedBlock() != null) {
               if (event.getClickedBlock().getType() == Material.CAKE) {
                  if (event.getPlayer().getFoodLevel() < 20) {
                     Bukkit.getScheduler().runTask(plugin, () -> {
                        ChallengeAPI.endChallenge(ChallengeEndCause.GOAL_REACHED, () -> {
                           return Collections.singletonList(event.getPlayer());
                        });
                     });
                  }
               }
            }
         }
      }
   }
}
