// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/anweisen/utilities/common/logging/LogOutputStream.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/anweisen/utilities/common/logging/LogOutputStream.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/anweisen/utilities/common/logging/LogOutputStream.java), unveraendert, als Inline-Doku ----
// package net.anweisen.utilities.common.logging;
//
// import java.io.ByteArrayOutputStream;
// import java.io.IOException;
// import java.nio.charset.StandardCharsets;
// import javax.annotation.Nonnull;
//
// public class LogOutputStream extends ByteArrayOutputStream {
//    private final ILogger logger;
//    private final LogLevel level;
//
//    public LogOutputStream(@Nonnull ILogger logger, @Nonnull LogLevel level) {
//       this.logger = logger;
//       this.level = level;
//    }
//
//    public void flush() throws IOException {
//       String input = this.toString(StandardCharsets.UTF_8.name());
//       this.reset();
//       if (input != null && !input.isEmpty() && !input.equals(System.lineSeparator())) {
//          this.logger.log(this.level, input);
//       }
//
//    }
// }
//
