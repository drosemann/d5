package net.anweisen.utilities.database.access;

import java.util.Optional;
import java.util.function.BiFunction;
import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import net.anweisen.utilities.database.Database;
import net.anweisen.utilities.database.exceptions.DatabaseException;

public class DirectDatabaseAccess implements DatabaseAccess {
   protected final Database database;
   protected final DatabaseAccessConfig config;
   protected final BiFunction mapper;

   public DirectDatabaseAccess(@Nonnull Database database, @Nonnull DatabaseAccessConfig config, @Nonnull BiFunction mapper) {
      this.database = database;
      this.config = config;
      this.mapper = mapper;
   }

   @Nullable
   public Object getValue(@Nonnull String key) throws DatabaseException {
      return this.getValue0(key).orElse((Object)null);
   }

   @Nonnull
   public Object getValue(@Nonnull String key, @Nonnull Object def) throws DatabaseException {
      return this.getValue0(key).orElse(def);
   }

   @Nonnull
   public Optional getValueOptional(@Nonnull String key) throws DatabaseException {
      return this.getValue0(key);
   }

   @Nonnull
   protected Optional getValue0(@Nonnull String key) throws DatabaseException {
      return this.database.query(this.config.getTable()).where(this.config.getKeyField(), key).execute().first().map((document) -> {
         return this.mapper.apply(document, this.config.getValueField());
      });
   }

   public void setValue(@Nonnull String key, @Nullable Object value) throws DatabaseException {
      this.database.insertOrUpdate(this.config.getTable()).set(this.config.getValueField(), value).where(this.config.getKeyField(), key).execute();
   }

   @Nonnull
   public Database getDatabase() {
      return this.database;
   }

   @Nonnull
   public DatabaseAccessConfig getConfig() {
      return this.config;
   }
}
