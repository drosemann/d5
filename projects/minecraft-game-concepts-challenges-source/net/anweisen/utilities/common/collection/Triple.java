package net.anweisen.utilities.common.collection;

import javax.annotation.Nullable;

/** @deprecated */
@Deprecated
public class Triple extends net.anweisen.utilities.common.collection.pair.Triple {
   public Triple() {
   }

   public Triple(@Nullable Object first, @Nullable Object second, @Nullable Object third) {
      super(first, second, third);
   }
}
