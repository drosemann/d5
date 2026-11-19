package net.anweisen.utilities.common.function;

import java.util.function.Function;
import javax.annotation.CheckReturnValue;
import javax.annotation.Nonnull;
import net.anweisen.utilities.common.collection.WrappedException;

@FunctionalInterface
public interface ExceptionallyFunction extends Function {
   default Object apply(Object t) {
      try {
         return this.applyExceptionally(t);
      } catch (Exception var3) {
         throw WrappedException.rethrow(var3);
      }
   }

   Object applyExceptionally(Object var1) throws Exception;

   @Nonnull
   @CheckReturnValue
   static ExceptionallyFunction identity() {
      return (t) -> {
         return t;
      };
   }
}
