// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/management/scheduler/policy/TimerPolicy.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/management/scheduler/policy/TimerPolicy.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/management/scheduler/policy/TimerPolicy.java), unveraendert, als Inline-Doku ----
// package net.codingarea.challenges.plugin.management.scheduler.policy;
//
// import java.util.function.BooleanSupplier;
// import javax.annotation.Nonnull;
// import net.codingarea.challenges.plugin.ChallengeAPI;
//
// public enum TimerPolicy implements IPolicy {
//    ALWAYS(() -> {
//       return true;
//    }),
//    PAUSED(ChallengeAPI::isPaused),
//    STARTED(ChallengeAPI::isStarted);
//
//    private final BooleanSupplier check;
//
//    private TimerPolicy(@Nonnull BooleanSupplier check) {
//       this.check = check;
//    }
//
//    public boolean check(@Nonnull Object holder) {
//       return this.check.getAsBoolean();
//    }
//
//    // $FF: synthetic method
//    private static TimerPolicy[] $values() {
//       return new TimerPolicy[]{ALWAYS, PAUSED, STARTED};
//    }
// }
//
