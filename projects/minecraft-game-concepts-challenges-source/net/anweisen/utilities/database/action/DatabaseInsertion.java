package net.anweisen.utilities.database.action;

import javax.annotation.CheckReturnValue;
import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import net.anweisen.utilities.database.action.hierarchy.SetAction;
import net.anweisen.utilities.database.exceptions.DatabaseException;

public interface DatabaseInsertion extends DatabaseAction, SetAction {
   @Nonnull
   @CheckReturnValue
   DatabaseInsertion set(@Nonnull String var1, @Nullable Object var2);

   @Nullable
   Void execute() throws DatabaseException;
}
