package net.anweisen.utilities.common.logging.internal.factory;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import net.anweisen.utilities.common.logging.ILogger;
import net.anweisen.utilities.common.logging.ILoggerFactory;
import net.anweisen.utilities.common.logging.LogLevel;
import org.slf4j.LoggerFactory;

public class Slf4jLoggerFactory implements ILoggerFactory {
   @Nonnull
   public ILogger forName(@Nullable String name) {
      return ILogger.forSlf4jLogger(LoggerFactory.getLogger(name == null ? "Logger" : name));
   }

   public void setDefaultLevel(@Nonnull LogLevel level) {
   }
}
