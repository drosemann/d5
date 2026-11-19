package net.anweisen.utilities.common.function;

import java.util.function.BiConsumer;
import net.anweisen.utilities.common.collection.WrappedException;

@FunctionalInterface
public interface ExceptionallyBiConsumer extends BiConsumer {
   default void accept(Object t, Object u) {
      try {
         this.acceptExceptionally(t, u);
      } catch (Exception var4) {
         throw WrappedException.rethrow(var4);
      }
   }

   void acceptExceptionally(Object var1, Object var2) throws Exception;
}
