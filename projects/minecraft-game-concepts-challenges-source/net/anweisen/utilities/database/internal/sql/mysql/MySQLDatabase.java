package net.anweisen.utilities.database.internal.sql.mysql;

import javax.annotation.Nonnull;
import net.anweisen.utilities.database.DatabaseConfig;
import net.anweisen.utilities.database.action.DatabaseListTables;
import net.anweisen.utilities.database.internal.sql.abstraction.AbstractSQLDatabase;
import net.anweisen.utilities.database.internal.sql.mysql.list.MySQLListTables;

public class MySQLDatabase extends AbstractSQLDatabase {
   public MySQLDatabase(@Nonnull DatabaseConfig config) {
      super(config);
   }

   @Nonnull
   protected String createUrl() {
      return "jdbc:mysql://" + this.config.getHost() + (this.config.isPortSet() ? ":" + this.config.getPort() : "") + "/" + this.config.getDatabase();
   }

   @Nonnull
   public DatabaseListTables listTables() {
      return new MySQLListTables(this);
   }

   static {
      try {
         Class.forName("com.mysql.cj.jdbc.Driver");
      } catch (ClassNotFoundException var1) {
         LOGGER.error("Could not load mysql driver");
      }

   }
}
