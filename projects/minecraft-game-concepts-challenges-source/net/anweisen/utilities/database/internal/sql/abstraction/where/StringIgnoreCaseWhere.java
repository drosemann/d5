package net.anweisen.utilities.database.internal.sql.abstraction.where;

import java.util.Objects;
import javax.annotation.Nonnull;

public class StringIgnoreCaseWhere implements SQLWhere {
   protected final String column;
   protected final String value;

   public StringIgnoreCaseWhere(@Nonnull String column, @Nonnull String value) {
      this.column = column;
      this.value = value;
   }

   @Nonnull
   public Object[] getArgs() {
      return new Object[]{this.value};
   }

   @Nonnull
   public String getAsSQLString() {
      return String.format("LOWER(%s) = LOWER(?)", this.column);
   }

   public boolean equals(Object o) {
      if (this == o) {
         return true;
      } else if (o != null && this.getClass() == o.getClass()) {
         StringIgnoreCaseWhere that = (StringIgnoreCaseWhere)o;
         return this.column.equals(that.column) && this.value.equals(that.value);
      } else {
         return false;
      }
   }

   public int hashCode() {
      return Objects.hash(new Object[]{this.column, this.value});
   }
}
