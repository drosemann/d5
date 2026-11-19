// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/anweisen/utilities/common/collection/StringBuilderPrintWriter.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/anweisen/utilities/common/collection/StringBuilderPrintWriter.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/anweisen/utilities/common/collection/StringBuilderPrintWriter.java), unveraendert, als Inline-Doku ----
// package net.anweisen.utilities.common.collection;
//
// import java.io.PrintWriter;
// import javax.annotation.Nonnull;
//
// public class StringBuilderPrintWriter extends PrintWriter {
//    protected final StringBuilderWriter writer;
//
//    public StringBuilderPrintWriter() {
//       super(new StringBuilderWriter());
//       this.writer = (StringBuilderWriter)this.out;
//    }
//
//    @Nonnull
//    public StringBuilder getBuilder() {
//       return this.writer.getBuilder();
//    }
//
//    public String toString() {
//       return this.getBuilder().toString();
//    }
// }
//
