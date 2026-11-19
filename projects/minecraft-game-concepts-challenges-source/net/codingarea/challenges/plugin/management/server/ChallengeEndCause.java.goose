// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/management/server/ChallengeEndCause.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/management/server/ChallengeEndCause.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/management/server/ChallengeEndCause.java), unveraendert, als Inline-Doku ----
// package net.codingarea.challenges.plugin.management.server;
//
// import javax.annotation.Nonnull;
// import javax.annotation.Nullable;
// import lombok.Generated;
// import net.codingarea.challenges.plugin.content.Message;
//
// public enum ChallengeEndCause {
//    TIMER_HIT_ZERO(Message.forName("challenge-end-timer-hit-zero"), Message.forName("challenge-end-timer-hit-zero-winner")),
//    GOAL_REACHED(Message.forName("challenge-end-goal-reached"), Message.forName("challenge-end-goal-reached-winner")),
//    GOAL_FAILED(Message.forName("challenge-end-goal-failed"), (Message)null);
//
//    private final Message noWinnerMessage;
//    private final Message winnerMessage;
//
//    private ChallengeEndCause(@Nonnull Message noWinnerMessage, @Nullable Message winnerMessage) {
//       this.noWinnerMessage = noWinnerMessage;
//       this.winnerMessage = winnerMessage;
//    }
//
//    @Nonnull
//    public Message getMessage(boolean withWinner) {
//       return withWinner && this.winnerMessage != null ? this.winnerMessage : this.noWinnerMessage;
//    }
//
//    public boolean isWinnable() {
//       return this.winnerMessage != null;
//    }
//
//    @Generated
//    public Message getNoWinnerMessage() {
//       return this.noWinnerMessage;
//    }
//
//    @Generated
//    public Message getWinnerMessage() {
//       return this.winnerMessage;
//    }
//
//    // $FF: synthetic method
//    private static ChallengeEndCause[] $values() {
//       return new ChallengeEndCause[]{TIMER_HIT_ZERO, GOAL_REACHED, GOAL_FAILED};
//    }
// }
//
