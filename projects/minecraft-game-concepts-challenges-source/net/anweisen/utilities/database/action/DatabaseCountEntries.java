package net.anweisen.utilities.database.action;

import javax.annotation.Nonnegative;
import javax.annotation.Nonnull;
import net.anweisen.utilities.database.exceptions.DatabaseException;

public interface DatabaseCountEntries extends DatabaseAction {
   @Nonnull
   @Nonnegative
   Long execute() throws DatabaseException;
}
