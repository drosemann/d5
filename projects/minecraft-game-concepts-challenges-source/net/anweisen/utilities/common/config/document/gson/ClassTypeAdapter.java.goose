// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/anweisen/utilities/common/config/document/gson/ClassTypeAdapter.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/anweisen/utilities/common/config/document/gson/ClassTypeAdapter.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/anweisen/utilities/common/config/document/gson/ClassTypeAdapter.java), unveraendert, als Inline-Doku ----
// package net.anweisen.utilities.common.config.document.gson;
//
// import com.google.gson.Gson;
// import com.google.gson.internal.bind.TypeAdapters;
// import com.google.gson.stream.JsonReader;
// import com.google.gson.stream.JsonWriter;
// import java.io.IOException;
// import javax.annotation.Nonnull;
//
// public class ClassTypeAdapter implements GsonTypeAdapter {
//    public void write(@Nonnull Gson gson, @Nonnull JsonWriter writer, @Nonnull Class object) throws IOException {
//       TypeAdapters.STRING.write(writer, object.getName());
//    }
//
//    public Class read(@Nonnull Gson gson, @Nonnull JsonReader reader) throws IOException {
//       try {
//          String value = reader.nextString();
//          return value == null ? null : Class.forName(value);
//       } catch (ClassNotFoundException var4) {
//          return null;
//       }
//    }
// }
//
