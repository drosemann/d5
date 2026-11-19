package net.anweisen.utilities.common.debug;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import javax.annotation.Nonnull;
import net.anweisen.utilities.common.collection.NumberFormatter;
import net.anweisen.utilities.common.logging.ILogger;
import net.anweisen.utilities.common.misc.ReflectionUtils;

public final class TimingsHelper {
   public static final ILogger LOGGER = ILogger.forThisClass();
   private static final Map timings = new ConcurrentHashMap();

   private TimingsHelper() {
   }

   public static void start(@Nonnull String id) {
      timings.put(id, System.currentTimeMillis());
   }

   public static void stop(@Nonnull String id) {
      Long start = (Long)timings.remove(id);
      if (start == null) {
         LOGGER.warn("Stopped timing {} which was not started before", id);
      } else {
         long time = System.currentTimeMillis() - start;
         LOGGER.debug("Finished timings '{}' within {}ms ({}s)", id, time, NumberFormatter.DOUBLE_FLOATING_POINT.format((double)time / 1000.0D));
      }
   }

   public static void restart(@Nonnull String id) {
      stop(id);
      start(id);
   }

   public static void start() {
      start(ReflectionUtils.getCallerName());
   }

   public static void stop() {
      stop(ReflectionUtils.getCallerName());
   }

   public static void restart() {
      restart(ReflectionUtils.getCallerName());
   }
}
