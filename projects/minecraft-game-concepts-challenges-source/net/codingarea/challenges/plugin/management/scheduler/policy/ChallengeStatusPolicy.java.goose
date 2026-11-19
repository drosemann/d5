// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/management/scheduler/policy/ChallengeStatusPolicy.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/management/scheduler/policy/ChallengeStatusPolicy.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/management/scheduler/policy/ChallengeStatusPolicy.java), unveraendert, als Inline-Doku ----
// package net.codingarea.challenges.plugin.management.scheduler.policy;
//
// import java.util.function.Predicate;
// import javax.annotation.Nonnull;
// import net.codingarea.challenges.plugin.challenges.type.IChallenge;
//
// public enum ChallengeStatusPolicy implements IPolicy {
//    ALWAYS((challenge) -> {
//       return true;
//    }),
//    DISABLED((challenge) -> {
//       return !challenge.isEnabled();
//    }),
//    ENABLED(IChallenge::isEnabled);
//
//    private final Predicate check;
//
//    private ChallengeStatusPolicy(@Nonnull Predicate check) {
//       this.check = check;
//    }
//
//    public boolean check(@Nonnull Object holder) {
//       return this.check.test((IChallenge)holder);
//    }
//
//    public boolean isApplicable(@Nonnull Object holder) {
//       return holder instanceof IChallenge;
//    }
//
//    // $FF: synthetic method
//    private static ChallengeStatusPolicy[] $values() {
//       return new ChallengeStatusPolicy[]{ALWAYS, DISABLED, ENABLED};
//    }
// }
//
