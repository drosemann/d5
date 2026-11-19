package net.anweisen.utilities.common.config.document.gson;

import com.google.gson.Gson;
import com.google.gson.internal.bind.TypeAdapters;
import com.google.gson.stream.JsonReader;
import com.google.gson.stream.JsonWriter;
import java.io.IOException;
import javax.annotation.Nonnull;

public class ClassTypeAdapter implements GsonTypeAdapter {
   public void write(@Nonnull Gson gson, @Nonnull JsonWriter writer, @Nonnull Class object) throws IOException {
      TypeAdapters.STRING.write(writer, object.getName());
   }

   public Class read(@Nonnull Gson gson, @Nonnull JsonReader reader) throws IOException {
      try {
         String value = reader.nextString();
         return value == null ? null : Class.forName(value);
      } catch (ClassNotFoundException var4) {
         return null;
      }
   }
}
