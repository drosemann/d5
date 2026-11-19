// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/anweisen/utilities/database/internal/abstraction/DefaultExecutedQuery.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/anweisen/utilities/database/internal/abstraction/DefaultExecutedQuery.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/anweisen/utilities/database/internal/abstraction/DefaultExecutedQuery.java), unveraendert, als Inline-Doku ----
// package net.anweisen.utilities.database.internal.abstraction;
//
// import java.io.PrintStream;
// import java.util.Collection;
// import java.util.Collections;
// import java.util.Iterator;
// import java.util.List;
// import java.util.Objects;
// import java.util.Optional;
// import java.util.function.IntFunction;
// import java.util.function.Predicate;
// import java.util.stream.Stream;
// import javax.annotation.Nonnull;
// import net.anweisen.utilities.common.config.Document;
// import net.anweisen.utilities.database.action.ExecutedQuery;
//
// public class DefaultExecutedQuery implements ExecutedQuery {
//    protected final List results;
//
//    public DefaultExecutedQuery(@Nonnull List results) {
//       this.results = results;
//    }
//
//    @Nonnull
//    public Optional first() {
//       return this.results.isEmpty() ? Optional.empty() : Optional.ofNullable(this.results.get(0));
//    }
//
//    @Nonnull
//    public Optional get(int index) {
//       return index >= this.results.size() ? Optional.empty() : Optional.ofNullable(this.results.get(index));
//    }
//
//    @Nonnull
//    public Stream all() {
//       return this.results.stream();
//    }
//
//    @Nonnull
//    public Collection toCollection(@Nonnull Collection collection) {
//       collection.addAll(this.results);
//       return collection;
//    }
//
//    @Nonnull
//    public Document[] toArray(@Nonnull IntFunction arraySupplier) {
//       Document[] array = (Document[])arraySupplier.apply(this.size());
//
//       for(int i = 0; i < this.size(); ++i) {
//          array[i] = (Document)this.results.get(i);
//       }
//
//       return array;
//    }
//
//    public int index(@Nonnull Predicate filter) {
//       int index = 0;
//
//       for(Iterator var3 = this.results.iterator(); var3.hasNext(); ++index) {
//          Document result = (Document)var3.next();
//          if (filter.test(result)) {
//             return index;
//          }
//       }
//
//       return -1;
//    }
//
//    public boolean isEmpty() {
//       return this.results.isEmpty();
//    }
//
//    public boolean isSet() {
//       return !this.results.isEmpty();
//    }
//
//    public int size() {
//       return this.results.size();
//    }
//
//    public void print(@Nonnull PrintStream out) {
//       if (this.results.isEmpty()) {
//          out.println("<Empty ExecutedQuery Result>");
//       } else {
//          int index = 0;
//
//          for(Iterator var3 = this.results.iterator(); var3.hasNext(); ++index) {
//             Document result = (Document)var3.next();
//             out.print(index + " | ");
//             result.forEach((key, value) -> {
//                out.print(key + " = '" + value + "' ");
//             });
//             out.println();
//          }
//
//       }
//    }
//
//    public Iterator iterator() {
//       return Collections.unmodifiableCollection(this.results).iterator();
//    }
//
//    public String toString() {
//       return "ExecutedQuery[size=" + this.size() + "]";
//    }
//
//    public boolean equals(Object o) {
//       if (this == o) {
//          return true;
//       } else if (o != null && this.getClass() == o.getClass()) {
//          DefaultExecutedQuery documents = (DefaultExecutedQuery)o;
//          return Objects.equals(this.results, documents.results);
//       } else {
//          return false;
//       }
//    }
//
//    public int hashCode() {
//       return Objects.hash(new Object[]{this.results});
//    }
// }
//
