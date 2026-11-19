// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/anweisen/utilities/common/concurrent/cache/ICache.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/anweisen/utilities/common/concurrent/cache/ICache.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/anweisen/utilities/common/concurrent/cache/ICache.java), unveraendert, als Inline-Doku ----
// package net.anweisen.utilities.common.concurrent.cache;
//
// import java.util.Map;
// import java.util.concurrent.Executors;
// import java.util.concurrent.ScheduledExecutorService;
// import java.util.function.BiConsumer;
// import javax.annotation.Nonnull;
// import net.anweisen.utilities.common.annotations.ReplaceWith;
// import net.anweisen.utilities.common.collection.NamedThreadFactory;
//
// /** @deprecated */
// @Deprecated
// @ReplaceWith("com.google.common.cache.Cache")
// public interface ICache {
//    ScheduledExecutorService EXECUTOR = Executors.newScheduledThreadPool(2, new NamedThreadFactory((threadId) -> {
//       return String.format("CacheTask-%s", threadId);
//    }));
//
//    boolean contains(@Nonnull Object var1);
//
//    int size();
//
//    default boolean isEmpty() {
//       return this.size() == 0;
//    }
//
//    void clear();
//
//    @Nonnull
//    Map values();
//
//    default void forEach(@Nonnull BiConsumer action) {
//       this.values().forEach(action);
//    }
// }
//
