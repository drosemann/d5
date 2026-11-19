package net.codingarea.challenges.plugin.management.scheduler.policy;

import java.util.function.BooleanSupplier;
import javax.annotation.Nonnull;
import net.codingarea.challenges.plugin.ChallengeAPI;

public enum ExtraWorldPolicy implements IPolicy {
   ALWAYS(() -> {
      return true;
   }),
   USED(ChallengeAPI::isWorldInUse),
   NOT_USED(() -> {
      return !ChallengeAPI.isWorldInUse();
   });

   private final BooleanSupplier check;

   private ExtraWorldPolicy(@Nonnull BooleanSupplier check) {
      this.check = check;
   }

   public boolean check(@Nonnull Object holder) {
      return this.check.getAsBoolean();
   }

   // $FF: synthetic method
   private static ExtraWorldPolicy[] $values() {
      return new ExtraWorldPolicy[]{ALWAYS, USED, NOT_USED};
   }
}
