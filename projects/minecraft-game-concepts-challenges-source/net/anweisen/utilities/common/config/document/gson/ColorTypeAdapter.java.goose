// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/anweisen/utilities/common/config/document/gson/ColorTypeAdapter.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/anweisen/utilities/common/config/document/gson/ColorTypeAdapter.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/anweisen/utilities/common/config/document/gson/ColorTypeAdapter.java), unveraendert, als Inline-Doku ----
// package net.anweisen.utilities.common.config.document.gson;
//
// import com.google.gson.Gson;
// import com.google.gson.internal.bind.TypeAdapters;
// import com.google.gson.stream.JsonReader;
// import com.google.gson.stream.JsonWriter;
// import java.awt.Color;
// import java.io.IOException;
// import javax.annotation.Nonnull;
// import net.anweisen.utilities.common.collection.Colors;
//
// public class ColorTypeAdapter implements GsonTypeAdapter {
//    public void write(@Nonnull Gson gson, @Nonnull JsonWriter writer, @Nonnull Color color) throws IOException {
//       TypeAdapters.STRING.write(writer, Colors.asHex(color));
//    }
//
//    public Color read(@Nonnull Gson gson, @Nonnull JsonReader reader) throws IOException {
//       String value = (String)TypeAdapters.STRING.read(reader);
//       return value == null ? null : Color.decode(value);
//    }
// }
//
