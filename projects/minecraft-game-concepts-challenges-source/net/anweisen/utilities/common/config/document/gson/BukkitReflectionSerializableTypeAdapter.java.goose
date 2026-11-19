// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/anweisen/utilities/common/config/document/gson/BukkitReflectionSerializableTypeAdapter.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/anweisen/utilities/common/config/document/gson/BukkitReflectionSerializableTypeAdapter.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/anweisen/utilities/common/config/document/gson/BukkitReflectionSerializableTypeAdapter.java), unveraendert, als Inline-Doku ----
// package net.anweisen.utilities.common.config.document.gson;
//
// import com.google.gson.Gson;
// import com.google.gson.JsonElement;
// import com.google.gson.JsonObject;
// import com.google.gson.internal.bind.TypeAdapters;
// import com.google.gson.stream.JsonReader;
// import com.google.gson.stream.JsonWriter;
// import java.io.IOException;
// import java.util.Map;
// import java.util.Optional;
// import javax.annotation.Nonnull;
// import net.anweisen.utilities.common.misc.BukkitReflectionSerializationUtils;
// import net.anweisen.utilities.common.misc.GsonUtils;
//
// public class BukkitReflectionSerializableTypeAdapter implements GsonTypeAdapter {
//    public static final String ALTERNATE_KEY = "classOfType";
//    public static final String KEY = "==";
//
//    public void write(@Nonnull Gson gson, @Nonnull JsonWriter writer, @Nonnull Object object) throws IOException {
//       Map map = BukkitReflectionSerializationUtils.serializeObject(object);
//       if (map != null) {
//          JsonObject json = new JsonObject();
//          json.addProperty("==", BukkitReflectionSerializationUtils.getSerializationName(object.getClass()));
//          GsonUtils.setDocumentProperties(gson, json, map);
//          TypeAdapters.JSON_ELEMENT.write(writer, json);
//       }
//    }
//
//    public Object read(@Nonnull Gson gson, @Nonnull JsonReader reader) throws IOException {
//       JsonElement element = (JsonElement)TypeAdapters.JSON_ELEMENT.read(reader);
//       if (element != null && element.isJsonObject()) {
//          JsonObject json = element.getAsJsonObject();
//          String classOfType = (String)Optional.ofNullable(this.findClassContainer(json)).filter(JsonElement::isJsonPrimitive).map(JsonElement::getAsString).orElse((Object)null);
//          Class clazz = null;
//
//          try {
//             clazz = Class.forName(classOfType);
//          } catch (NullPointerException | ClassNotFoundException var8) {
//          }
//
//          Map map = GsonUtils.convertJsonObjectToMap(json);
//          return BukkitReflectionSerializationUtils.deserializeObject(map, clazz);
//       } else {
//          return null;
//       }
//    }
//
//    private JsonElement findClassContainer(@Nonnull JsonObject json) {
//       return json.has("classOfType") ? json.get("classOfType") : json.get("==");
//    }
// }
//
