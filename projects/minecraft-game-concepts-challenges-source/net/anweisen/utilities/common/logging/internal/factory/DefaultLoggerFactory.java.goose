// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/anweisen/utilities/common/logging/internal/factory/DefaultLoggerFactory.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/anweisen/utilities/common/logging/internal/factory/DefaultLoggerFactory.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/anweisen/utilities/common/logging/internal/factory/DefaultLoggerFactory.java), unveraendert, als Inline-Doku ----
// package net.anweisen.utilities.common.logging.internal.factory;
//
// import java.util.Map;
// import java.util.concurrent.ConcurrentHashMap;
// import java.util.function.Function;
// import javax.annotation.CheckReturnValue;
// import javax.annotation.Nonnull;
// import javax.annotation.Nullable;
// import net.anweisen.utilities.common.logging.ILogger;
// import net.anweisen.utilities.common.logging.ILoggerFactory;
// import net.anweisen.utilities.common.logging.LogLevel;
//
// public class DefaultLoggerFactory implements ILoggerFactory {
//    protected final Map loggers = new ConcurrentHashMap();
//    protected final Function creator;
//    protected LogLevel level;
//
//    public DefaultLoggerFactory(@Nonnull Function creator) {
//       this.level = LogLevel.DEBUG;
//       this.creator = creator;
//    }
//
//    @Nonnull
//    @CheckReturnValue
//    public synchronized ILogger forName(@Nullable String name) {
//       return (ILogger)this.loggers.computeIfAbsent(name == null ? "anonymous" : name, (unused) -> {
//          return ((ILogger)this.creator.apply(name)).setMinLevel(this.level);
//       });
//    }
//
//    public void setDefaultLevel(@Nonnull LogLevel level) {
//       this.level = level;
//    }
// }
//
