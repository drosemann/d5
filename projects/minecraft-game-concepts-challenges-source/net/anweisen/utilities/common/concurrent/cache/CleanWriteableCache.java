package net.anweisen.utilities.common.concurrent.cache;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.TimeUnit;
import javax.annotation.Nonnegative;
import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import net.anweisen.utilities.common.annotations.ReplaceWith;
import net.anweisen.utilities.common.collection.pair.Tuple;
import net.anweisen.utilities.common.logging.ILogger;
import net.anweisen.utilities.common.misc.SimpleCollectionUtils;

/** @deprecated */
@Deprecated
@ReplaceWith("com.google.common.cache.Cache")
public class CleanWriteableCache implements WriteableCache {
   protected final Map cache = new ConcurrentHashMap();
   protected final ILogger logger;
   protected final long cleanInterval;
   protected final long unusedTimeBeforeClean;

   public CleanWriteableCache(@Nullable ILogger logger, @Nonnegative long unusedTimeBeforeClean, @Nonnegative long cleanInterval, @Nonnull String taskName) {
      this.logger = logger;
      this.cleanInterval = cleanInterval;
      this.unusedTimeBeforeClean = unusedTimeBeforeClean;
      EXECUTOR.scheduleAtFixedRate(this::cleanCache, cleanInterval, cleanInterval, TimeUnit.MILLISECONDS);
   }

   public void cleanCache() {
      if (this.logger != null) {
         this.logger.debug("Cleaning cache");
      }

      long now = System.currentTimeMillis();
      Collection remove = new ArrayList();
      this.cache.forEach((key, pair) -> {
         if (now - (Long)pair.getFirst() > this.unusedTimeBeforeClean) {
            if (this.logger != null) {
               this.logger.trace("Removing {} from cache, last usage was {}s ago", key, (now - (Long)pair.getFirst()) / 1000L);
            }

            remove.add(key);
         }

      });
      Map var10001 = this.cache;
      remove.forEach(var10001::remove);
   }

   @Nullable
   public Object getData(@Nonnull Object key) {
      Tuple pair = (Tuple)this.cache.get(key);
      if (pair == null) {
         return null;
      } else {
         pair.setFirst(System.currentTimeMillis());
         return pair.getSecond();
      }
   }

   public void setData(@Nonnull Object key, @Nullable Object value) {
      this.cache.put(key, new Tuple(System.currentTimeMillis(), value));
   }

   public boolean contains(@Nonnull Object key) {
      return this.cache.containsKey(key);
   }

   public int size() {
      return this.cache.size();
   }

   public void clear() {
      this.cache.clear();
   }

   @Nonnull
   public Map values() {
      return Collections.unmodifiableMap(SimpleCollectionUtils.convertMap(this.cache, (k) -> {
         return k;
      }, Tuple::getSecond));
   }
}
