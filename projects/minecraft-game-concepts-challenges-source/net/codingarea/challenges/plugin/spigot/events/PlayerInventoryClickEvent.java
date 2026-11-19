package net.codingarea.challenges.plugin.spigot.events;

import javax.annotation.Nonnull;
import lombok.Generated;
import org.bukkit.entity.Player;
import org.bukkit.event.HandlerList;
import org.bukkit.event.inventory.InventoryClickEvent;

public class PlayerInventoryClickEvent extends InventoryClickEventWrapper {
   private static final HandlerList handlers = new HandlerList();
   private final Player player;

   public PlayerInventoryClickEvent(@Nonnull InventoryClickEvent event) {
      super(event);
      this.player = (Player)event.getWhoClicked();
   }

   @Nonnull
   public static HandlerList getHandlerList() {
      return handlers;
   }

   @Nonnull
   public HandlerList getHandlers() {
      return getHandlerList();
   }

   @Generated
   public Player getPlayer() {
      return this.player;
   }
}
