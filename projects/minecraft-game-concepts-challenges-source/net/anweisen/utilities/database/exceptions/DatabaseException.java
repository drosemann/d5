package net.anweisen.utilities.database.exceptions;

import javax.annotation.Nonnull;

public class DatabaseException extends Exception {
   protected DatabaseException() {
   }

   public DatabaseException(@Nonnull String message) {
      super(message);
   }

   public DatabaseException(@Nonnull Throwable cause) {
      super(cause);
   }

   public DatabaseException(@Nonnull String message, @Nonnull Throwable cause) {
      super(message, cause);
   }
}
