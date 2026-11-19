package net.anweisen.utilities.database.internal.sql.abstraction;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Map;
import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import net.anweisen.utilities.common.config.Json;
import net.anweisen.utilities.common.config.document.GsonDocument;
import net.anweisen.utilities.common.misc.GsonUtils;

public final class SQLHelper {
   private SQLHelper() {
   }

   public static void fillParams(@Nonnull PreparedStatement statement, @Nonnull Object... params) throws SQLException {
      for(int i = 0; i < params.length; ++i) {
         Object param = serializeObject(params[i]);
         statement.setObject(i + 1, param);
      }

   }

   @Nullable
   public static Object serializeObject(@Nullable Object object) {
      if (object == null) {
         return null;
      } else if (object instanceof Number) {
         return object;
      } else if (object instanceof Boolean) {
         return object;
      } else if (object instanceof Enum) {
         return ((Enum)object).name();
      } else if (object instanceof Json) {
         return ((Json)object).toJson();
      } else if (object instanceof Map) {
         return (new GsonDocument((Map)object)).toJson();
      } else if (object instanceof Iterable) {
         return GsonUtils.convertIterableToJsonArray(GsonDocument.GSON, (Iterable)object).toString();
      } else {
         return object.getClass().isArray() ? GsonUtils.convertArrayToJsonArray(GsonDocument.GSON, object).toString() : object.toString();
      }
   }
}
