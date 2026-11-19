// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/anweisen/utilities/database/internal/sql/abstraction/update/SQLUpdate.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/anweisen/utilities/database/internal/sql/abstraction/update/SQLUpdate.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/anweisen/utilities/database/internal/sql/abstraction/update/SQLUpdate.java), unveraendert, als Inline-Doku ----
// package net.anweisen.utilities.database.internal.sql.abstraction.update;
//
// import java.sql.PreparedStatement;
// import java.sql.SQLException;
// import java.util.ArrayList;
// import java.util.Arrays;
// import java.util.HashMap;
// import java.util.Iterator;
// import java.util.List;
// import java.util.Map;
// import java.util.Objects;
// import java.util.Map.Entry;
// import javax.annotation.Nonnull;
// import javax.annotation.Nullable;
// import net.anweisen.utilities.database.action.DatabaseUpdate;
// import net.anweisen.utilities.database.exceptions.DatabaseException;
// import net.anweisen.utilities.database.internal.sql.abstraction.AbstractSQLDatabase;
// import net.anweisen.utilities.database.internal.sql.abstraction.where.ObjectWhere;
// import net.anweisen.utilities.database.internal.sql.abstraction.where.SQLWhere;
// import net.anweisen.utilities.database.internal.sql.abstraction.where.StringIgnoreCaseWhere;
//
// public class SQLUpdate implements DatabaseUpdate {
//    protected final AbstractSQLDatabase database;
//    protected final String table;
//    protected final Map where;
//    protected final Map values;
//
//    public SQLUpdate(@Nonnull AbstractSQLDatabase database, @Nonnull String table) {
//       this.database = database;
//       this.table = table;
//       this.where = new HashMap();
//       this.values = new HashMap();
//    }
//
//    public SQLUpdate(@Nonnull AbstractSQLDatabase database, @Nonnull String table, @Nonnull Map where, @Nonnull Map values) {
//       this.database = database;
//       this.table = table;
//       this.where = where;
//       this.values = values;
//    }
//
//    @Nonnull
//    public DatabaseUpdate where(@Nonnull String column, @Nullable Object value) {
//       this.where.put(column, new ObjectWhere(column, value, "="));
//       return this;
//    }
//
//    @Nonnull
//    public DatabaseUpdate where(@Nonnull String column, @Nullable Number value) {
//       return this.where(column, (Object)value);
//    }
//
//    @Nonnull
//    public DatabaseUpdate where(@Nonnull String column, @Nullable String value) {
//       return this.where(column, (Object)value);
//    }
//
//    @Nonnull
//    public DatabaseUpdate where(@Nonnull String column, @Nullable String value, boolean ignoreCase) {
//       if (!ignoreCase) {
//          return this.where(column, value);
//       } else if (value == null) {
//          throw new NullPointerException("Cannot use where ignore case with null value");
//       } else {
//          this.where.put(column, new StringIgnoreCaseWhere(column, value));
//          return this;
//       }
//    }
//
//    @Nonnull
//    public DatabaseUpdate whereNot(@Nonnull String column, @Nullable Object value) {
//       this.where.put(column, new ObjectWhere(column, value, "!="));
//       return this;
//    }
//
//    @Nonnull
//    public DatabaseUpdate set(@Nonnull String column, @Nullable Object value) {
//       this.values.put(column, value);
//       return this;
//    }
//
//    @Nonnull
//    protected PreparedStatement prepare() throws SQLException, DatabaseException {
//       if (this.values.isEmpty()) {
//          throw new IllegalArgumentException("Can't update nothing");
//       } else {
//          StringBuilder command = new StringBuilder();
//          List args = new ArrayList();
//          command.append("UPDATE ");
//          command.append(this.table);
//          command.append(" SET ");
//          int index = 0;
//
//          Iterator var4;
//          Entry entry;
//          for(var4 = this.values.entrySet().iterator(); var4.hasNext(); ++index) {
//             entry = (Entry)var4.next();
//             if (index > 0) {
//                command.append(", ");
//             }
//
//             command.append("`" + (String)entry.getKey() + "` = ?");
//             args.add(entry.getValue());
//          }
//
//          if (!this.where.isEmpty()) {
//             command.append(" WHERE ");
//             index = 0;
//
//             for(var4 = this.where.entrySet().iterator(); var4.hasNext(); ++index) {
//                entry = (Entry)var4.next();
//                SQLWhere where = (SQLWhere)entry.getValue();
//                if (index > 0) {
//                   command.append(" AND ");
//                }
//
//                command.append(where.getAsSQLString());
//                args.addAll(Arrays.asList(where.getArgs()));
//             }
//          }
//
//          return this.database.prepare(command.toString(), args.toArray());
//       }
//    }
//
//    public Void execute() throws DatabaseException {
//       try {
//          PreparedStatement statement = this.prepare();
//          statement.executeUpdate();
//          return null;
//       } catch (SQLException var2) {
//          throw new DatabaseException(var2);
//       }
//    }
//
//    public boolean equals(Object o) {
//       if (this == o) {
//          return true;
//       } else if (o != null && this.getClass() == o.getClass()) {
//          SQLUpdate sqlUpdate = (SQLUpdate)o;
//          return this.database.equals(sqlUpdate.database) && this.table.equals(sqlUpdate.table) && this.where.equals(sqlUpdate.where) && this.values.equals(sqlUpdate.values);
//       } else {
//          return false;
//       }
//    }
//
//    public int hashCode() {
//       return Objects.hash(new Object[]{this.database, this.table, this.where, this.values});
//    }
// }
//
