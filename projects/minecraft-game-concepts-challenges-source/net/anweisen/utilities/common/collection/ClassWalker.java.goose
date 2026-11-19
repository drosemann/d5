// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/anweisen/utilities/common/collection/ClassWalker.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/anweisen/utilities/common/collection/ClassWalker.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/anweisen/utilities/common/collection/ClassWalker.java), unveraendert, als Inline-Doku ----
// package net.anweisen.utilities.common.collection;
//
// import java.util.Deque;
// import java.util.HashSet;
// import java.util.Iterator;
// import java.util.LinkedList;
// import java.util.Set;
// import javax.annotation.Nonnull;
//
// public class ClassWalker implements Iterable {
//    protected final Class clazz;
//    protected final Class end;
//
//    protected ClassWalker(@Nonnull Class clazz) {
//       this(clazz, Object.class);
//    }
//
//    protected ClassWalker(@Nonnull Class clazz, @Nonnull Class end) {
//       this.clazz = clazz;
//       this.end = end;
//    }
//
//    public static ClassWalker range(@Nonnull Class start, @Nonnull Class end) {
//       return new ClassWalker(start, end);
//    }
//
//    public static ClassWalker walk(@Nonnull Class start) {
//       return new ClassWalker(start);
//    }
//
//    @Nonnull
//    public Iterator iterator() {
//       return new Iterator() {
//          private final Set done = new HashSet();
//          private final Deque work = new LinkedList();
//
//          {
//             this.work.addLast(ClassWalker.this.clazz);
//             this.done.add(ClassWalker.this.end);
//          }
//
//          public boolean hasNext() {
//             return !this.work.isEmpty();
//          }
//
//          public Class next() {
//             Class current = (Class)this.work.removeFirst();
//             this.done.add(current);
//             Class[] var2 = current.getInterfaces();
//             int var3 = var2.length;
//
//             for(int var4 = 0; var4 < var3; ++var4) {
//                Class parentx = var2[var4];
//                if (!this.done.contains(parentx)) {
//                   this.work.addLast(parentx);
//                }
//             }
//
//             Class parent = current.getSuperclass();
//             if (parent != null && !this.done.contains(parent)) {
//                this.work.addLast(parent);
//             }
//
//             return current;
//          }
//       };
//    }
// }
//
