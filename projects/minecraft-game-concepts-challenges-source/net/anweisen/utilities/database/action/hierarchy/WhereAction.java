package net.anweisen.utilities.database.action.hierarchy;

import javax.annotation.CheckReturnValue;
import javax.annotation.Nonnull;
import javax.annotation.Nullable;

public interface WhereAction {
   @Nonnull
   @CheckReturnValue
   WhereAction where(@Nonnull String var1, @Nullable Object var2);

   @Nonnull
   @CheckReturnValue
   WhereAction where(@Nonnull String var1, @Nullable Number var2);

   @Nonnull
   @CheckReturnValue
   WhereAction where(@Nonnull String var1, @Nullable String var2, boolean var3);

   @Nonnull
   @CheckReturnValue
   WhereAction where(@Nonnull String var1, @Nullable String var2);

   @Nonnull
   @CheckReturnValue
   WhereAction whereNot(@Nonnull String var1, @Nullable Object var2);
}
