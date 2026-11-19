package net.anweisen.utilities.common.collection;

import java.util.TimerTask;
import javax.annotation.Nonnull;

public class RunnableTimerTask extends TimerTask {
   protected final Runnable action;

   public RunnableTimerTask(@Nonnull Runnable action) {
      this.action = action;
   }

   public void run() {
      this.action.run();
   }
}
