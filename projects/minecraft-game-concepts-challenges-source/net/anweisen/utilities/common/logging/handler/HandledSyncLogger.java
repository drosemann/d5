package net.anweisen.utilities.common.logging.handler;

import javax.annotation.Nonnull;
import net.anweisen.utilities.common.logging.LogLevel;

public class HandledSyncLogger extends HandledLogger {
   public HandledSyncLogger(@Nonnull LogLevel initialLevel) {
      super(initialLevel);
   }

   protected void log0(@Nonnull LogEntry entry) {
      this.logNow(entry);
   }
}
