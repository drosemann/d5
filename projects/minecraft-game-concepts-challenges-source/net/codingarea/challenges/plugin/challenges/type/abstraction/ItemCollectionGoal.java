package net.codingarea.challenges.plugin.challenges.type.abstraction;

import java.util.Collections;
import java.util.concurrent.atomic.AtomicInteger;
import javax.annotation.Nonnull;
import net.anweisen.utilities.bukkit.utils.animation.SoundSample;
import net.codingarea.challenges.plugin.challenges.type.helper.GoalHelper;
import net.codingarea.challenges.plugin.content.Message;
import net.codingarea.challenges.plugin.content.Prefix;
import net.codingarea.challenges.plugin.spigot.events.PlayerInventoryClickEvent;
import net.codingarea.challenges.plugin.spigot.events.PlayerPickupItemEvent;
import org.bukkit.Material;
import org.bukkit.entity.Player;
import org.bukkit.event.EventHandler;
import org.bukkit.event.EventPriority;
import org.jetbrains.annotations.NotNull;

public abstract class ItemCollectionGoal extends CollectionGoal {
   public ItemCollectionGoal(@NotNull Material... target) {
      super(target);
   }

   public ItemCollectionGoal(boolean enabledByDefault, @NotNull Material... target) {
      super(enabledByDefault, target);
   }

   protected void handleCollect(@Nonnull Player player, @Nonnull Material material) {
      this.collect(player, material, () -> {
         Message.forName("item-collected").send(player, Prefix.CHALLENGES, material);
         SoundSample.PLING.play(player);
      });
   }

   protected void onEnable() {
      this.scoreboard.setContent(GoalHelper.createScoreboard(() -> {
         return this.getPoints(new AtomicInteger(), true);
      }, (player) -> {
         return Collections.singletonList(Message.forName("items-to-collect").asString(this.target.length));
      }));
      this.scoreboard.show();
   }

   @EventHandler(
      priority = EventPriority.HIGH,
      ignoreCancelled = true
   )
   public void onPickupItem(@Nonnull PlayerPickupItemEvent event) {
      if (this.shouldExecuteEffect()) {
         Material material = event.getItem().getItemStack().getType();
         Player player = event.getPlayer();
         this.handleCollect(player, material);
      }
   }

   @EventHandler(
      priority = EventPriority.HIGH,
      ignoreCancelled = true
   )
   public void onPlayerInventoryClick(@Nonnull PlayerInventoryClickEvent event) {
      if (this.shouldExecuteEffect()) {
         if (!event.isCancelled()) {
            if (event.getClickedInventory() != null) {
               if (event.getClickedInventory().getHolder() == event.getPlayer()) {
                  if (event.getCurrentItem() != null) {
                     Player player = event.getPlayer();
                     Material material = event.getCurrentItem().getType();
                     this.handleCollect(player, material);
                  }
               }
            }
         }
      }
   }
}
