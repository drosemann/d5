package net.anweisen.utilities.database.access;

import java.util.Optional;
import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import net.anweisen.utilities.database.Database;
import net.anweisen.utilities.database.exceptions.DatabaseException;

public interface DatabaseAccess {
   @Nullable
   Object getValue(@Nonnull String var1) throws DatabaseException;

   @Nonnull
   Object getValue(@Nonnull String var1, @Nonnull Object var2) throws DatabaseException;

   @Nonnull
   Optional getValueOptional(@Nonnull String var1) throws DatabaseException;

   void setValue(@Nonnull String var1, @Nullable Object var2) throws DatabaseException;

   default boolean hasValue(@Nonnull String key) throws DatabaseException {
      return this.getValueOptional(key).isPresent();
   }

   @Nonnull
   Database getDatabase();

   @Nonnull
   DatabaseAccessConfig getConfig();
}
