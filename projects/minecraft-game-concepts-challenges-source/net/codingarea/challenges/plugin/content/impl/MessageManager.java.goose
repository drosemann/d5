// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/content/impl/MessageManager.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/content/impl/MessageManager.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/content/impl/MessageManager.java), unveraendert, als Inline-Doku ----
// package net.codingarea.challenges.plugin.content.impl;
//
// import java.util.Map;
// import java.util.concurrent.ConcurrentHashMap;
// import javax.annotation.CheckReturnValue;
// import javax.annotation.Nonnull;
// import net.codingarea.challenges.plugin.content.Message;
//
// public final class MessageManager {
//    private static final Map cache = new ConcurrentHashMap();
//
//    private MessageManager() {
//    }
//
//    @Nonnull
//    @CheckReturnValue
//    public static Message getOrCreateMessage(@Nonnull String name) {
//       return (Message)cache.computeIfAbsent(name, (key) -> {
//          return new MessageImpl(key);
//       });
//    }
//
//    @CheckReturnValue
//    public static boolean hasMessageInCache(@Nonnull String name) {
//       return cache.containsKey(name);
//    }
//
//    public static int getMessageCountCached() {
//       return cache.size();
//    }
// }
//
