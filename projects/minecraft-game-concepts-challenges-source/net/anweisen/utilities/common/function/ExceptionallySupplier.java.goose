// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/anweisen/utilities/common/function/ExceptionallySupplier.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/anweisen/utilities/common/function/ExceptionallySupplier.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/anweisen/utilities/common/function/ExceptionallySupplier.java), unveraendert, als Inline-Doku ----
// package net.anweisen.utilities.common.function;
//
// import java.util.concurrent.Callable;
// import java.util.function.Supplier;
// import net.anweisen.utilities.common.collection.WrappedException;
//
// @FunctionalInterface
// public interface ExceptionallySupplier extends Supplier, Callable {
//    default Object get() {
//       try {
//          return this.getExceptionally();
//       } catch (Exception var2) {
//          throw WrappedException.rethrow(var2);
//       }
//    }
//
//    default Object call() throws Exception {
//       return this.getExceptionally();
//    }
//
//    Object getExceptionally() throws Exception;
// }
//
