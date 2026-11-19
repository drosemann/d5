// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/anweisen/utilities/common/function/ExceptionallyFunction.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/anweisen/utilities/common/function/ExceptionallyFunction.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/anweisen/utilities/common/function/ExceptionallyFunction.java), unveraendert, als Inline-Doku ----
// package net.anweisen.utilities.common.function;
//
// import java.util.function.Function;
// import javax.annotation.CheckReturnValue;
// import javax.annotation.Nonnull;
// import net.anweisen.utilities.common.collection.WrappedException;
//
// @FunctionalInterface
// public interface ExceptionallyFunction extends Function {
//    default Object apply(Object t) {
//       try {
//          return this.applyExceptionally(t);
//       } catch (Exception var3) {
//          throw WrappedException.rethrow(var3);
//       }
//    }
//
//    Object applyExceptionally(Object var1) throws Exception;
//
//    @Nonnull
//    @CheckReturnValue
//    static ExceptionallyFunction identity() {
//       return (t) -> {
//          return t;
//       };
//    }
// }
//
