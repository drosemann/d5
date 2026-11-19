package net.anweisen.utilities.common.logging.lib;

import java.util.logging.Logger;
import javax.annotation.Nonnull;
import net.anweisen.utilities.common.logging.ILogger;
import net.anweisen.utilities.common.logging.LogLevel;

public abstract class JavaILogger extends Logger implements ILogger {
   protected JavaILogger(String name, String resourceBundleName) {
      super(name, resourceBundleName);
   }

   @Nonnull
   public abstract JavaILogger setMinLevel(@Nonnull LogLevel var1);
}
