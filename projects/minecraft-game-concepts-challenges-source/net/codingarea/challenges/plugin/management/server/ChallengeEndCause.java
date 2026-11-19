package net.codingarea.challenges.plugin.management.server;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import lombok.Generated;
import net.codingarea.challenges.plugin.content.Message;

public enum ChallengeEndCause {
   TIMER_HIT_ZERO(Message.forName("challenge-end-timer-hit-zero"), Message.forName("challenge-end-timer-hit-zero-winner")),
   GOAL_REACHED(Message.forName("challenge-end-goal-reached"), Message.forName("challenge-end-goal-reached-winner")),
   GOAL_FAILED(Message.forName("challenge-end-goal-failed"), (Message)null);

   private final Message noWinnerMessage;
   private final Message winnerMessage;

   private ChallengeEndCause(@Nonnull Message noWinnerMessage, @Nullable Message winnerMessage) {
      this.noWinnerMessage = noWinnerMessage;
      this.winnerMessage = winnerMessage;
   }

   @Nonnull
   public Message getMessage(boolean withWinner) {
      return withWinner && this.winnerMessage != null ? this.winnerMessage : this.noWinnerMessage;
   }

   public boolean isWinnable() {
      return this.winnerMessage != null;
   }

   @Generated
   public Message getNoWinnerMessage() {
      return this.noWinnerMessage;
   }

   @Generated
   public Message getWinnerMessage() {
      return this.winnerMessage;
   }

   // $FF: synthetic method
   private static ChallengeEndCause[] $values() {
      return new ChallengeEndCause[]{TIMER_HIT_ZERO, GOAL_REACHED, GOAL_FAILED};
   }
}
