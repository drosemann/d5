package net.codingarea.challenges.plugin.spigot.command;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import javax.annotation.Nonnull;
import net.anweisen.utilities.common.collection.NumberFormatter;
import net.codingarea.challenges.plugin.content.Message;
import net.codingarea.challenges.plugin.content.Prefix;
import net.codingarea.challenges.plugin.utils.bukkit.command.Completer;
import net.codingarea.challenges.plugin.utils.bukkit.command.PlayerCommand;
import net.codingarea.challenges.plugin.utils.misc.Utils;
import org.bukkit.World;
import org.bukkit.command.CommandSender;
import org.bukkit.entity.Player;
import org.jetbrains.annotations.Nullable;

public class TimeCommand implements PlayerCommand, Completer {
   private final Map names = new HashMap();

   public TimeCommand() {
      this.names.put(1000L, "Day");
      this.names.put(6000L, "Noon");
      this.names.put(13000L, "Night");
      this.names.put(18000L, "Midnight");
   }

   public void onCommand(@Nonnull Player player, @Nonnull String[] args) throws Exception {
      if (args.length <= 0) {
         Message.forName("syntax").send(player, Prefix.CHALLENGES, "time <set/add/remove/query/day/night/noon/midnight>");
      } else {
         World world = player.getWorld();
         String var4 = args[0].toLowerCase();
         byte var5 = -1;
         switch(var4.hashCode()) {
         case -2060248300:
            if (var4.equals("subtract")) {
               var5 = 6;
            }
            break;
         case -1640863024:
            if (var4.equals("midnight")) {
               var5 = 3;
            }
            break;
         case 96417:
            if (var4.equals("add")) {
               var5 = 5;
            }
            break;
         case 99228:
            if (var4.equals("day")) {
               var5 = 0;
            }
            break;
         case 113762:
            if (var4.equals("set")) {
               var5 = 4;
            }
            break;
         case 3387232:
            if (var4.equals("noon")) {
               var5 = 2;
            }
            break;
         case 104817688:
            if (var4.equals("night")) {
               var5 = 1;
            }
            break;
         case 107944136:
            if (var4.equals("query")) {
               var5 = 7;
            }
         }

         long time;
         switch(var5) {
         case 0:
            player.performCommand("time set day");
            break;
         case 1:
            player.performCommand("time set night");
            break;
         case 2:
            player.performCommand("time set noon");
            break;
         case 3:
            player.performCommand("time set midnight");
            break;
         case 4:
            if (args.length <= 1) {
               Message.forName("syntax").send(player, Prefix.CHALLENGES, "time set <ticks/day/night/noon/midnight>");
            } else {
               time = this.getTime(args[1]);
               if (time < 0L) {
                  Message.forName("syntax").send(player, Prefix.CHALLENGES, "time set <ticks/day/night/noon/midnight>");
               } else {
                  world.setTime(time);
                  if (this.names.containsKey(time)) {
                     String timeName = ((String)this.names.get(time)).toLowerCase();
                     String timeTranslation = Message.forName("command-time-" + timeName).asString();
                     Message.forName("command-time-set-exact").send(player, Prefix.CHALLENGES, timeTranslation, time);
                  } else {
                     Message.forName("command-time-set").send(player, Prefix.CHALLENGES, time, this.getNearestTime(world));
                  }
               }
            }
            break;
         case 5:
            if (args.length <= 1) {
               Message.forName("syntax").send(player, Prefix.CHALLENGES, "time add <ticks>");
            } else {
               time = this.getLongFromString(args[1]);
               if (time < 0L) {
                  Message.forName("syntax").send(player, Prefix.CHALLENGES, "time add <ticks>");
               } else {
                  player.performCommand("time set " + (world.getTime() + time));
               }
            }
            break;
         case 6:
            if (args.length <= 1) {
               Message.forName("syntax").send(player, Prefix.CHALLENGES, "time subtract <ticks>");
            } else {
               time = this.getLongFromString(args[1]);
               if (time < 0L) {
                  Message.forName("syntax").send(player, Prefix.CHALLENGES, "time subtract <ticks>");
               } else {
                  player.performCommand("time set " + (world.getTime() - time));
               }
            }
            break;
         case 7:
            Message.forName("command-time-query").send(player, Prefix.CHALLENGES, NumberFormatter.MIDDLE_NUMBER.format(world.getFullTime()), world.getFullTime() / 24000L, NumberFormatter.MIDDLE_NUMBER.format(world.getTime()), this.getNearestTime(world));
         }

      }
   }

   private String getNearestTime(@Nonnull World world) {
      return (String)this.names.entrySet().stream().min(Comparator.comparingLong((entry) -> {
         return Math.abs(world.getTime() - (Long)entry.getKey());
      })).map(Entry::getValue).orElse("Day");
   }

   private long getTime(@Nonnull String input) {
      Iterator var2 = this.names.entrySet().iterator();

      Entry entry;
      do {
         if (!var2.hasNext()) {
            return this.getLongFromString(input);
         }

         entry = (Entry)var2.next();
      } while(!((String)entry.getValue()).equalsIgnoreCase(input));

      return (Long)entry.getKey();
   }

   private long getLongFromString(@Nonnull String input) {
      try {
         return Long.parseLong(input);
      } catch (NumberFormatException var3) {
         return -1L;
      }
   }

   @Nullable
   public List onTabComplete(@Nonnull CommandSender sender, @Nonnull String[] args) {
      if (args.length <= 1) {
         return Utils.filterRecommendations(args[0], "set", "subtract", "query", "day", "night", "noon", "midnight");
      } else {
         return (List)(args[0].equalsIgnoreCase("set") ? Utils.filterRecommendations(args[1], "day", "night", "noon", "midnight") : new ArrayList());
      }
   }
}
