// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/anweisen/utilities/common/collection/ArrayWalker.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/anweisen/utilities/common/collection/ArrayWalker.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/anweisen/utilities/common/collection/ArrayWalker.java), unveraendert, als Inline-Doku ----
// package net.anweisen.utilities.common.collection;
//
// import java.lang.reflect.Array;
// import java.util.Iterator;
// import java.util.NoSuchElementException;
// import java.util.function.Consumer;
// import javax.annotation.Nonnull;
//
// public class ArrayWalker implements Iterable {
//    protected final Object array;
//    protected final int length;
//
//    protected ArrayWalker(@Nonnull Object array) {
//       if (!array.getClass().isArray()) {
//          throw new IllegalArgumentException(array.getClass().getName() + " is not an array");
//       } else {
//          this.array = array;
//          this.length = Array.getLength(array);
//       }
//    }
//
//    public static ArrayWalker walk(@Nonnull Object array) {
//       return new ArrayWalker(array);
//    }
//
//    public static ArrayWalker walk(@Nonnull Object... array) {
//       return new ArrayWalker(array);
//    }
//
//    public Iterator iterator() {
//       return new Iterator() {
//          private int cursor = 0;
//
//          public boolean hasNext() {
//             return this.cursor < ArrayWalker.this.length;
//          }
//
//          public Object next() {
//             if (!this.hasNext()) {
//                throw new NoSuchElementException();
//             } else {
//                return Array.get(ArrayWalker.this.array, this.cursor++);
//             }
//          }
//       };
//    }
//
//    public void forEach(Consumer action) {
//       for(int i = 0; i < this.length; ++i) {
//          action.accept(Array.get(this.array, i));
//       }
//
//    }
// }
//
