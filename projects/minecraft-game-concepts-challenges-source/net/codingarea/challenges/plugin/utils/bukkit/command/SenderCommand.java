package net.codingarea.challenges.plugin.utils.bukkit.command;

import javax.annotation.Nonnull;
import net.anweisen.utilities.bukkit.utils.logging.Logger;
import net.codingarea.challenges.plugin.content.Prefix;
import org.bukkit.command.Command;
import org.bukkit.command.CommandExecutor;
import org.bukkit.command.CommandSender;

public interface SenderCommand extends CommandExecutor {
   default boolean onCommand(@Nonnull CommandSender sender, @Nonnull Command command, @Nonnull String label, @Nonnull String[] args) {
      try {
         this.onCommand(sender, args);
      } catch (Exception var6) {
         sender.sendMessage(Prefix.CHALLENGES + "§cSomething went wrong while executing the command");
         Logger.error("Something went wrong while processing the command '{}'", label, var6);
      }

      return true;
   }

   void onCommand(@Nonnull CommandSender var1, @Nonnull String[] var2) throws Exception;
}
