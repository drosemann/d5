package net.anweisen.utilities.common.config.document.gson;

import com.google.gson.Gson;
import com.google.gson.TypeAdapter;
import com.google.gson.TypeAdapterFactory;
import com.google.gson.reflect.TypeToken;
import com.google.gson.stream.JsonReader;
import com.google.gson.stream.JsonWriter;
import java.io.IOException;
import java.util.function.Predicate;
import javax.annotation.Nonnull;

public interface GsonTypeAdapter {
   void write(@Nonnull Gson var1, @Nonnull JsonWriter var2, @Nonnull Object var3) throws IOException;

   Object read(@Nonnull Gson var1, @Nonnull JsonReader var2) throws IOException;

   default TypeAdapter toTypeAdapter(@Nonnull final Gson gson) {
      return new TypeAdapter() {
         public void write(JsonWriter writer, Object object) throws IOException {
            if (object == null) {
               writer.nullValue();
            } else {
               GsonTypeAdapter.this.write(gson, writer, object);
            }
         }

         public Object read(JsonReader reader) throws IOException {
            return GsonTypeAdapter.this.read(gson, reader);
         }
      };
   }

   @Nonnull
   static TypeAdapterFactory newTypeHierarchyFactory(@Nonnull final Class clazz, @Nonnull final GsonTypeAdapter adapter) {
      return new TypeAdapterFactory() {
         public TypeAdapter create(Gson gson, TypeToken token) {
            Class requestedType = token.getRawType();
            return !clazz.isAssignableFrom(requestedType) ? null : adapter.toTypeAdapter(gson);
         }
      };
   }

   @Nonnull
   static TypeAdapterFactory newPredictableFactory(@Nonnull final Predicate predicate, @Nonnull final GsonTypeAdapter adapter) {
      return new TypeAdapterFactory() {
         public TypeAdapter create(Gson gson, TypeToken type) {
            return predicate.test(type.getRawType()) ? adapter.toTypeAdapter(gson) : null;
         }
      };
   }
}
