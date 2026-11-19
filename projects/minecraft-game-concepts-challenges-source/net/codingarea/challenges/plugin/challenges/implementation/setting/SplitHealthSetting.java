package net.codingarea.challenges.plugin.challenges.implementation.setting;

import java.util.Iterator;
import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import net.codingarea.challenges.plugin.Challenges;
import net.codingarea.challenges.plugin.challenges.type.abstraction.Setting;
import net.codingarea.challenges.plugin.content.Message;
import net.codingarea.challenges.plugin.management.menu.MenuType;
import net.codingarea.challenges.plugin.utils.item.ItemBuilder;
import org.bukkit.Bukkit;
import org.bukkit.Color;
import org.bukkit.Material;
import org.bukkit.attribute.Attribute;
import org.bukkit.attribute.AttributeInstance;
import org.bukkit.entity.Player;
import org.bukkit.event.EventHandler;
import org.bukkit.event.EventPriority;
import org.bukkit.event.entity.EntityDamageEvent;
import org.bukkit.event.entity.EntityRegainHealthEvent;
import org.bukkit.event.player.PlayerJoinEvent;

public class SplitHealthSetting extends Setting {
   public SplitHealthSetting() {
      super(MenuType.SETTINGS);
   }

   @Nonnull
   public ItemBuilder createDisplayItem() {
      return (new ItemBuilder.PotionBuilder(Material.TIPPED_ARROW, Message.forName("item-split-health-setting"))).color(Color.RED);
   }

   protected void onEnable() {
      this.setHealth();
   }

   @EventHandler(
      priority = EventPriority.HIGH,
      ignoreCancelled = true
   )
   public void onEntityRegainHealth(@Nonnull EntityRegainHealthEvent event) {
      if (this.shouldExecuteEffect()) {
         if (event.getEntity() instanceof Player) {
            Player player = (Player)event.getEntity();
            if (!ignorePlayer(player)) {
               Bukkit.getScheduler().runTaskLater(plugin, () -> {
                  this.setHealth(player, (EntityDamageEvent)null);
               }, 1L);
            }
         }
      }
   }

   @EventHandler(
      priority = EventPriority.HIGH,
      ignoreCancelled = true
   )
   public void onDamage(EntityDamageEvent event) {
      if (this.shouldExecuteEffect()) {
         if (event.getEntity() instanceof Player) {
            Player player = (Player)event.getEntity();
            if (!ignorePlayer(player)) {
               Bukkit.getScheduler().runTaskLater(Challenges.getInstance(), () -> {
                  this.setHealth(player, event);
               }, 1L);
            }
         }
      }
   }

   @EventHandler(
      priority = EventPriority.HIGH
   )
   public void onJoin(@Nonnull PlayerJoinEvent event) {
      if (!ignorePlayer(event.getPlayer())) {
         this.setHealth();
      }
   }

   private void setHealth() {
      Player player = null;
      Iterator var2 = Bukkit.getOnlinePlayers().iterator();

      while(true) {
         Player currentPlayer;
         do {
            if (!var2.hasNext()) {
               if (player == null) {
                  return;
               }

               this.setHealth(player, (EntityDamageEvent)null);
               return;
            }

            currentPlayer = (Player)var2.next();
         } while(player != null && !(player.getHealth() > currentPlayer.getHealth()));

         player = currentPlayer;
      }
   }

   public void setHealth(@Nonnull Player player, @Nullable EntityDamageEvent damageEvent) {
      if (this.shouldExecuteEffect()) {
         Iterator var3 = Bukkit.getOnlinePlayers().iterator();

         while(var3.hasNext()) {
            Player currentPlayer = (Player)var3.next();
            if (!ignorePlayer(currentPlayer) && !currentPlayer.equals(player)) {
               double health = player.getHealth();
               AttributeInstance attribute = currentPlayer.getAttribute(Attribute.GENERIC_MAX_HEALTH);
               if (attribute == null) {
                  return;
               }

               if (health > attribute.getValue()) {
                  health = attribute.getValue();
               }

               if (health <= 0.0D && damageEvent != null) {
                  currentPlayer.setLastDamageCause(damageEvent);
               }

               currentPlayer.setHealth(health);
            }
         }

      }
   }
}
