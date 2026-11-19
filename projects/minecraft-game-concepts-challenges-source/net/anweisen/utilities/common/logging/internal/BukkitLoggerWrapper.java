package net.anweisen.utilities.common.logging.internal;

import java.util.logging.Level;
import java.util.logging.Logger;
import javax.annotation.Nonnull;

public class BukkitLoggerWrapper extends JavaLoggerWrapper {
   public BukkitLoggerWrapper(@Nonnull Logger logger) {
      super(logger);
   }

   @Nonnull
   protected Level mapLevel(@Nonnull Level level) {
      return this.isLoggable(level) && level.intValue() < Level.INFO.intValue() ? Level.INFO : level;
   }
}
