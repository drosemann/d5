package net.codingarea.challenges.plugin.management.scheduler;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import javax.annotation.Nonnull;
import net.codingarea.challenges.plugin.management.scheduler.policy.IPolicy;
import net.codingarea.challenges.plugin.management.scheduler.task.ScheduledTask;
import net.codingarea.challenges.plugin.management.scheduler.task.TimerTask;

public class PoliciesContainer {
   private final List policies = new ArrayList();

   public PoliciesContainer(@Nonnull ScheduledTask annotation) {
      this.addPolicies(annotation.challengePolicy(), annotation.timerPolicy(), annotation.playerPolicy(), annotation.worldPolicy(), annotation.freshnessPolicy());
   }

   public PoliciesContainer(@Nonnull TimerTask annotation) {
      this.addPolicies(annotation.challengePolicy(), annotation.playerPolicy(), annotation.worldPolicy(), annotation.freshnessPolicy());
   }

   private void addPolicies(@Nonnull IPolicy... policies) {
      this.policies.addAll(Arrays.asList(policies));
   }

   public boolean allPoliciesAreTrue(@Nonnull Object holder) {
      Iterator var2 = this.policies.iterator();

      IPolicy policy;
      do {
         if (!var2.hasNext()) {
            return true;
         }

         policy = (IPolicy)var2.next();
      } while(!policy.isApplicable(holder) || policy.check(holder));

      return false;
   }
}
