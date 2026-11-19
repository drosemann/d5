package net.codingarea.challenges.plugin.spigot.command;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import javax.annotation.Nonnull;
import net.codingarea.challenges.plugin.content.Message;
import net.codingarea.challenges.plugin.content.Prefix;
import net.codingarea.challenges.plugin.utils.bukkit.command.Completer;
import net.codingarea.challenges.plugin.utils.bukkit.command.SenderCommand;
import net.codingarea.challenges.plugin.utils.misc.CommandHelper;
import org.bukkit.command.CommandSender;
import org.bukkit.entity.Player;
import org.bukkit.event.EventHandler;
import org.bukkit.event.EventPriority;
import org.bukkit.event.Listener;
import org.bukkit.event.entity.EntityDamageEvent;
import org.bukkit.event.entity.FoodLevelChangeEvent;
import org.jetbrains.annotations.Nullable;

public class GodModeCommand implements SenderCommand, Completer, Listener {
   private final List godModePlayers = new ArrayList();

   public void onCommand(@Nonnull CommandSender sender, @Nonnull String[] args) throws Exception {
      List targets = new ArrayList();
      if (args.length > 0) {
         targets.addAll(CommandHelper.getPlayers(sender, args[0]));
      } else if (sender instanceof Player) {
         targets.add((Player)sender);
      }

      if (targets.isEmpty()) {
         Message.forName("command-no-target").send(sender, Prefix.CHALLENGES);
      } else {
         boolean otherPlayers = false;
         Iterator var5 = targets.iterator();

         while(var5.hasNext()) {
            Player target = (Player)var5.next();
            if (this.godModePlayers.contains(target.getUniqueId())) {
               this.godModePlayers.remove(target.getUniqueId());
               Message.forName("command-god-mode-disabled").send(target, Prefix.CHALLENGES);
            } else {
               this.godModePlayers.add(target.getUniqueId());
               Message.forName("command-god-mode-enabled").send(target, Prefix.CHALLENGES);
               target.setFoodLevel(20);
            }

            if (target != sender) {
               otherPlayers = true;
            }
         }

         if (otherPlayers) {
            Message.forName("command-god-mode-toggled-others").send(sender, Prefix.CHALLENGES, targets.size());
         }

      }
   }

   @Nullable
   public List onTabComplete(@Nonnull CommandSender sender, @Nonnull String[] args) {
      return CommandHelper.getCompletions(sender);
   }

   @EventHandler(
      priority = EventPriority.HIGHEST
   )
   public void onDamage(EntityDamageEvent event) {
      if (event.getEntity() instanceof Player) {
         Player player = (Player)event.getEntity();
         if (this.godModePlayers.contains(player.getUniqueId())) {
            event.setCancelled(true);
         }

      }
   }

   @EventHandler
   private void onFoodLevelChange(FoodLevelChangeEvent event) {
      if (event.getEntity() instanceof Player) {
         Player player = (Player)event.getEntity();
         if (this.godModePlayers.contains(player.getUniqueId())) {
            event.setCancelled(true);
         }

      }
   }
}
