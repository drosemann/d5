package net.codingarea.challenges.plugin.content;

import java.util.ArrayList;
import java.util.Collection;
import javax.annotation.CheckReturnValue;
import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import net.anweisen.utilities.bukkit.utils.logging.Logger;
import net.anweisen.utilities.common.collection.IRandom;
import net.codingarea.challenges.plugin.content.impl.MessageManager;
import net.md_5.bungee.api.chat.BaseComponent;
import org.bukkit.command.CommandSender;
import org.bukkit.entity.Player;

public interface Message {
   String NULL = "§r§fN/A";
   Collection UNKNOWN_MESSAGES = new ArrayList();

   static String unknown(@Nonnull String name) {
      if (!UNKNOWN_MESSAGES.contains(name)) {
         UNKNOWN_MESSAGES.add(name);
         Logger.warn("Tried accessing unknown messages '{}'", name);
      }

      return name;
   }

   @Nonnull
   @CheckReturnValue
   static Message forName(@Nonnull String name) {
      return MessageManager.getOrCreateMessage(name);
   }

   @Nonnull
   String asString(@Nonnull Object... var1);

   @Nonnull
   BaseComponent asComponent(@Nonnull Object... var1);

   @Nonnull
   String asRandomString(@Nonnull IRandom var1, @Nonnull Object... var2);

   @Nonnull
   BaseComponent asRandomComponent(@Nonnull IRandom var1, @Nonnull Prefix var2, @Nonnull Object... var3);

   @Nonnull
   String asRandomString(@Nonnull Object... var1);

   @Nonnull
   String[] asArray(@Nonnull Object... var1);

   @Nonnull
   BaseComponent[] asComponentArray(@Nullable Prefix var1, @Nonnull Object... var2);

   @Nonnull
   ItemDescription asItemDescription(@Nonnull Object... var1);

   void send(@Nonnull CommandSender var1, @Nonnull Prefix var2, @Nonnull Object... var3);

   void sendRandom(@Nonnull CommandSender var1, @Nonnull Prefix var2, @Nonnull Object... var3);

   void sendRandom(@Nonnull IRandom var1, @Nonnull CommandSender var2, @Nonnull Prefix var3, @Nonnull Object... var4);

   void broadcast(@Nonnull Prefix var1, @Nonnull Object... var2);

   void broadcastRandom(@Nonnull Prefix var1, @Nonnull Object... var2);

   void broadcastRandom(@Nonnull IRandom var1, @Nonnull Prefix var2, @Nonnull Object... var3);

   void broadcastTitle(@Nonnull Object... var1);

   void sendTitle(@Nonnull Player var1, @Nonnull Object... var2);

   void sendTitleInstant(@Nonnull Player var1, @Nonnull Object... var2);

   void setValue(@Nonnull String[] var1);

   @Nonnull
   String getName();
}
