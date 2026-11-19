// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/anweisen/utilities/common/collection/WrappedException.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/anweisen/utilities/common/collection/WrappedException.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/anweisen/utilities/common/collection/WrappedException.java), unveraendert, als Inline-Doku ----
// package net.anweisen.utilities.common.collection;
//
// import javax.annotation.Nonnull;
// import javax.annotation.Nullable;
//
// public class WrappedException extends RuntimeException {
//    public WrappedException(@Nullable String message, @Nonnull Throwable cause) {
//       super(message, cause);
//    }
//
//    public WrappedException(@Nonnull Throwable cause) {
//       super(cause);
//    }
//
//    @Nonnull
//    public Throwable getCause() {
//       return super.getCause();
//    }
//
//    @Nonnull
//    public static RuntimeException rethrow(@Nonnull Throwable ex) {
//       if (ex instanceof Error) {
//          throw (Error)ex;
//       } else if (ex instanceof RuntimeException) {
//          throw (RuntimeException)ex;
//       } else {
//          throw silent(ex);
//       }
//    }
//
//    @Nonnull
//    public static WrappedException silent(@Nonnull Throwable cause) {
//       return new WrappedException.SilentWrappedException(cause);
//    }
//
//    @Nonnull
//    public static WrappedException silent(@Nullable String message, @Nonnull Throwable cause) {
//       return new WrappedException.SilentWrappedException(message, cause);
//    }
//
//    public static class SilentWrappedException extends WrappedException {
//       public SilentWrappedException(@Nullable String message, @Nonnull Throwable cause) {
//          super(message, cause);
//       }
//
//       public SilentWrappedException(@Nonnull Throwable cause) {
//          super(cause);
//       }
//
//       public synchronized Throwable fillInStackTrace() {
//          return this;
//       }
//    }
// }
//
