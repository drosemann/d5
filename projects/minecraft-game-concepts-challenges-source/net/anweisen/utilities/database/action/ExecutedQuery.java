package net.anweisen.utilities.database.action;

import java.io.PrintStream;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashSet;
import java.util.List;
import java.util.Optional;
import java.util.Set;
import java.util.function.IntFunction;
import java.util.function.Predicate;
import java.util.stream.Stream;
import javax.annotation.CheckReturnValue;
import javax.annotation.Nonnull;
import net.anweisen.utilities.common.config.Document;
import net.anweisen.utilities.common.logging.ILogger;
import net.anweisen.utilities.common.logging.LogLevel;

public interface ExecutedQuery extends Iterable {
   @Nonnull
   @CheckReturnValue
   Optional first();

   @Nonnull
   @CheckReturnValue
   default Document firstOrEmpty() {
      return (Document)this.first().orElse(Document.empty());
   }

   @Nonnull
   @CheckReturnValue
   Optional get(int var1);

   @Nonnull
   @CheckReturnValue
   default Document getOrEmpty(int index) {
      return (Document)this.get(index).orElse(Document.empty());
   }

   @Nonnull
   @CheckReturnValue
   Stream all();

   @Nonnull
   @CheckReturnValue
   default List toList() {
      return (List)this.toCollection(ArrayList::new);
   }

   @Nonnull
   @CheckReturnValue
   default Set toSet() {
      return (Set)this.toCollection(HashSet::new);
   }

   @Nonnull
   Collection toCollection(@Nonnull Collection var1);

   @Nonnull
   @CheckReturnValue
   default Collection toCollection(@Nonnull IntFunction collectionSupplier) {
      return this.toCollection((Collection)collectionSupplier.apply(this.size()));
   }

   @Nonnull
   Document[] toArray(@Nonnull IntFunction var1);

   int index(@Nonnull Predicate var1);

   boolean isEmpty();

   boolean isSet();

   int size();

   void print(@Nonnull PrintStream var1);

   default void print(@Nonnull ILogger logger) {
      this.print(logger.asPrintStream(LogLevel.INFO));
   }

   default void print() {
      this.print(System.out);
   }
}
