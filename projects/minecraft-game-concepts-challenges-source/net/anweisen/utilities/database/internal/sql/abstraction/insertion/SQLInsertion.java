package net.anweisen.utilities.database.internal.sql.abstraction.insertion;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import net.anweisen.utilities.database.action.DatabaseInsertion;
import net.anweisen.utilities.database.exceptions.DatabaseException;
import net.anweisen.utilities.database.internal.sql.abstraction.AbstractSQLDatabase;

public class SQLInsertion implements DatabaseInsertion {
   protected final Map values;
   protected final AbstractSQLDatabase database;
   protected final String table;

   public SQLInsertion(@Nonnull AbstractSQLDatabase database, @Nonnull String table) {
      this.database = database;
      this.table = table;
      this.values = new HashMap();
   }

   public SQLInsertion(@Nonnull AbstractSQLDatabase database, @Nonnull String table, @Nonnull Map values) {
      this.database = database;
      this.table = table;
      this.values = values;
   }

   @Nonnull
   public DatabaseInsertion set(@Nonnull String field, @Nullable Object value) {
      this.values.put(field, value);
      return this;
   }

   @Nonnull
   protected PreparedStatement prepare() throws SQLException, DatabaseException {
      if (this.values.isEmpty()) {
         throw new IllegalArgumentException("Cannot insert nothing");
      } else {
         StringBuilder command = new StringBuilder();
         List args = new ArrayList(this.values.size());
         command.append("INSERT INTO ");
         command.append(this.table);
         command.append(" (");
         int index = 0;

         Iterator var4;
         for(var4 = this.values.keySet().iterator(); var4.hasNext(); ++index) {
            String column = (String)var4.next();
            if (index > 0) {
               command.append(", ");
            }

            command.append(column);
         }

         command.append(") VALUES (");
         index = 0;

         for(var4 = this.values.values().iterator(); var4.hasNext(); ++index) {
            Object value = var4.next();
            if (index > 0) {
               command.append(", ");
            }

            command.append("?");
            args.add(value);
         }

         command.append(")");
         return this.database.prepare(command.toString(), args.toArray());
      }
   }

   public Void execute() throws DatabaseException {
      try {
         PreparedStatement statement = this.prepare();
         statement.execute();
         return null;
      } catch (Exception var2) {
         throw new DatabaseException(var2);
      }
   }

   public boolean equals(Object o) {
      if (this == o) {
         return true;
      } else if (o != null && this.getClass() == o.getClass()) {
         SQLInsertion that = (SQLInsertion)o;
         return this.values.equals(that.values) && this.database.equals(that.database) && this.table.equals(that.table);
      } else {
         return false;
      }
   }

   public int hashCode() {
      return Objects.hash(new Object[]{this.values, this.database, this.table});
   }
}
