package net.anweisen.utilities.database.action;

import javax.annotation.CheckReturnValue;
import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import net.anweisen.utilities.database.action.hierarchy.SetAction;
import net.anweisen.utilities.database.action.hierarchy.WhereAction;
import net.anweisen.utilities.database.exceptions.DatabaseException;

public interface DatabaseUpdate extends DatabaseAction, WhereAction, SetAction {
   @Nonnull
   @CheckReturnValue
   DatabaseUpdate where(@Nonnull String var1, @Nullable Object var2);

   @Nonnull
   @CheckReturnValue
   DatabaseUpdate where(@Nonnull String var1, @Nullable Number var2);

   @Nonnull
   @CheckReturnValue
   DatabaseUpdate where(@Nonnull String var1, @Nullable String var2, boolean var3);

   @Nonnull
   @CheckReturnValue
   DatabaseUpdate where(@Nonnull String var1, @Nullable String var2);

   @Nonnull
   @CheckReturnValue
   DatabaseUpdate whereNot(@Nonnull String var1, @Nullable Object var2);

   @Nonnull
   @CheckReturnValue
   DatabaseUpdate set(@Nonnull String var1, @Nullable Object var2);

   @Nullable
   Void execute() throws DatabaseException;
}
