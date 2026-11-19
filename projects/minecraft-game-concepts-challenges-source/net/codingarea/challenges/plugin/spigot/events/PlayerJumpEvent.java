package net.codingarea.challenges.plugin.spigot.events;

import javax.annotation.Nonnull;
import org.bukkit.entity.Player;
import org.bukkit.event.Cancellable;
import org.bukkit.event.HandlerList;
import org.bukkit.event.player.PlayerEvent;
import org.bukkit.event.player.PlayerStatisticIncrementEvent;

public class PlayerJumpEvent extends PlayerEvent implements Cancellable {
   private static final HandlerList handlers = new HandlerList();
   private final PlayerStatisticIncrementEvent event;

   public PlayerJumpEvent(@Nonnull Player who, PlayerStatisticIncrementEvent statisticIncrementEvent) {
      super(who);
      this.event = statisticIncrementEvent;
   }

   @Nonnull
   public static HandlerList getHandlerList() {
      return handlers;
   }

   public boolean isCancelled() {
      return this.event.isCancelled();
   }

   public void setCancelled(boolean b) {
      this.event.setCancelled(true);
   }

   @Nonnull
   public HandlerList getHandlers() {
      return handlers;
   }
}
