package net.codingarea.challenges.plugin.management.scheduler.policy;

import java.util.function.BooleanSupplier;
import javax.annotation.Nonnull;
import net.codingarea.challenges.plugin.ChallengeAPI;

public enum FreshnessPolicy implements IPolicy {
   ALWAYS(() -> {
      return true;
   }),
   FRESH(ChallengeAPI::isFresh),
   NOT_FRESH(() -> {
      return !ChallengeAPI.isFresh();
   });

   private final BooleanSupplier check;

   private FreshnessPolicy(@Nonnull BooleanSupplier check) {
      this.check = check;
   }

   public boolean check(@Nonnull Object holder) {
      return this.check.getAsBoolean();
   }

   // $FF: synthetic method
   private static FreshnessPolicy[] $values() {
      return new FreshnessPolicy[]{ALWAYS, FRESH, NOT_FRESH};
   }
}
