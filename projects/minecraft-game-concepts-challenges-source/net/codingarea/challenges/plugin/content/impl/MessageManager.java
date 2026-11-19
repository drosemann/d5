package net.codingarea.challenges.plugin.content.impl;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import javax.annotation.CheckReturnValue;
import javax.annotation.Nonnull;
import net.codingarea.challenges.plugin.content.Message;

public final class MessageManager {
   private static final Map cache = new ConcurrentHashMap();

   private MessageManager() {
   }

   @Nonnull
   @CheckReturnValue
   public static Message getOrCreateMessage(@Nonnull String name) {
      return (Message)cache.computeIfAbsent(name, (key) -> {
         return new MessageImpl(key);
      });
   }

   @CheckReturnValue
   public static boolean hasMessageInCache(@Nonnull String name) {
      return cache.containsKey(name);
   }

   public static int getMessageCountCached() {
      return cache.size();
   }
}
