// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/anweisen/utilities/database/internal/sql/mysql/list/MySQLListTables.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/anweisen/utilities/database/internal/sql/mysql/list/MySQLListTables.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/anweisen/utilities/database/internal/sql/mysql/list/MySQLListTables.java), unveraendert, als Inline-Doku ----
// package net.anweisen.utilities.database.internal.sql.mysql.list;
//
// import java.sql.PreparedStatement;
// import java.sql.ResultSet;
// import java.util.ArrayList;
// import java.util.List;
// import javax.annotation.Nonnull;
// import net.anweisen.utilities.database.action.DatabaseListTables;
// import net.anweisen.utilities.database.exceptions.DatabaseException;
// import net.anweisen.utilities.database.internal.sql.abstraction.AbstractSQLDatabase;
//
// public class MySQLListTables implements DatabaseListTables {
//    protected final AbstractSQLDatabase database;
//
//    public MySQLListTables(@Nonnull AbstractSQLDatabase database) {
//       this.database = database;
//    }
//
//    @Nonnull
//    public List execute() throws DatabaseException {
//       try {
//          PreparedStatement statement = this.database.prepare("SHOW TABLES");
//          ResultSet result = statement.executeQuery();
//          ArrayList tables = new ArrayList();
//
//          while(result.next()) {
//             tables.add(result.getString(1));
//          }
//
//          return tables;
//       } catch (Exception var4) {
//          throw new DatabaseException(var4);
//       }
//    }
// }
//
