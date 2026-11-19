package net.codingarea.challenges.plugin.management.scheduler;

import java.util.Arrays;
import javax.annotation.Nonnull;
import net.codingarea.challenges.plugin.management.scheduler.task.TimerTask;
import net.codingarea.challenges.plugin.management.scheduler.timer.TimerStatus;

public final class TimerTaskConfig extends AbstractTaskConfig {
   private final TimerStatus[] status;

   TimerTaskConfig(@Nonnull TimerTask annotation) {
      this(annotation.status(), annotation.async());
   }

   TimerTaskConfig(@Nonnull TimerStatus[] status, boolean async) {
      super(async);
      this.status = status;
   }

   @Nonnull
   public TimerStatus[] getStatus() {
      return this.status;
   }

   public boolean acceptsStatus(@Nonnull TimerStatus status) {
      return Arrays.asList(this.status).contains(status);
   }
}
