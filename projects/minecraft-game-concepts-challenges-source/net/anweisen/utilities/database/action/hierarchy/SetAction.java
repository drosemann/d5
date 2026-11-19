package net.anweisen.utilities.database.action.hierarchy;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;

public interface SetAction {
   @Nonnull
   SetAction set(@Nonnull String var1, @Nullable Object var2);
}
