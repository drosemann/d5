// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/management/scheduler/task/ScheduledTask.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/management/scheduler/task/ScheduledTask.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/management/scheduler/task/ScheduledTask.java), unveraendert, als Inline-Doku ----
// package net.codingarea.challenges.plugin.management.scheduler.task;
//
// import java.lang.annotation.ElementType;
// import java.lang.annotation.Retention;
// import java.lang.annotation.RetentionPolicy;
// import java.lang.annotation.Target;
// import javax.annotation.Nonnegative;
// import javax.annotation.Nonnull;
// import net.codingarea.challenges.plugin.management.scheduler.policy.ChallengeStatusPolicy;
// import net.codingarea.challenges.plugin.management.scheduler.policy.ExtraWorldPolicy;
// import net.codingarea.challenges.plugin.management.scheduler.policy.FreshnessPolicy;
// import net.codingarea.challenges.plugin.management.scheduler.policy.PlayerCountPolicy;
// import net.codingarea.challenges.plugin.management.scheduler.policy.TimerPolicy;
//
// @Target({ElementType.METHOD})
// @Retention(RetentionPolicy.RUNTIME)
// public @interface ScheduledTask {
//    @Nonnegative
//    int ticks();
//
//    boolean async() default true;
//
//    @Nonnull
//    TimerPolicy timerPolicy() default TimerPolicy.STARTED;
//
//    @Nonnull
//    ChallengeStatusPolicy challengePolicy() default ChallengeStatusPolicy.ENABLED;
//
//    @Nonnull
//    PlayerCountPolicy playerPolicy() default PlayerCountPolicy.SOMEONE;
//
//    @Nonnull
//    ExtraWorldPolicy worldPolicy() default ExtraWorldPolicy.NOT_USED;
//
//    @Nonnull
//    FreshnessPolicy freshnessPolicy() default FreshnessPolicy.ALWAYS;
// }
//
