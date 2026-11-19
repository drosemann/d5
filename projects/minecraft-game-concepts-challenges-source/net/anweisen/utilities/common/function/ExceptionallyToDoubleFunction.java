package net.anweisen.utilities.common.function;

import java.util.function.ToDoubleFunction;
import net.anweisen.utilities.common.collection.WrappedException;

@FunctionalInterface
public interface ExceptionallyToDoubleFunction extends ToDoubleFunction {
   default double applyAsDouble(Object t) {
      try {
         return this.applyExceptionally(t);
      } catch (Exception var3) {
         throw WrappedException.rethrow(var3);
      }
   }

   double applyExceptionally(Object var1) throws Exception;
}
