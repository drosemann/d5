// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/anweisen/utilities/common/collection/IOUtils.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/anweisen/utilities/common/collection/IOUtils.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/anweisen/utilities/common/collection/IOUtils.java), unveraendert, als Inline-Doku ----
// package net.anweisen.utilities.common.collection;
//
// import java.io.BufferedReader;
// import java.io.IOException;
// import java.io.InputStream;
// import java.io.InputStreamReader;
// import java.net.HttpURLConnection;
// import java.net.URL;
// import java.nio.charset.StandardCharsets;
// import javax.annotation.CheckReturnValue;
// import javax.annotation.Nonnull;
//
// public final class IOUtils {
//    private IOUtils() {
//    }
//
//    public static String toString(@Nonnull String url) throws IOException {
//       return toString(new URL(url));
//    }
//
//    public static String toString(@Nonnull URL url) throws IOException {
//       InputStream input = url.openStream();
//       String string = toString(input);
//       input.close();
//       return string;
//    }
//
//    public static String toString(@Nonnull InputStream input) throws IOException {
//       StringBuilder builder = new StringBuilder();
//       BufferedReader reader = new BufferedReader(new InputStreamReader(input, StandardCharsets.UTF_8));
//       reader.lines().forEach(builder::append);
//       return builder.toString();
//    }
//
//    @Nonnull
//    @CheckReturnValue
//    public static HttpURLConnection createConnection(@Nonnull String url) throws IOException {
//       HttpURLConnection connection = (HttpURLConnection)(new URL(url)).openConnection();
//       connection.setRequestProperty("User-Agent", "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36");
//       return connection;
//    }
// }
//
