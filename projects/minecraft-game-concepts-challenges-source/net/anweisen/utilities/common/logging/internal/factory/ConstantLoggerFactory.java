package net.anweisen.utilities.common.logging.internal.factory;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import net.anweisen.utilities.common.logging.ILogger;
import net.anweisen.utilities.common.logging.ILoggerFactory;
import net.anweisen.utilities.common.logging.LogLevel;

public class ConstantLoggerFactory implements ILoggerFactory {
   protected final ILogger logger;

   public ConstantLoggerFactory(@Nonnull ILogger logger) {
      this.logger = logger;
   }

   @Nonnull
   public ILogger forName(@Nullable String name) {
      return this.logger;
   }

   public void setDefaultLevel(@Nonnull LogLevel level) {
      this.logger.setMinLevel(level);
   }
}
