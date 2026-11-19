package net.codingarea.challenges.plugin.management.scheduler.policy;

import java.util.function.BooleanSupplier;
import javax.annotation.Nonnull;
import net.codingarea.challenges.plugin.ChallengeAPI;

public enum TimerPolicy implements IPolicy {
   ALWAYS(() -> {
      return true;
   }),
   PAUSED(ChallengeAPI::isPaused),
   STARTED(ChallengeAPI::isStarted);

   private final BooleanSupplier check;

   private TimerPolicy(@Nonnull BooleanSupplier check) {
      this.check = check;
   }

   public boolean check(@Nonnull Object holder) {
      return this.check.getAsBoolean();
   }

   // $FF: synthetic method
   private static TimerPolicy[] $values() {
      return new TimerPolicy[]{ALWAYS, PAUSED, STARTED};
   }
}
