package net.anweisen.utilities.common.collection;

import java.lang.reflect.Array;
import java.util.Iterator;
import java.util.NoSuchElementException;
import java.util.function.Consumer;
import javax.annotation.Nonnull;

public class ArrayWalker implements Iterable {
   protected final Object array;
   protected final int length;

   protected ArrayWalker(@Nonnull Object array) {
      if (!array.getClass().isArray()) {
         throw new IllegalArgumentException(array.getClass().getName() + " is not an array");
      } else {
         this.array = array;
         this.length = Array.getLength(array);
      }
   }

   public static ArrayWalker walk(@Nonnull Object array) {
      return new ArrayWalker(array);
   }

   public static ArrayWalker walk(@Nonnull Object... array) {
      return new ArrayWalker(array);
   }

   public Iterator iterator() {
      return new Iterator() {
         private int cursor = 0;

         public boolean hasNext() {
            return this.cursor < ArrayWalker.this.length;
         }

         public Object next() {
            if (!this.hasNext()) {
               throw new NoSuchElementException();
            } else {
               return Array.get(ArrayWalker.this.array, this.cursor++);
            }
         }
      };
   }

   public void forEach(Consumer action) {
      for(int i = 0; i < this.length; ++i) {
         action.accept(Array.get(this.array, i));
      }

   }
}
