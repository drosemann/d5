// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/anweisen/utilities/common/logging/handler/HandledAsyncLogger.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/anweisen/utilities/common/logging/handler/HandledAsyncLogger.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/anweisen/utilities/common/logging/handler/HandledAsyncLogger.java), unveraendert, als Inline-Doku ----
// package net.anweisen.utilities.common.logging.handler;
//
// import java.util.concurrent.Executor;
// import java.util.concurrent.Executors;
// import javax.annotation.Nonnull;
// import net.anweisen.utilities.common.collection.NamedThreadFactory;
// import net.anweisen.utilities.common.logging.LogLevel;
//
// public class HandledAsyncLogger extends HandledLogger {
//    protected final Executor executor = Executors.newSingleThreadExecutor(new NamedThreadFactory("AsyncLogTask"));
//
//    public HandledAsyncLogger(@Nonnull LogLevel initialLevel) {
//       super(initialLevel);
//    }
//
//    protected void log0(@Nonnull LogEntry entry) {
//       this.executor.execute(() -> {
//          this.logNow(entry);
//       });
//    }
// }
//
