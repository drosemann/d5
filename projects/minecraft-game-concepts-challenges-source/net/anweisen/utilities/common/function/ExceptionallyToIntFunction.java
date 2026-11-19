package net.anweisen.utilities.common.function;

import java.util.function.ToIntFunction;
import net.anweisen.utilities.common.collection.WrappedException;

@FunctionalInterface
public interface ExceptionallyToIntFunction extends ToIntFunction {
   default int applyAsInt(Object t) {
      try {
         return this.applyExceptionally(t);
      } catch (Exception var3) {
         throw WrappedException.rethrow(var3);
      }
   }

   int applyExceptionally(Object var1) throws Exception;
}
