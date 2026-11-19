package net.anweisen.utilities.common.logging;

import javax.annotation.CheckReturnValue;
import javax.annotation.Nonnull;
import javax.annotation.Nullable;

public interface ILoggerFactory {
   @Nonnull
   @CheckReturnValue
   ILogger forName(@Nullable String var1);

   void setDefaultLevel(@Nonnull LogLevel var1);
}
