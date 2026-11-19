package net.anweisen.utilities.database;

import javax.annotation.CheckReturnValue;
import javax.annotation.Nonnull;
import net.anweisen.utilities.common.concurrent.task.Task;
import net.anweisen.utilities.common.logging.ILogger;
import net.anweisen.utilities.database.action.DatabaseCountEntries;
import net.anweisen.utilities.database.action.DatabaseDeletion;
import net.anweisen.utilities.database.action.DatabaseInsertion;
import net.anweisen.utilities.database.action.DatabaseInsertionOrUpdate;
import net.anweisen.utilities.database.action.DatabaseListTables;
import net.anweisen.utilities.database.action.DatabaseQuery;
import net.anweisen.utilities.database.action.DatabaseUpdate;
import net.anweisen.utilities.database.exceptions.DatabaseException;

public interface Database {
   ILogger LOGGER = ILogger.forThisClass();

   @Nonnull
   @CheckReturnValue
   static Database empty() {
      return new EmptyDatabase(true);
   }

   @Nonnull
   @CheckReturnValue
   static Database unsupported() {
      return new EmptyDatabase(false);
   }

   boolean isConnected();

   void connect() throws DatabaseException;

   boolean connectSafely();

   void disconnect() throws DatabaseException;

   boolean disconnectSafely();

   void createTable(@Nonnull String var1, @Nonnull SQLColumn... var2) throws DatabaseException;

   void createTableSafely(@Nonnull String var1, @Nonnull SQLColumn... var2);

   @Nonnull
   default Task createTableAsync(@Nonnull String name, @Nonnull SQLColumn... columns) {
      return Task.asyncRunExceptionally(() -> {
         this.createTable(name, columns);
      });
   }

   @Nonnull
   @CheckReturnValue
   DatabaseListTables listTables();

   @Nonnull
   @CheckReturnValue
   DatabaseCountEntries countEntries(@Nonnull String var1);

   @Nonnull
   @CheckReturnValue
   DatabaseQuery query(@Nonnull String var1);

   @Nonnull
   @CheckReturnValue
   DatabaseUpdate update(@Nonnull String var1);

   @Nonnull
   @CheckReturnValue
   DatabaseInsertion insert(@Nonnull String var1);

   @Nonnull
   @CheckReturnValue
   DatabaseInsertionOrUpdate insertOrUpdate(@Nonnull String var1);

   @Nonnull
   @CheckReturnValue
   DatabaseDeletion delete(@Nonnull String var1);

   @Nonnull
   @CheckReturnValue
   SpecificDatabase getSpecificDatabase(@Nonnull String var1);

   @Nonnull
   DatabaseConfig getConfig();
}
