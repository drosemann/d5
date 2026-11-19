package net.anweisen.utilities.common.concurrent.task;

import javax.annotation.Nonnull;

public interface TaskListener {
   default void onComplete(@Nonnull Task task, @Nonnull Object value) {
   }

   default void onCancelled(@Nonnull Task task) {
   }

   default void onFailure(@Nonnull Task task, @Nonnull Throwable ex) {
   }
}
