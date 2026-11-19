// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/anweisen/utilities/common/logging/internal/BukkitLoggerWrapper.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/anweisen/utilities/common/logging/internal/BukkitLoggerWrapper.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/anweisen/utilities/common/logging/internal/BukkitLoggerWrapper.java), unveraendert, als Inline-Doku ----
// package net.anweisen.utilities.common.logging.internal;
//
// import java.util.logging.Level;
// import java.util.logging.Logger;
// import javax.annotation.Nonnull;
//
// public class BukkitLoggerWrapper extends JavaLoggerWrapper {
//    public BukkitLoggerWrapper(@Nonnull Logger logger) {
//       super(logger);
//    }
//
//    @Nonnull
//    protected Level mapLevel(@Nonnull Level level) {
//       return this.isLoggable(level) && level.intValue() < Level.INFO.intValue() ? Level.INFO : level;
//    }
// }
//
