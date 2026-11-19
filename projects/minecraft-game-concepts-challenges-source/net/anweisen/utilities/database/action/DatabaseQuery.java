package net.anweisen.utilities.database.action;

import javax.annotation.CheckReturnValue;
import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import net.anweisen.utilities.database.Order;
import net.anweisen.utilities.database.action.hierarchy.OrderedAction;
import net.anweisen.utilities.database.action.hierarchy.WhereAction;
import net.anweisen.utilities.database.exceptions.DatabaseException;

public interface DatabaseQuery extends DatabaseAction, WhereAction, OrderedAction {
   @Nonnull
   @CheckReturnValue
   DatabaseQuery where(@Nonnull String var1, @Nullable Object var2);

   @Nonnull
   @CheckReturnValue
   DatabaseQuery where(@Nonnull String var1, @Nullable Number var2);

   @Nonnull
   @CheckReturnValue
   DatabaseQuery where(@Nonnull String var1, @Nullable String var2, boolean var3);

   @Nonnull
   @CheckReturnValue
   DatabaseQuery where(@Nonnull String var1, @Nullable String var2);

   @Nonnull
   @CheckReturnValue
   DatabaseQuery whereNot(@Nonnull String var1, @Nullable Object var2);

   @Nonnull
   @CheckReturnValue
   DatabaseQuery select(@Nonnull String... var1);

   @Nonnull
   @CheckReturnValue
   DatabaseQuery orderBy(@Nonnull String var1, @Nonnull Order var2);

   @Nonnull
   @CheckReturnValue
   ExecutedQuery execute() throws DatabaseException;
}
