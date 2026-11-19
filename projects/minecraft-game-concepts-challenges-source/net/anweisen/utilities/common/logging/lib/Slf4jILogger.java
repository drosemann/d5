package net.anweisen.utilities.common.logging.lib;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import net.anweisen.utilities.common.logging.ILogger;
import org.slf4j.Logger;

public interface Slf4jILogger extends ILogger, Logger {
   boolean isTraceEnabled();

   boolean isDebugEnabled();

   boolean isInfoEnabled();

   boolean isWarnEnabled();

   boolean isErrorEnabled();

   void trace(@Nullable String var1, @Nonnull Object... var2);

   void debug(@Nullable String var1, @Nonnull Object... var2);

   void info(@Nullable String var1, @Nonnull Object... var2);

   void warn(@Nullable String var1, @Nonnull Object... var2);

   void error(@Nullable String var1, @Nonnull Object... var2);
}
