package net.codingarea.challenges.plugin.management.database;

import java.lang.reflect.Constructor;
import java.util.HashMap;
import java.util.Map;
import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import lombok.Generated;
import net.anweisen.utilities.bukkit.utils.logging.Logger;
import net.anweisen.utilities.common.collection.pair.Tuple;
import net.anweisen.utilities.common.config.Document;
import net.anweisen.utilities.database.Database;
import net.anweisen.utilities.database.DatabaseConfig;
import net.anweisen.utilities.database.SQLColumn;
import net.anweisen.utilities.database.action.ExecutedQuery;
import net.anweisen.utilities.database.exceptions.DatabaseException;
import net.anweisen.utilities.database.internal.sql.abstraction.AbstractSQLDatabase;
import net.anweisen.utilities.database.internal.sql.mysql.MySQLDatabase;
import net.anweisen.utilities.database.internal.sql.sqlite.SQLiteDatabase;
import net.codingarea.challenges.plugin.Challenges;
import net.codingarea.challenges.plugin.utils.logging.ConsolePrint;
import org.bukkit.Bukkit;
import org.bukkit.plugin.PluginManager;
import org.bukkit.plugin.java.JavaPlugin;

public final class DatabaseManager {
   private final Map registry = new HashMap();
   private String type;
   private Database database;

   public DatabaseManager() {
      this.registerDatabase("sqlite", SQLiteDatabase.class, Challenges.getInstance());
      this.registerDatabase("mysql", MySQLDatabase.class, Challenges.getInstance());
   }

   public void enable() {
      Document document = Challenges.getInstance().getConfigDocument().getDocument("database");
      this.type = document.getString("type", "none").toLowerCase();
      if (!"none".equals(this.type)) {
         if ("mongodb".equals(this.type) && !this.checkDependencies("com.mongodb.client.MongoClient")) {
            ConsolePrint.noMongoDependencies();
         } else {
            try {
               Tuple pair = this.getDatabaseForName(this.type);
               if (pair == null) {
                  Logger.error("Selected illegal database type '{}'", this.type);
                  return;
               }

               JavaPlugin provider = (JavaPlugin)pair.getSecond();
               PluginManager manager = Bukkit.getPluginManager();
               if (!manager.isPluginEnabled(provider) && provider != Challenges.getInstance()) {
                  manager.enablePlugin(provider);
               }

               ClassLoader loader = provider.getClass().getClassLoader();
               String className = (String)pair.getFirst();
               Class classOfDatabase = loader.loadClass(className);
               DatabaseConfig config = new DatabaseConfig(document.getDocument(this.type));
               Constructor constructor = classOfDatabase.getDeclaredConstructor(DatabaseConfig.class);
               this.database = (Database)constructor.newInstance(config);
               this.connect();
            } catch (ClassNotFoundException var10) {
               Logger.error("Could not find class for database '{}'", this.type, var10);
            } catch (Throwable var11) {
               Logger.error("Could not create database", var11);
            }

         }
      }
   }

   private void connect() {
      Challenges.getInstance().runAsync(() -> {
         this.database.connectSafely();
         this.database.createTableSafely("challenges", new SQLColumn("uuid", "varchar", 36), new SQLColumn("name", "varchar", 16), new SQLColumn("textures", "varchar", 500), new SQLColumn("stats", "varchar", 1500), new SQLColumn("config", "varchar", 15000), new SQLColumn("custom_challenges", "text", 30000));
         this.loadMigration();
      });
   }

   private void loadMigration() {
      if (this.database instanceof AbstractSQLDatabase) {
         AbstractSQLDatabase sqlDatabase = (AbstractSQLDatabase)this.database;

         try {
            ExecutedQuery var2 = sqlDatabase.query("challenges").select("custom_challenges").execute();
         } catch (DatabaseException var5) {
            try {
               sqlDatabase.prepare("ALTER TABLE `challenges` ADD COLUMN `custom_challenges` text(60000)").execute();
               Challenges.getInstance().getLogger().info("Creating not existing column 'custom_challenges' in SQL Database");
            } catch (Exception var4) {
               Challenges.getInstance().getLogger().error("Failed to create non existing column 'custom_challenges' in SQL Database", new Object[0]);
               Challenges.getInstance().getLogger().error("", new Object[]{var4});
            }
         }
      }

   }

   public void disconnectIfConnected() {
      if (this.database != null) {
         this.database.disconnectSafely();
      }

   }

   @Nullable
   private Tuple getDatabaseForName(@Nonnull String type) throws ClassNotFoundException {
      return (Tuple)this.registry.get(type);
   }

   public void registerDatabase(@Nonnull String name, @Nonnull Class classOfDatabase, @Nonnull JavaPlugin provider) {
      this.registry.put(name, new Tuple(classOfDatabase.getName(), provider));
   }

   public boolean isConnected() {
      return this.database != null && this.database.isConnected();
   }

   public boolean isEnabled() {
      return this.database != null;
   }

   private boolean checkDependencies(@Nonnull String... classes) {
      try {
         String[] var2 = classes;
         int var3 = classes.length;

         for(int var4 = 0; var4 < var3; ++var4) {
            String name = var2[var4];
            Class.forName(name);
         }

         return true;
      } catch (Throwable var6) {
         return false;
      }
   }

   @Generated
   public String getType() {
      return this.type;
   }

   @Generated
   public Database getDatabase() {
      return this.database;
   }
}
