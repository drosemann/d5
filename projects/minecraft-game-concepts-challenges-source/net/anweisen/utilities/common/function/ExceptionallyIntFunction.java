package net.anweisen.utilities.common.function;

import java.util.function.IntFunction;
import net.anweisen.utilities.common.collection.WrappedException;

@FunctionalInterface
public interface ExceptionallyIntFunction extends IntFunction {
   default Object apply(int value) {
      try {
         return this.applyExceptionally(value);
      } catch (Exception var3) {
         throw WrappedException.rethrow(var3);
      }
   }

   Object applyExceptionally(int var1) throws Exception;
}
