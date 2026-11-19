package net.anweisen.utilities.common.logging.internal.factory;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.function.Function;
import javax.annotation.CheckReturnValue;
import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import net.anweisen.utilities.common.logging.ILogger;
import net.anweisen.utilities.common.logging.ILoggerFactory;
import net.anweisen.utilities.common.logging.LogLevel;

public class DefaultLoggerFactory implements ILoggerFactory {
   protected final Map loggers = new ConcurrentHashMap();
   protected final Function creator;
   protected LogLevel level;

   public DefaultLoggerFactory(@Nonnull Function creator) {
      this.level = LogLevel.DEBUG;
      this.creator = creator;
   }

   @Nonnull
   @CheckReturnValue
   public synchronized ILogger forName(@Nullable String name) {
      return (ILogger)this.loggers.computeIfAbsent(name == null ? "anonymous" : name, (unused) -> {
         return ((ILogger)this.creator.apply(name)).setMinLevel(this.level);
      });
   }

   public void setDefaultLevel(@Nonnull LogLevel level) {
      this.level = level;
   }
}
