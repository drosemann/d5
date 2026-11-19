// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/anweisen/utilities/common/collection/StringBuilderWriter.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/anweisen/utilities/common/collection/StringBuilderWriter.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/anweisen/utilities/common/collection/StringBuilderWriter.java), unveraendert, als Inline-Doku ----
// package net.anweisen.utilities.common.collection;
//
// import java.io.Writer;
// import javax.annotation.Nonnull;
// import javax.annotation.Nullable;
//
// public class StringBuilderWriter extends Writer {
//    private final StringBuilder builder;
//
//    public StringBuilderWriter() {
//       this.builder = new StringBuilder();
//    }
//
//    public StringBuilderWriter(int capacity) {
//       this.builder = new StringBuilder(capacity);
//    }
//
//    public StringBuilderWriter(@Nullable StringBuilder builder) {
//       this.builder = builder != null ? builder : new StringBuilder();
//    }
//
//    public Writer append(char value) {
//       this.builder.append(value);
//       return this;
//    }
//
//    public Writer append(@Nullable CharSequence value) {
//       this.builder.append(value);
//       return this;
//    }
//
//    public Writer append(@Nullable CharSequence value, int start, int end) {
//       this.builder.append(value, start, end);
//       return this;
//    }
//
//    public void close() {
//    }
//
//    public void flush() {
//    }
//
//    public void write(@Nonnull String value) {
//       this.builder.append(value);
//    }
//
//    public void write(@Nullable char[] value, int offset, int length) {
//       if (value != null) {
//          this.builder.append(value, offset, length);
//       }
//
//    }
//
//    @Nonnull
//    public StringBuilder getBuilder() {
//       return this.builder;
//    }
//
//    public String toString() {
//       return this.builder.toString();
//    }
// }
//
