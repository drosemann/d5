// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/anweisen/utilities/database/internal/sql/abstraction/deletion/SQLDeletion.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/anweisen/utilities/database/internal/sql/abstraction/deletion/SQLDeletion.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/anweisen/utilities/database/internal/sql/abstraction/deletion/SQLDeletion.java), unveraendert, als Inline-Doku ----
// package net.anweisen.utilities.database.internal.sql.abstraction.deletion;
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
// import net.anweisen.utilities.database.action.DatabaseDeletion;
// import net.anweisen.utilities.database.exceptions.DatabaseException;
// import net.anweisen.utilities.database.internal.sql.abstraction.AbstractSQLDatabase;
// import net.anweisen.utilities.database.internal.sql.abstraction.where.ObjectWhere;
// import net.anweisen.utilities.database.internal.sql.abstraction.where.SQLWhere;
// import net.anweisen.utilities.database.internal.sql.abstraction.where.StringIgnoreCaseWhere;
//
// public class SQLDeletion implements DatabaseDeletion {
//    protected final AbstractSQLDatabase database;
//    protected final String table;
//    protected final Map where = new HashMap();
//
//    public SQLDeletion(@Nonnull AbstractSQLDatabase database, @Nonnull String table) {
//       this.database = database;
//       this.table = table;
//    }
//
//    @Nonnull
//    public DatabaseDeletion where(@Nonnull String column, @Nullable Object value) {
//       this.where.put(column, new ObjectWhere(column, value, "="));
//       return this;
//    }
//
//    @Nonnull
//    public DatabaseDeletion where(@Nonnull String column, @Nullable Number value) {
//       return this.where(column, (Object)value);
//    }
//
//    @Nonnull
//    public DatabaseDeletion where(@Nonnull String column, @Nullable String value) {
//       return this.where(column, (Object)value);
//    }
//
//    @Nonnull
//    public DatabaseDeletion where(@Nonnull String column, @Nullable String value, boolean ignoreCase) {
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
//    public DatabaseDeletion whereNot(@Nonnull String column, @Nullable Object value) {
//       this.where.put(column, new ObjectWhere(column, value, "!="));
//       return this;
//    }
//
//    @Nonnull
//    protected PreparedStatement prepare() throws SQLException, DatabaseException {
//       StringBuilder command = new StringBuilder();
//       List args = new ArrayList();
//       command.append("DELETE FROM ");
//       command.append(this.table);
//       if (!this.where.isEmpty()) {
//          command.append(" WHERE ");
//          int index = 0;
//
//          for(Iterator var4 = this.where.entrySet().iterator(); var4.hasNext(); ++index) {
//             Entry entry = (Entry)var4.next();
//             SQLWhere where = (SQLWhere)entry.getValue();
//             if (index > 0) {
//                command.append(" AND ");
//             }
//
//             command.append(where.getAsSQLString());
//             args.addAll(Arrays.asList(where.getArgs()));
//          }
//       }
//
//       return this.database.prepare(command.toString(), args.toArray());
//    }
//
//    public Void execute() throws DatabaseException {
//       try {
//          PreparedStatement statement = this.prepare();
//          statement.execute();
//          return null;
//       } catch (Exception var2) {
//          throw new DatabaseException(var2);
//       }
//    }
//
//    public boolean equals(Object o) {
//       if (this == o) {
//          return true;
//       } else if (o != null && this.getClass() == o.getClass()) {
//          SQLDeletion that = (SQLDeletion)o;
//          return this.database.equals(that.database) && this.table.equals(that.table) && this.where.equals(that.where);
//       } else {
//          return false;
//       }
//    }
//
//    public int hashCode() {
//       return Objects.hash(new Object[]{this.database, this.table, this.where});
//    }
// }
//
