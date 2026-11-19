package net.anweisen.utilities.common.function;

import java.util.function.DoubleFunction;
import net.anweisen.utilities.common.collection.WrappedException;

@FunctionalInterface
public interface ExceptionallyDoubleFunction extends DoubleFunction {
   default Object apply(double value) {
      try {
         return this.applyExceptionally(value);
      } catch (Exception var4) {
         throw WrappedException.rethrow(var4);
      }
   }

   Object applyExceptionally(double var1) throws Exception;
}
