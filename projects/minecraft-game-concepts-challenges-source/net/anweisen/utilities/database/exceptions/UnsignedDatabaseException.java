package net.anweisen.utilities.database.exceptions;

import javax.annotation.Nonnull;
import net.anweisen.utilities.common.collection.WrappedException;

public class UnsignedDatabaseException extends WrappedException {
   public UnsignedDatabaseException(@Nonnull DatabaseException cause) {
      super(cause);
   }

   @Nonnull
   public DatabaseException getCause() {
      return (DatabaseException)super.getCause();
   }
}
