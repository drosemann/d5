// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/anweisen/utilities/common/logging/handler/LogEntry.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/anweisen/utilities/common/logging/handler/LogEntry.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/anweisen/utilities/common/logging/handler/LogEntry.java), unveraendert, als Inline-Doku ----
// package net.anweisen.utilities.common.logging.handler;
//
// import java.time.Instant;
// import javax.annotation.Nonnull;
// import javax.annotation.Nullable;
// import net.anweisen.utilities.common.logging.LogLevel;
//
// public class LogEntry {
//    private Instant timestamp;
//    private String threadName;
//    private String message;
//    private LogLevel level;
//    private Throwable exception;
//
//    public LogEntry(@Nonnull Instant timestamp, @Nonnull String threadName, @Nonnull String message, @Nonnull LogLevel level, @Nullable Throwable exception) {
//       this.timestamp = timestamp;
//       this.threadName = threadName;
//       this.message = message;
//       this.level = level;
//       this.exception = exception;
//    }
//
//    @Nonnull
//    public Instant getTimestamp() {
//       return this.timestamp;
//    }
//
//    @Nonnull
//    public String getThreadName() {
//       return this.threadName;
//    }
//
//    @Nonnull
//    public String getMessage() {
//       return this.message;
//    }
//
//    @Nonnull
//    public LogLevel getLevel() {
//       return this.level;
//    }
//
//    @Nullable
//    public Throwable getException() {
//       return this.exception;
//    }
// }
//
