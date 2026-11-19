package net.anweisen.utilities.common.function;

import java.util.concurrent.Callable;
import net.anweisen.utilities.common.collection.WrappedException;

@FunctionalInterface
public interface ExceptionallyRunnable extends Runnable, Callable {
   default void run() {
      try {
         this.runExceptionally();
      } catch (Exception var2) {
         throw WrappedException.rethrow(var2);
      }
   }

   default Void call() throws Exception {
      this.runExceptionally();
      return null;
   }

   void runExceptionally() throws Exception;
}
