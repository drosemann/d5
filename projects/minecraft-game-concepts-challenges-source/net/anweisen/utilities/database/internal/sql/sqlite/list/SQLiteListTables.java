package net.anweisen.utilities.database.internal.sql.sqlite.list;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import javax.annotation.Nonnull;
import net.anweisen.utilities.database.action.DatabaseListTables;
import net.anweisen.utilities.database.exceptions.DatabaseException;
import net.anweisen.utilities.database.internal.sql.abstraction.AbstractSQLDatabase;

public class SQLiteListTables implements DatabaseListTables {
   protected final AbstractSQLDatabase database;

   public SQLiteListTables(@Nonnull AbstractSQLDatabase database) {
      this.database = database;
   }

   @Nonnull
   public List execute() throws DatabaseException {
      try {
         PreparedStatement statement = this.database.prepare("SELECT name FROM sqlite_master WHERE type = 'table'");
         ResultSet result = statement.executeQuery();
         ArrayList tables = new ArrayList();

         while(result.next()) {
            tables.add(result.getString(1));
         }

         return tables;
      } catch (Exception var4) {
         throw new DatabaseException(var4);
      }
   }
}
