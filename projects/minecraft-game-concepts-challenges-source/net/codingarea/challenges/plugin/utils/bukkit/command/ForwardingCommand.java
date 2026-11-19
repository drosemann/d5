package net.codingarea.challenges.plugin.utils.bukkit.command;

import java.util.ArrayList;
import java.util.List;
import javax.annotation.Nonnull;
import org.bukkit.Bukkit;
import org.bukkit.command.Command;
import org.bukkit.command.CommandSender;
import org.bukkit.command.TabCompleter;
import org.jetbrains.annotations.Nullable;

public class ForwardingCommand implements SenderCommand, TabCompleter {
   private final String forwardCommand;
   private final boolean overrideTab;

   public ForwardingCommand(@Nonnull String forwardCommand) {
      this(forwardCommand, true);
   }

   public ForwardingCommand(@Nonnull String forwardCommand, boolean overrideTab) {
      this.forwardCommand = forwardCommand;
      this.overrideTab = overrideTab;
   }

   public void onCommand(@Nonnull CommandSender sender, @Nonnull String[] args) throws Exception {
      Bukkit.dispatchCommand(sender, this.forwardCommand + " " + String.join(" ", args));
   }

   @Nullable
   public List onTabComplete(@Nonnull CommandSender sender, @Nonnull Command command, @Nonnull String alias, @Nonnull String[] args) {
      return this.overrideTab ? new ArrayList() : null;
   }
}
