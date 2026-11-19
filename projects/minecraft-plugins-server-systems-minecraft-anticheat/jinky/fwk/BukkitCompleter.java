package me.jinky.fwk;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.AbstractMap.SimpleEntry;
import java.util.Map.Entry;
import org.bukkit.command.CommandSender;
import org.bukkit.command.TabCompleter;

public class BukkitCompleter implements TabCompleter {
   private Map completers = new HashMap();

   public void addCompleter(String label, Method m, Object obj) {
      this.completers.put(label, new SimpleEntry(m, obj));
   }

   public List onTabComplete(CommandSender sender, org.bukkit.command.Command command, String label, String[] args) {
      for(int i = args.length; i >= 0; --i) {
         StringBuffer buffer = new StringBuffer();
         buffer.append(label.toLowerCase());

         for(int x = 0; x < i; ++x) {
            if (!args[x].equals("") && !args[x].equals(" ")) {
               buffer.append("." + args[x].toLowerCase());
            }
         }

         String cmdLabel = buffer.toString();
         if (this.completers.containsKey(cmdLabel)) {
            Entry entry = (Entry)this.completers.get(cmdLabel);

            try {
               return (List)((Method)entry.getKey()).invoke(entry.getValue(), new CommandArgs(sender, command, label, args, cmdLabel.split("\\.").length - 1));
            } catch (IllegalArgumentException var10) {
               var10.printStackTrace();
            } catch (IllegalAccessException var11) {
               var11.printStackTrace();
            } catch (InvocationTargetException var12) {
               var12.printStackTrace();
            }
         }
      }

      return null;
   }
}
