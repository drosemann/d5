package net.codingarea.challenges.plugin.management.scheduler.task;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;
import javax.annotation.Nonnegative;
import javax.annotation.Nonnull;
import net.codingarea.challenges.plugin.management.scheduler.policy.ChallengeStatusPolicy;
import net.codingarea.challenges.plugin.management.scheduler.policy.ExtraWorldPolicy;
import net.codingarea.challenges.plugin.management.scheduler.policy.FreshnessPolicy;
import net.codingarea.challenges.plugin.management.scheduler.policy.PlayerCountPolicy;
import net.codingarea.challenges.plugin.management.scheduler.policy.TimerPolicy;

@Target({ElementType.METHOD})
@Retention(RetentionPolicy.RUNTIME)
public @interface ScheduledTask {
   @Nonnegative
   int ticks();

   boolean async() default true;

   @Nonnull
   TimerPolicy timerPolicy() default TimerPolicy.STARTED;

   @Nonnull
   ChallengeStatusPolicy challengePolicy() default ChallengeStatusPolicy.ENABLED;

   @Nonnull
   PlayerCountPolicy playerPolicy() default PlayerCountPolicy.SOMEONE;

   @Nonnull
   ExtraWorldPolicy worldPolicy() default ExtraWorldPolicy.NOT_USED;

   @Nonnull
   FreshnessPolicy freshnessPolicy() default FreshnessPolicy.ALWAYS;
}
