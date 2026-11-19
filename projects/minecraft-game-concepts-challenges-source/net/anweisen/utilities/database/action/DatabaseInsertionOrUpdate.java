package net.anweisen.utilities.database.action;

import javax.annotation.CheckReturnValue;
import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import net.anweisen.utilities.database.exceptions.DatabaseException;

public interface DatabaseInsertionOrUpdate extends DatabaseUpdate, DatabaseInsertion {
   @Nonnull
   @CheckReturnValue
   DatabaseInsertionOrUpdate where(@Nonnull String var1, @Nullable Object var2);

   @Nonnull
   @CheckReturnValue
   DatabaseInsertionOrUpdate where(@Nonnull String var1, @Nullable Number var2);

   @Nonnull
   @CheckReturnValue
   DatabaseInsertionOrUpdate where(@Nonnull String var1, @Nullable String var2, boolean var3);

   @Nonnull
   @CheckReturnValue
   DatabaseInsertionOrUpdate where(@Nonnull String var1, @Nullable String var2);

   @Nonnull
   DatabaseInsertionOrUpdate whereNot(@Nonnull String var1, @Nullable Object var2);

   @Nonnull
   DatabaseInsertionOrUpdate set(@Nonnull String var1, @Nullable Object var2);

   @Nullable
   Void execute() throws DatabaseException;
}
