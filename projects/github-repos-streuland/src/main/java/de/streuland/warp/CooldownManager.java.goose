// Goose-Port-Spiegel von: projects/github-repos-streuland/src/main/java/de/streuland/warp/CooldownManager.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/github-repos-streuland/src/main/java/de/streuland/warp/CooldownManager.java");
}

// ---- Original-Code (projects/github-repos-streuland/src/main/java/de/streuland/warp/CooldownManager.java), unveraendert, als Inline-Doku ----
// package de.streuland.warp;
//
// import java.util.Map;
// import java.util.UUID;
// import java.util.concurrent.ConcurrentHashMap;
//
// public class CooldownManager {
//     private final Map<UUID, Long> cooldowns = new ConcurrentHashMap<>();
//
//     public boolean isOnCooldown(UUID playerId) {
//         return getRemainingMillis(playerId) > 0;
//     }
//
//     public long getRemainingMillis(UUID playerId) {
//         long expiresAt = cooldowns.getOrDefault(playerId, 0L);
//         return Math.max(0L, expiresAt - System.currentTimeMillis());
//     }
//
//     public void setCooldown(UUID playerId, long cooldownMillis) {
//         cooldowns.put(playerId, System.currentTimeMillis() + Math.max(0L, cooldownMillis));
//     }
// }
//
