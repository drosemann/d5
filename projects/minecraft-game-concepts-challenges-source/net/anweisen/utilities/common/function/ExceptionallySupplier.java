package net.anweisen.utilities.common.function;

import java.util.concurrent.Callable;
import java.util.function.Supplier;
import net.anweisen.utilities.common.collection.WrappedException;

@FunctionalInterface
public interface ExceptionallySupplier extends Supplier, Callable {
   default Object get() {
      try {
         return this.getExceptionally();
      } catch (Exception var2) {
         throw WrappedException.rethrow(var2);
      }
   }

   default Object call() throws Exception {
      return this.getExceptionally();
   }

   Object getExceptionally() throws Exception;
}
