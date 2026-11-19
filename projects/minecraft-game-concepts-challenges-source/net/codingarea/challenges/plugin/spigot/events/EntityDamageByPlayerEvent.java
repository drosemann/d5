package net.codingarea.challenges.plugin.spigot.events;

import lombok.Generated;
import org.bukkit.entity.Entity;
import org.bukkit.entity.Player;
import org.bukkit.event.Cancellable;
import org.bukkit.event.HandlerList;
import org.bukkit.event.entity.EntityEvent;
import org.jetbrains.annotations.NotNull;

public class EntityDamageByPlayerEvent extends EntityEvent implements Cancellable {
   private static final HandlerList handlers = new HandlerList();
   private final Player damager;
   private final double finalDamage;
   private final Cancellable parentEvent;

   public EntityDamageByPlayerEvent(@NotNull Entity victim, Player damager, double finalDamage, Cancellable parent) {
      super(victim);
      this.damager = damager;
      this.finalDamage = finalDamage;
      this.parentEvent = parent;
   }

   @NotNull
   public static HandlerList getHandlerList() {
      return handlers;
   }

   public boolean isCancelled() {
      return this.parentEvent.isCancelled();
   }

   public void setCancelled(boolean cancel) {
      this.parentEvent.setCancelled(cancel);
   }

   @NotNull
   public HandlerList getHandlers() {
      return handlers;
   }

   @Generated
   public Player getDamager() {
      return this.damager;
   }

   @Generated
   public double getFinalDamage() {
      return this.finalDamage;
   }
}
