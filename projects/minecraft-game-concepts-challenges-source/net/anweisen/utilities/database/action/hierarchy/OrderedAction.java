package net.anweisen.utilities.database.action.hierarchy;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import net.anweisen.utilities.database.Order;

public interface OrderedAction {
   @Nullable
   OrderedAction orderBy(@Nonnull String var1, @Nonnull Order var2);
}
