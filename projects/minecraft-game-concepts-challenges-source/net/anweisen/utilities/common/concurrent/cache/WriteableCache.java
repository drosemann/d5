package net.anweisen.utilities.common.concurrent.cache;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import net.anweisen.utilities.common.annotations.ReplaceWith;

/** @deprecated */
@Deprecated
@ReplaceWith("com.google.common.cache.Cache")
public interface WriteableCache extends ICache {
   @Nullable
   Object getData(@Nonnull Object var1);

   void setData(@Nonnull Object var1, @Nullable Object var2);
}
