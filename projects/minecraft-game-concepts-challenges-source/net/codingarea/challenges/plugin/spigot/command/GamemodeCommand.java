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
import net.codingarea.challenges.plugin.utils.misc.Utils;
import org.bukkit.GameMode;
import org.bukkit.command.CommandSender;
import org.bukkit.entity.Player;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

public class GamemodeCommand implements SenderCommand, Completer {
   public void onCommand(@NotNull CommandSender sender, @NotNull String[] args) throws Exception {
      List targets = new ArrayList();
      if (args.length <= 0) {
         Message.forName("syntax").send(sender, Prefix.CHALLENGES, "gm <gamemode> [player]");
      } else {
         GameMode gamemode = this.getGameMode(args[0]);
         if (gamemode == null) {
            Message.forName("syntax").send(sender, Prefix.CHALLENGES, "gm <gamemode> [player]");
         } else {
            if (args.length > 1) {
               targets.addAll(CommandHelper.getPlayers(sender, args[1]));
            } else if (sender instanceof Player) {
               targets.add(((Player)sender).getPlayer());
            }

            if (targets.isEmpty()) {
               Message.forName("command-no-target").send(sender, Prefix.CHALLENGES);
            } else {
               boolean otherPlayers = false;
               Iterator var6 = targets.iterator();

               while(var6.hasNext()) {
                  Player player = (Player)var6.next();
                  Message.forName("command-gamemode-gamemode-changed").send(player, Prefix.CHALLENGES, gamemode);
                  player.setGameMode(gamemode);
                  if (player != sender) {
                     otherPlayers = true;
                  }
               }

               if (otherPlayers) {
                  Message.forName("command-gamemode-gamemode-changed-others").send(sender, Prefix.CHALLENGES, gamemode, targets.size());
               }

            }
         }
      }
   }

   @Nullable
   private GameMode getGameMode(String input) {
      String var2 = input.toLowerCase();
      byte var3 = -1;
      switch(var2.hashCode()) {
      case -1684593425:
         if (var2.equals("spectator")) {
            var3 = 3;
         }
         break;
      case -1600582850:
         if (var2.equals("survival")) {
            var3 = 0;
         }
         break;
      case -694094064:
         if (var2.equals("adventure")) {
            var3 = 6;
         }
         break;
      case 48:
         if (var2.equals("0")) {
            var3 = 2;
         }
         break;
      case 49:
         if (var2.equals("1")) {
            var3 = 11;
         }
         break;
      case 50:
         if (var2.equals("2")) {
            var3 = 8;
         }
         break;
      case 51:
         if (var2.equals("3")) {
            var3 = 5;
         }
         break;
      case 97:
         if (var2.equals("a")) {
            var3 = 7;
         }
         break;
      case 99:
         if (var2.equals("c")) {
            var3 = 10;
         }
         break;
      case 115:
         if (var2.equals("s")) {
            var3 = 1;
         }
         break;
      case 3677:
         if (var2.equals("sp")) {
            var3 = 4;
         }
         break;
      case 1820422063:
         if (var2.equals("creative")) {
            var3 = 9;
         }
      }

      switch(var3) {
      case 0:
      case 1:
      case 2:
         return GameMode.SURVIVAL;
      case 3:
      case 4:
      case 5:
         return GameMode.SPECTATOR;
      case 6:
      case 7:
      case 8:
         return GameMode.ADVENTURE;
      case 9:
      case 10:
      case 11:
         return GameMode.CREATIVE;
      default:
         return null;
      }
   }

   @Nullable
   public List onTabComplete(@Nonnull CommandSender sender, @Nonnull String[] args) {
      if (args.length == 2) {
         return CommandHelper.getCompletions(sender);
      } else {
         return args.length > 1 ? null : Utils.filterRecommendations(args[0], "0", "1", "2", "3", "survival", "creative", "spectator", "adventure", "s", "c", "sp", "a");
      }
   }
}
