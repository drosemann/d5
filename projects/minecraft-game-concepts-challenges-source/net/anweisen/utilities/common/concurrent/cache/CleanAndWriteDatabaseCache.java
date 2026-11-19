package net.anweisen.utilities.common.concurrent.cache;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.TimeUnit;
import java.util.function.BiConsumer;
import java.util.function.Function;
import java.util.function.Predicate;
import javax.annotation.Nonnegative;
import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import net.anweisen.utilities.common.annotations.ReplaceWith;
import net.anweisen.utilities.common.collection.pair.Tuple;
import net.anweisen.utilities.common.logging.ILogger;
import net.anweisen.utilities.common.misc.SimpleCollectionUtils;

/** @deprecated */
@Deprecated
@ReplaceWith("com.google.common.cache.LoadingCache")
public class CleanAndWriteDatabaseCache implements DatabaseCache {
   protected final Map cache = new ConcurrentHashMap();
   protected final Predicate check;
   protected final Function query;
   protected final Function fallback;
   protected final BiConsumer writer;
   protected final long unusedTimeBeforeClean;
   protected final long cleanAndWriteInterval;
   protected final ILogger logger;

   public CleanAndWriteDatabaseCache(@Nullable ILogger logger, @Nonnegative long unusedTimeBeforeClean, @Nonnegative long cleanAndWriteInterval, @Nonnull String taskName, @Nonnull Predicate check, @Nonnull Function fallback, @Nonnull Function query, @Nonnull BiConsumer writer) {
      this.logger = logger;
      this.unusedTimeBeforeClean = unusedTimeBeforeClean;
      this.cleanAndWriteInterval = cleanAndWriteInterval;
      this.check = check;
      this.query = query;
      this.fallback = fallback;
      this.writer = writer;
      EXECUTOR.scheduleAtFixedRate(this::writeCache, cleanAndWriteInterval, cleanAndWriteInterval, TimeUnit.MILLISECONDS);
      Runtime.getRuntime().addShutdownHook(new Thread(this::writeCache));
   }

   public void writeCache() {
      if (this.logger != null) {
         this.logger.debug("Writing & Cleaning cache");
      }

      cleanAndWrite(this.cache, this.unusedTimeBeforeClean, this.logger, this.check, this.writer);
   }

   @Nonnull
   public Object getData(@Nonnull Object key) {
      Tuple cached = (Tuple)this.cache.get(key);
      if (cached != null) {
         cached.setFirst(System.currentTimeMillis());
         return cached.getSecond();
      } else {
         try {
            Object data = this.query.apply(key);
            if (this.logger != null) {
               this.logger.trace("Queried data {} for {}", data, key);
            }

            this.cache.put(key, new Tuple(System.currentTimeMillis(), data));
            return data;
         } catch (Exception var4) {
            if (this.logger != null) {
               this.logger.error("Could not get data for {}", key, var4);
            }

            return this.fallback.apply(key);
         }
      }
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

   public static void cleanAndWrite(@Nonnull Map cache, @Nonnegative long unusedTimeBeforeClean, @Nullable ILogger logger, @Nonnull Predicate check, @Nonnull BiConsumer writer) {
      long now = System.currentTimeMillis();
      Collection remove = new ArrayList();
      cache.forEach((key, pair) -> {
         try {
            if (now - (Long)pair.getFirst() > unusedTimeBeforeClean) {
               if (logger != null) {
                  logger.trace("Removing {} from cache, last usage was {}s ago", key, (now - (Long)pair.getFirst()) / 1000L);
               }

               remove.add(key);
            }

            Object value = pair.getSecond();
            if (!check.test(value)) {
               return;
            }

            if (logger != null) {
               logger.trace("Writing {}", value);
            }

            writer.accept(key, value);
         } catch (Exception var11) {
            if (logger != null) {
               logger.error("Unable to write cache for {}", key, var11);
            }
         }

      });
      remove.forEach(cache::remove);
   }

   @Nonnull
   public Map values() {
      return Collections.unmodifiableMap(SimpleCollectionUtils.convertMap(this.cache, (k) -> {
         return k;
      }, Tuple::getSecond));
   }
}
