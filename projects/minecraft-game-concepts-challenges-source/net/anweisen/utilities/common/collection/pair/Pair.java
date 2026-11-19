package net.anweisen.utilities.common.collection.pair;

import javax.annotation.Nonnegative;
import javax.annotation.Nonnull;

public interface Pair {
   @Nonnegative
   int amount();

   @Nonnull
   Object[] values();

   boolean allNull();

   boolean noneNull();
}
