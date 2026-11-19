package net.anweisen.utilities.common.function;

import java.util.function.BiFunction;
import net.anweisen.utilities.common.collection.WrappedException;

@FunctionalInterface
public interface ExceptionallyBiFunction extends BiFunction {
   default Object apply(Object t, Object u) {
      try {
         return this.applyExceptionally(t, u);
      } catch (Exception var4) {
         throw WrappedException.rethrow(var4);
      }
   }

   Object applyExceptionally(Object var1, Object var2) throws Exception;
}
