package net.codingarea.challenges.plugin.management.scheduler;

import javax.annotation.Nonnegative;
import javax.annotation.Nonnull;
import lombok.Generated;
import net.codingarea.challenges.plugin.management.scheduler.task.ScheduledTask;

public final class ScheduledTaskConfig extends AbstractTaskConfig {
   private final int rate;

   ScheduledTaskConfig(@Nonnull ScheduledTask annotation) {
      this(annotation.ticks(), annotation.async());
   }

   ScheduledTaskConfig(@Nonnegative int rate, boolean async) {
      super(async);
      this.rate = rate;
   }

   @Generated
   public int getRate() {
      return this.rate;
   }

   @Generated
   public boolean equals(Object o) {
      if (o == this) {
         return true;
      } else if (!(o instanceof ScheduledTaskConfig)) {
         return false;
      } else {
         ScheduledTaskConfig other = (ScheduledTaskConfig)o;
         if (!other.canEqual(this)) {
            return false;
         } else {
            return this.getRate() == other.getRate();
         }
      }
   }

   @Generated
   protected boolean canEqual(Object other) {
      return other instanceof ScheduledTaskConfig;
   }

   @Generated
   public int hashCode() {
      int PRIME = true;
      int result = 1;
      int result = result * 59 + this.getRate();
      return result;
   }
}
