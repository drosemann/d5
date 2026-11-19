package net.anweisen.utilities.common.function;

import java.util.function.ToLongFunction;
import net.anweisen.utilities.common.collection.WrappedException;

@FunctionalInterface
public interface ExceptionallyToLongFunction extends ToLongFunction {
   default long applyAsLong(Object t) {
      try {
         return this.applyExceptionally(t);
      } catch (Exception var3) {
         throw WrappedException.rethrow(var3);
      }
   }

   long applyExceptionally(Object var1) throws Exception;
}
