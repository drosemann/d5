package net.anweisen.utilities.common.function;

import java.util.function.Consumer;
import net.anweisen.utilities.common.collection.WrappedException;

@FunctionalInterface
public interface ExceptionallyConsumer extends Consumer {
   default void accept(Object t) {
      try {
         this.acceptExceptionally(t);
      } catch (Exception var3) {
         throw WrappedException.rethrow(var3);
      }
   }

   void acceptExceptionally(Object var1) throws Exception;
}
