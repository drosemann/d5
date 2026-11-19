// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/anweisen/utilities/common/config/Json.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/anweisen/utilities/common/config/Json.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/anweisen/utilities/common/config/Json.java), unveraendert, als Inline-Doku ----
// package net.anweisen.utilities.common.config;
//
// import java.util.function.Supplier;
// import javax.annotation.CheckReturnValue;
// import javax.annotation.Nonnull;
//
// public interface Json {
//    @Nonnull
//    String toJson();
//
//    @Nonnull
//    String toPrettyJson();
//
//    @Nonnull
//    @CheckReturnValue
//    static Json empty() {
//       return constant("{}", "{}");
//    }
//
//    @Nonnull
//    @CheckReturnValue
//    static Json supply(@Nonnull final Supplier normal, @Nonnull final Supplier pretty) {
//       return new Json() {
//          @Nonnull
//          public String toJson() {
//             return (String)normal.get();
//          }
//
//          @Nonnull
//          public String toPrettyJson() {
//             return (String)pretty.get();
//          }
//       };
//    }
//
//    @Nonnull
//    @CheckReturnValue
//    static Json constant(@Nonnull String json, @Nonnull String prettyJson) {
//       return supply(() -> {
//          return json;
//       }, () -> {
//          return prettyJson;
//       });
//    }
// }
//
