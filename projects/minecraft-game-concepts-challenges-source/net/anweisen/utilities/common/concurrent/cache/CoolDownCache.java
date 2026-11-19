package net.anweisen.utilities.common.concurrent.cache;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Map;
import java.util.Timer;
import java.util.concurrent.ConcurrentHashMap;
import java.util.function.ToLongFunction;
import javax.annotation.Nonnegative;
import javax.annotation.Nonnull;
import net.anweisen.utilities.common.collection.RunnableTimerTask;
import net.anweisen.utilities.common.logging.ILogger;

public class CoolDownCache {
   protected final Map cache = new ConcurrentHashMap();
   protected final ILogger logger;
   protected final ToLongFunction cooldownTime;
   protected final long cleanInterval;

   public CoolDownCache(@Nonnull ILogger logger, @Nonnegative long cleanInterval, @Nonnull String taskName, @Nonnull ToLongFunction cooldownTime) {
      this.logger = logger;
      this.cooldownTime = cooldownTime;
      this.cleanInterval = cleanInterval;
      (new Timer(taskName)).schedule(new RunnableTimerTask(this::cleanCache), cleanInterval, cleanInterval);
   }

   public void cleanCache() {
      this.logger.debug("Cleaning cooldown cache");
      long now = System.currentTimeMillis();
      Collection remove = new ArrayList();
      this.cache.forEach((key, time) -> {
         if (time == null || !this.isOnCoolDown(now, time, key)) {
            this.logger.trace("Removing {} from cooldown cache", key);
            remove.add(key);
         }

      });
      Map var10001 = this.cache;
      remove.forEach(var10001::remove);
   }

   public boolean isOnCoolDown(long now, long suspect, @Nonnull Object key) {
      long difference = now - suspect;
      return difference < this.getCoolDownTime(key);
   }

   public boolean isOnCoolDown(@Nonnull Object key) {
      Long time = (Long)this.cache.get(key);
      return time == null ? false : this.isOnCoolDown(System.currentTimeMillis(), time, key);
   }

   public boolean checkCoolDown(@Nonnull Object key) {
      boolean cooldown = this.isOnCoolDown(key);
      if (!cooldown) {
         this.setOnCoolDown(key);
      }

      return cooldown;
   }

   public void setOnCoolDown(@Nonnull Object key) {
      this.cache.put(key, System.currentTimeMillis());
   }

   public long getCoolDown(@Nonnull Object key) {
      Long time = (Long)this.cache.get(key);
      return time == null ? 0L : System.currentTimeMillis() - time;
   }

   public float getCoolDownSeconds(@Nonnull Object key) {
      return (float)this.getCoolDown(key) / 1000.0F;
   }

   public long getCoolDownTime(@Nonnull Object key) {
      return this.cooldownTime.applyAsLong(key);
   }

   public int size() {
      return this.cache.size();
   }
}
