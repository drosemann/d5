package net.anweisen.utilities.database;

import javax.annotation.CheckReturnValue;
import javax.annotation.Nonnull;
import net.anweisen.utilities.database.action.DatabaseCountEntries;
import net.anweisen.utilities.database.action.DatabaseDeletion;
import net.anweisen.utilities.database.action.DatabaseInsertion;
import net.anweisen.utilities.database.action.DatabaseInsertionOrUpdate;
import net.anweisen.utilities.database.action.DatabaseQuery;
import net.anweisen.utilities.database.action.DatabaseUpdate;

public interface SpecificDatabase {
   boolean isConnected();

   @Nonnull
   String getName();

   @Nonnull
   @CheckReturnValue
   DatabaseCountEntries countEntries();

   @Nonnull
   @CheckReturnValue
   DatabaseQuery query();

   @Nonnull
   @CheckReturnValue
   DatabaseUpdate update();

   @Nonnull
   @CheckReturnValue
   DatabaseInsertion insert();

   @Nonnull
   @CheckReturnValue
   DatabaseInsertionOrUpdate insertOrUpdate();

   @Nonnull
   @CheckReturnValue
   DatabaseDeletion delete();

   @Nonnull
   Database getParent();
}
