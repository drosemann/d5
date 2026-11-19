package net.anweisen.utilities.database.action;

import javax.annotation.Nonnull;
import net.anweisen.utilities.common.concurrent.task.Task;
import net.anweisen.utilities.database.exceptions.DatabaseException;
import net.anweisen.utilities.database.exceptions.UnsignedDatabaseException;

public interface DatabaseAction {
   Object execute() throws DatabaseException;

   default Object executeUnsigned() {
      try {
         return this.execute();
      } catch (DatabaseException var2) {
         throw new UnsignedDatabaseException(var2);
      }
   }

   @Nonnull
   default Task executeAsync() {
      return Task.asyncCall(this::execute);
   }
}
