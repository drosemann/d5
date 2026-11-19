// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/anweisen/utilities/common/function/ExceptionallyDoubleFunction.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/anweisen/utilities/common/function/ExceptionallyDoubleFunction.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/anweisen/utilities/common/function/ExceptionallyDoubleFunction.java), unveraendert, als Inline-Doku ----
// package net.anweisen.utilities.common.function;
//
// import java.util.function.DoubleFunction;
// import net.anweisen.utilities.common.collection.WrappedException;
//
// @FunctionalInterface
// public interface ExceptionallyDoubleFunction extends DoubleFunction {
//    default Object apply(double value) {
//       try {
//          return this.applyExceptionally(value);
//       } catch (Exception var4) {
//          throw WrappedException.rethrow(var4);
//       }
//    }
//
//    Object applyExceptionally(double var1) throws Exception;
// }
//
