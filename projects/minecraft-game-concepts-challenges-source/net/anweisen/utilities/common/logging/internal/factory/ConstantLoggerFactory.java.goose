// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/anweisen/utilities/common/logging/internal/factory/ConstantLoggerFactory.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/anweisen/utilities/common/logging/internal/factory/ConstantLoggerFactory.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/anweisen/utilities/common/logging/internal/factory/ConstantLoggerFactory.java), unveraendert, als Inline-Doku ----
// package net.anweisen.utilities.common.logging.internal.factory;
//
// import javax.annotation.Nonnull;
// import javax.annotation.Nullable;
// import net.anweisen.utilities.common.logging.ILogger;
// import net.anweisen.utilities.common.logging.ILoggerFactory;
// import net.anweisen.utilities.common.logging.LogLevel;
//
// public class ConstantLoggerFactory implements ILoggerFactory {
//    protected final ILogger logger;
//
//    public ConstantLoggerFactory(@Nonnull ILogger logger) {
//       this.logger = logger;
//    }
//
//    @Nonnull
//    public ILogger forName(@Nullable String name) {
//       return this.logger;
//    }
//
//    public void setDefaultLevel(@Nonnull LogLevel level) {
//       this.logger.setMinLevel(level);
//    }
// }
//
