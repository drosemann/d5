// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/anweisen/utilities/common/function/ExceptionallyIntFunction.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/anweisen/utilities/common/function/ExceptionallyIntFunction.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/anweisen/utilities/common/function/ExceptionallyIntFunction.java), unveraendert, als Inline-Doku ----
// package net.anweisen.utilities.common.function;
//
// import java.util.function.IntFunction;
// import net.anweisen.utilities.common.collection.WrappedException;
//
// @FunctionalInterface
// public interface ExceptionallyIntFunction extends IntFunction {
//    default Object apply(int value) {
//       try {
//          return this.applyExceptionally(value);
//       } catch (Exception var3) {
//          throw WrappedException.rethrow(var3);
//       }
//    }
//
//    Object applyExceptionally(int var1) throws Exception;
// }
//
