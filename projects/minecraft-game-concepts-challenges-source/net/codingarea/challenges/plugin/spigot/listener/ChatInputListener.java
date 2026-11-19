package net.codingarea.challenges.plugin.spigot.listener;

import java.util.HashMap;
import java.util.Map;
import java.util.function.Consumer;
import org.bukkit.entity.Player;
import org.bukkit.event.EventHandler;
import org.bukkit.event.EventPriority;
import org.bukkit.event.Listener;
import org.bukkit.event.player.AsyncPlayerChatEvent;
import org.bukkit.event.player.PlayerQuitEvent;

public class ChatInputListener implements Listener {
   private static Map inputActions = new HashMap();

   public ChatInputListener() {
      inputActions = new HashMap();
   }

   public static void setInputAction(Player player, Consumer event) {
      inputActions.put(player.getUniqueId(), event);
   }

   @EventHandler(
      priority = EventPriority.LOW
   )
   public void onChat(AsyncPlayerChatEvent event) {
      Consumer action = (Consumer)inputActions.remove(event.getPlayer().getUniqueId());
      if (action != null) {
         action.accept(event);
         event.setCancelled(true);
      }

   }

   @EventHandler(
      priority = EventPriority.LOW
   )
   public void onQuit(PlayerQuitEvent event) {
      inputActions.remove(event.getPlayer().getUniqueId());
   }
}
