// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/anweisen/utilities/database/internal/sql/abstraction/where/ObjectWhere.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/anweisen/utilities/database/internal/sql/abstraction/where/ObjectWhere.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/anweisen/utilities/database/internal/sql/abstraction/where/ObjectWhere.java), unveraendert, als Inline-Doku ----
// package net.anweisen.utilities.database.internal.sql.abstraction.where;
//
// import java.util.Objects;
// import javax.annotation.Nonnull;
// import javax.annotation.Nullable;
//
// public class ObjectWhere implements SQLWhere {
//    protected final String column;
//    protected final Object value;
//    protected final String comparator;
//
//    public ObjectWhere(@Nonnull String column, @Nullable Object value, @Nonnull String comparator) {
//       this.column = column;
//       this.value = value;
//       this.comparator = comparator;
//    }
//
//    @Nonnull
//    public Object[] getArgs() {
//       return new Object[]{this.value};
//    }
//
//    @Nonnull
//    public String getAsSQLString() {
//       return String.format("`%s` %s ?", this.column, this.comparator);
//    }
//
//    public boolean equals(Object o) {
//       if (this == o) {
//          return true;
//       } else if (o != null && this.getClass() == o.getClass()) {
//          ObjectWhere that = (ObjectWhere)o;
//          return this.column.equals(that.column) && Objects.equals(this.value, that.value);
//       } else {
//          return false;
//       }
//    }
//
//    public int hashCode() {
//       return Objects.hash(new Object[]{this.column, this.value});
//    }
// }
//
