package net.anweisen.utilities.common.config.document.gson;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.internal.bind.TypeAdapters;
import com.google.gson.stream.JsonReader;
import com.google.gson.stream.JsonWriter;
import java.io.IOException;
import javax.annotation.Nonnull;
import net.anweisen.utilities.common.config.Document;
import net.anweisen.utilities.common.config.document.GsonDocument;

public class DocumentTypeAdapter implements GsonTypeAdapter {
   public void write(@Nonnull Gson gson, @Nonnull JsonWriter writer, @Nonnull Document document) throws IOException {
      if (document instanceof GsonDocument) {
         GsonDocument gsonDocument = (GsonDocument)document;
         TypeAdapters.JSON_ELEMENT.write(writer, gsonDocument.getJsonObject());
      } else {
         Document copiedDocument = document.copyJson();
         GsonDocument gsonDocument;
         if (copiedDocument instanceof GsonDocument) {
            gsonDocument = (GsonDocument)copiedDocument;
            TypeAdapters.JSON_ELEMENT.write(writer, gsonDocument.getJsonObject());
         } else {
            gsonDocument = new GsonDocument(document.values());
            TypeAdapters.JSON_ELEMENT.write(writer, gsonDocument.getJsonObject());
         }
      }
   }

   public Document read(@Nonnull Gson gson, @Nonnull JsonReader reader) throws IOException {
      JsonElement jsonElement = (JsonElement)TypeAdapters.JSON_ELEMENT.read(reader);
      return jsonElement != null && jsonElement.isJsonObject() ? new GsonDocument(jsonElement.getAsJsonObject()) : null;
   }
}
