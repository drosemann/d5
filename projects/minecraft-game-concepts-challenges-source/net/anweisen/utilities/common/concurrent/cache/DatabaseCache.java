package net.anweisen.utilities.common.concurrent.cache;

import javax.annotation.Nonnull;
import net.anweisen.utilities.common.annotations.ReplaceWith;

/** @deprecated */
@Deprecated
@ReplaceWith("com.google.common.cache.LoadingCache")
public interface DatabaseCache extends ICache {
   @Nonnull
   Object getData(@Nonnull Object var1);
}
