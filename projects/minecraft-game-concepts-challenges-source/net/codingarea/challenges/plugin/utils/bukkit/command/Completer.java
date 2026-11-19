package net.codingarea.challenges.plugin.utils.bukkit.command;

import java.util.List;
import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import org.bukkit.command.Command;
import org.bukkit.command.CommandSender;
import org.bukkit.command.TabCompleter;

public interface Completer extends TabCompleter {
   @Nullable
   default List onTabComplete(@Nonnull CommandSender sender, @Nonnull Command command, @Nonnull String label, @Nonnull String[] args) {
      return this.onTabComplete(sender, args);
   }

   @Nullable
   List onTabComplete(@Nonnull CommandSender var1, @Nonnull String[] var2);
}
