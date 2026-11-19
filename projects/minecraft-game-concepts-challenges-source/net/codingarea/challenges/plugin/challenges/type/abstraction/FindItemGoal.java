package net.codingarea.challenges.plugin.challenges.type.abstraction;

import java.util.Collections;
import java.util.List;
import javax.annotation.Nonnull;
import net.codingarea.challenges.plugin.ChallengeAPI;
import net.codingarea.challenges.plugin.management.server.ChallengeEndCause;
import net.codingarea.challenges.plugin.spigot.events.PlayerInventoryClickEvent;
import net.codingarea.challenges.plugin.spigot.events.PlayerPickupItemEvent;
import org.bukkit.Material;
import org.bukkit.entity.Player;
import org.bukkit.event.EventHandler;
import org.bukkit.event.EventPriority;
import org.bukkit.inventory.ItemStack;
import org.jetbrains.annotations.NotNull;

public abstract class FindItemGoal extends SettingGoal {
   private final Material searchedItem;

   public FindItemGoal(Material searchedItem) {
      this.searchedItem = searchedItem;
   }

   public void getWinnersOnEnd(@NotNull List winners) {
   }

   private void checkItem(ItemStack itemStack, @Nonnull Player player) {
      if (itemStack != null) {
         if (itemStack.getType() == this.searchedItem) {
            ChallengeAPI.endChallenge(ChallengeEndCause.GOAL_REACHED, () -> {
               return Collections.singletonList(player);
            });
         }
      }
   }

   @EventHandler(
      priority = EventPriority.MONITOR,
      ignoreCancelled = true
   )
   public void onPickup(PlayerPickupItemEvent event) {
      if (this.shouldExecuteEffect()) {
         if (!ignorePlayer(event.getPlayer())) {
            this.checkItem(event.getItem().getItemStack(), event.getPlayer());
         }
      }
   }

   @EventHandler(
      priority = EventPriority.MONITOR,
      ignoreCancelled = true
   )
   public void onInventoryClick(PlayerInventoryClickEvent event) {
      if (this.shouldExecuteEffect()) {
         if (!ignorePlayer(event.getPlayer())) {
            if (event.getClickedInventory() != null) {
               if (event.getClickedInventory().getHolder() == event.getPlayer()) {
                  this.checkItem(event.getCurrentItem(), event.getPlayer());
               }
            }
         }
      }
   }
}
