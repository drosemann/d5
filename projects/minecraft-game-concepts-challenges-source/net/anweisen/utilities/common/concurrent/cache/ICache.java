package net.anweisen.utilities.common.concurrent.cache;

import java.util.Map;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.function.BiConsumer;
import javax.annotation.Nonnull;
import net.anweisen.utilities.common.annotations.ReplaceWith;
import net.anweisen.utilities.common.collection.NamedThreadFactory;

/** @deprecated */
@Deprecated
@ReplaceWith("com.google.common.cache.Cache")
public interface ICache {
   ScheduledExecutorService EXECUTOR = Executors.newScheduledThreadPool(2, new NamedThreadFactory((threadId) -> {
      return String.format("CacheTask-%s", threadId);
   }));

   boolean contains(@Nonnull Object var1);

   int size();

   default boolean isEmpty() {
      return this.size() == 0;
   }

   void clear();

   @Nonnull
   Map values();

   default void forEach(@Nonnull BiConsumer action) {
      this.values().forEach(action);
   }
}
