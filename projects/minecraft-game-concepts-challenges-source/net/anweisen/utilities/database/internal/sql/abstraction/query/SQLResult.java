package net.anweisen.utilities.database.internal.sql.abstraction.query;

import java.util.Map;
import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import net.anweisen.utilities.common.config.Document;
import net.anweisen.utilities.common.config.document.EmptyDocument;
import net.anweisen.utilities.common.config.document.GsonDocument;
import net.anweisen.utilities.common.config.document.MapDocument;

public final class SQLResult extends MapDocument {
   public SQLResult(@Nonnull Map values) {
      super(values);
   }

   @Nonnull
   public Document getDocument0(@Nonnull String path, @Nonnull Document root, @Nullable Document parent) {
      try {
         return (new GsonDocument(this.getString(path), this, this)).readonly();
      } catch (Exception var5) {
         return new EmptyDocument(this, (Document)null);
      }
   }

   public boolean isReadonly() {
      return true;
   }
}
