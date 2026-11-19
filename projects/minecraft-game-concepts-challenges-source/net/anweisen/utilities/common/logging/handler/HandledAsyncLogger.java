package net.anweisen.utilities.common.logging.handler;

import java.util.concurrent.Executor;
import java.util.concurrent.Executors;
import javax.annotation.Nonnull;
import net.anweisen.utilities.common.collection.NamedThreadFactory;
import net.anweisen.utilities.common.logging.LogLevel;

public class HandledAsyncLogger extends HandledLogger {
   protected final Executor executor = Executors.newSingleThreadExecutor(new NamedThreadFactory("AsyncLogTask"));

   public HandledAsyncLogger(@Nonnull LogLevel initialLevel) {
      super(initialLevel);
   }

   protected void log0(@Nonnull LogEntry entry) {
      this.executor.execute(() -> {
         this.logNow(entry);
      });
   }
}
