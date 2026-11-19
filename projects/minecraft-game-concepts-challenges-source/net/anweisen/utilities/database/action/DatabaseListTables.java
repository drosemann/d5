package net.anweisen.utilities.database.action;

import java.util.List;
import javax.annotation.Nonnull;
import net.anweisen.utilities.database.exceptions.DatabaseException;

public interface DatabaseListTables extends DatabaseAction {
   @Nonnull
   List execute() throws DatabaseException;
}
