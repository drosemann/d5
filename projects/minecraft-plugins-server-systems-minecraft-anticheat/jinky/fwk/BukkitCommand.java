package me.jinky.fwk;

import java.util.List;
import org.apache.commons.lang.Validate;
import org.bukkit.command.CommandException;
import org.bukkit.command.CommandExecutor;
import org.bukkit.command.CommandSender;
import org.bukkit.command.TabCompleter;
import org.bukkit.plugin.Plugin;

public class BukkitCommand extends org.bukkit.command.Command {
   private final Plugin owningPlugin;
   private CommandExecutor executor;
   protected BukkitCompleter completer;

   protected BukkitCommand(String label, Plugin owner) {
      super(label);
      this.executor = owner;
      this.owningPlugin = owner;
      this.usageMessage = "";
   }

   public boolean execute(CommandSender sender, String commandLabel, String[] args) {
      boolean success = false;
      if (!this.owningPlugin.isEnabled()) {
         return false;
      } else if (!this.testPermission(sender)) {
         return true;
      } else {
         try {
            success = this.executor.onCommand(sender, this, commandLabel, args);
         } catch (Throwable var9) {
            throw new CommandException("Unhandled exception executing command '" + commandLabel + "' in plugin " + this.owningPlugin.getDescription().getFullName(), var9);
         }

         if (!success && this.usageMessage.length() > 0) {
            String[] var8;
            int var7 = (var8 = this.usageMessage.replace("<command>", commandLabel).split("\n")).length;

            for(int var6 = 0; var6 < var7; ++var6) {
               String line = var8[var6];
               sender.sendMessage(line);
            }
         }

         return success;
      }
   }

   public List tabComplete(CommandSender sender, String alias, String[] args) throws CommandException, IllegalArgumentException {
      Validate.notNull(sender, "Sender cannot be null");
      Validate.notNull(args, "Arguments cannot be null");
      Validate.notNull(alias, "Alias cannot be null");
      List completions = null;

      try {
         if (this.completer != null) {
            completions = this.completer.onTabComplete(sender, this, alias, args);
         }

         if (completions == null && this.executor instanceof TabCompleter) {
            completions = ((TabCompleter)this.executor).onTabComplete(sender, this, alias, args);
         }
      } catch (Throwable var11) {
         StringBuilder message = new StringBuilder();
         message.append("Unhandled exception during tab completion for command '/").append(alias).append(' ');
         String[] var10 = args;
         int var9 = args.length;

         for(int var8 = 0; var8 < var9; ++var8) {
            String arg = var10[var8];
            message.append(arg).append(' ');
         }

         message.deleteCharAt(message.length() - 1).append("' in plugin ").append(this.owningPlugin.getDescription().getFullName());
         throw new CommandException(message.toString(), var11);
      }

      return completions == null ? super.tabComplete(sender, alias, args) : completions;
   }
}
