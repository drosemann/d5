package net.anweisen.utilities.common.function;

import java.util.function.LongFunction;
import net.anweisen.utilities.common.collection.WrappedException;

@FunctionalInterface
public interface ExceptionallyLongFunction extends LongFunction {
   default Object apply(long value) {
      try {
         return this.applyExceptionally(value);
      } catch (Exception var4) {
         throw WrappedException.rethrow(var4);
      }
   }

   Object applyExceptionally(long var1) throws Exception;
}
