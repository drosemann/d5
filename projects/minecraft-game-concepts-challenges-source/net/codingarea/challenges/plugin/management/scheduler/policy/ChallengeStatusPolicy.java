package net.codingarea.challenges.plugin.management.scheduler.policy;

import java.util.function.Predicate;
import javax.annotation.Nonnull;
import net.codingarea.challenges.plugin.challenges.type.IChallenge;

public enum ChallengeStatusPolicy implements IPolicy {
   ALWAYS((challenge) -> {
      return true;
   }),
   DISABLED((challenge) -> {
      return !challenge.isEnabled();
   }),
   ENABLED(IChallenge::isEnabled);

   private final Predicate check;

   private ChallengeStatusPolicy(@Nonnull Predicate check) {
      this.check = check;
   }

   public boolean check(@Nonnull Object holder) {
      return this.check.test((IChallenge)holder);
   }

   public boolean isApplicable(@Nonnull Object holder) {
      return holder instanceof IChallenge;
   }

   // $FF: synthetic method
   private static ChallengeStatusPolicy[] $values() {
      return new ChallengeStatusPolicy[]{ALWAYS, DISABLED, ENABLED};
   }
}
