package net.anweisen.utilities.database;

import java.util.Collections;
import java.util.List;
import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import net.anweisen.utilities.common.concurrent.task.Task;
import net.anweisen.utilities.database.action.DatabaseCountEntries;
import net.anweisen.utilities.database.action.DatabaseDeletion;
import net.anweisen.utilities.database.action.DatabaseInsertion;
import net.anweisen.utilities.database.action.DatabaseInsertionOrUpdate;
import net.anweisen.utilities.database.action.DatabaseListTables;
import net.anweisen.utilities.database.action.DatabaseQuery;
import net.anweisen.utilities.database.action.DatabaseUpdate;
import net.anweisen.utilities.database.action.ExecutedQuery;
import net.anweisen.utilities.database.exceptions.DatabaseException;
import net.anweisen.utilities.database.internal.abstraction.DefaultExecutedQuery;
import net.anweisen.utilities.database.internal.abstraction.DefaultSpecificDatabase;

public class EmptyDatabase implements Database {
   private final boolean silent;

   public EmptyDatabase(boolean silent) {
      this.silent = silent;
   }

   public boolean isSilent() {
      return this.silent;
   }

   protected void exception(@Nonnull String message) {
      throw new UnsupportedOperationException(message);
   }

   public boolean isConnected() {
      return false;
   }

   public void connect() throws DatabaseException {
      if (!this.silent) {
         this.exception("Cannot connect with a NOP Database");
      }

   }

   public boolean connectSafely() {
      return false;
   }

   public void disconnect() throws DatabaseException {
      if (!this.silent) {
         this.exception("Cannot disconnect from a NOP Database");
      }

   }

   public boolean disconnectSafely() {
      return false;
   }

   public void createTable(@Nonnull String name, @Nonnull SQLColumn... columns) throws DatabaseException {
      if (!this.silent) {
         this.exception("Cannot create tables from a NOP Database");
      }

   }

   public void createTableSafely(@Nonnull String name, @Nonnull SQLColumn... columns) {
   }

   @Nonnull
   public DatabaseListTables listTables() {
      if (!this.silent) {
         this.exception("Cannot list tables of a NOP Database");
      }

      return new EmptyDatabase.EmptyListTables();
   }

   @Nonnull
   public DatabaseCountEntries countEntries(@Nonnull String table) {
      if (!this.silent) {
         this.exception("Cannot count entries of a NOP Database");
      }

      return new EmptyDatabase.EmptyCountEntries();
   }

   @Nonnull
   public DatabaseQuery query(@Nonnull String table) {
      if (!this.silent) {
         this.exception("Cannot query in a NOP Database");
      }

      return new EmptyDatabase.EmptyDatabaseQuery();
   }

   @Nonnull
   public DatabaseUpdate update(@Nonnull String table) {
      if (!this.silent) {
         this.exception("Cannot update in a NOP Database");
      }

      return new EmptyDatabase.EmptyVoidAction();
   }

   @Nonnull
   public DatabaseInsertion insert(@Nonnull String table) {
      if (!this.silent) {
         this.exception("Cannot insert into a NOP Database");
      }

      return new EmptyDatabase.EmptyVoidAction();
   }

   @Nonnull
   public DatabaseInsertionOrUpdate insertOrUpdate(@Nonnull String table) {
      if (!this.silent) {
         this.exception("Cannot inset or update into a NOP Database");
      }

      return new EmptyDatabase.EmptyVoidAction();
   }

   @Nonnull
   public DatabaseDeletion delete(@Nonnull String table) {
      if (!this.silent) {
         this.exception("Cannot delete from a NOP Database");
      }

      return new EmptyDatabase.EmptyVoidAction();
   }

   @Nonnull
   public SpecificDatabase getSpecificDatabase(@Nonnull String name) {
      return new DefaultSpecificDatabase(this, name);
   }

   @Nonnull
   public DatabaseConfig getConfig() {
      throw new UnsupportedOperationException();
   }

   public String toString() {
      return "EmptyDatabase[silent=" + this.silent + "]";
   }

   public static class EmptyListTables implements DatabaseListTables {
      @Nonnull
      public List execute() throws DatabaseException {
         return Collections.emptyList();
      }

      @Nonnull
      public Task executeAsync() {
         return Task.completed(Collections.emptyList());
      }
   }

   public static class EmptyCountEntries implements DatabaseCountEntries {
      @Nonnull
      public Long execute() throws DatabaseException {
         return 0L;
      }

      @Nonnull
      public Task executeAsync() {
         return Task.completed(0L);
      }
   }

   public static class EmptyVoidAction implements DatabaseDeletion, DatabaseInsertion, DatabaseUpdate, DatabaseInsertionOrUpdate {
      @Nonnull
      public EmptyDatabase.EmptyVoidAction where(@Nonnull String field, @Nullable Object value) {
         return this;
      }

      @Nonnull
      public EmptyDatabase.EmptyVoidAction where(@Nonnull String field, @Nullable Number value) {
         return this;
      }

      @Nonnull
      public EmptyDatabase.EmptyVoidAction where(@Nonnull String field, @Nullable String value, boolean ignoreCase) {
         return this;
      }

      @Nonnull
      public EmptyDatabase.EmptyVoidAction where(@Nonnull String field, @Nullable String value) {
         return this;
      }

      @Nonnull
      public EmptyDatabase.EmptyVoidAction whereNot(@Nonnull String field, @Nullable Object value) {
         return this;
      }

      @Nonnull
      public EmptyDatabase.EmptyVoidAction set(@Nonnull String field, @Nullable Object value) {
         return this;
      }

      public Void execute() throws DatabaseException {
         return null;
      }

      @Nonnull
      public Task executeAsync() {
         return Task.completedVoid();
      }
   }

   public static class EmptyDatabaseQuery implements DatabaseQuery {
      @Nonnull
      public DatabaseQuery where(@Nonnull String field, @Nullable Object object) {
         return this;
      }

      @Nonnull
      public DatabaseQuery where(@Nonnull String field, @Nullable Number value) {
         return this;
      }

      @Nonnull
      public DatabaseQuery where(@Nonnull String field, @Nullable String value, boolean ignoreCase) {
         return this;
      }

      @Nonnull
      public DatabaseQuery where(@Nonnull String field, @Nullable String value) {
         return this;
      }

      @Nonnull
      public DatabaseQuery whereNot(@Nonnull String field, @Nullable Object value) {
         return this;
      }

      @Nonnull
      public DatabaseQuery select(@Nonnull String... selection) {
         return this;
      }

      @Nonnull
      public DatabaseQuery orderBy(@Nonnull String field, @Nonnull Order order) {
         return this;
      }

      @Nonnull
      public ExecutedQuery execute() throws DatabaseException {
         return new DefaultExecutedQuery(Collections.emptyList());
      }

      @Nonnull
      public Task executeAsync() {
         return Task.syncCall(this::execute);
      }
   }
}
