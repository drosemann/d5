// Goose-Port-Spiegel von: projects/github-repos-streuland/src/test/java/de/streuland/warp/CooldownManagerTest.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/github-repos-streuland/src/test/java/de/streuland/warp/CooldownManagerTest.java");
}

// ---- Original-Code (projects/github-repos-streuland/src/test/java/de/streuland/warp/CooldownManagerTest.java), unveraendert, als Inline-Doku ----
// package de.streuland.warp;
//
// import org.junit.Assert;
// import org.junit.Test;
//
// import java.util.UUID;
//
// public class CooldownManagerTest {
//
//     @Test
//     public void setCooldownShouldBlockThenExpire() throws Exception {
//         CooldownManager manager = new CooldownManager();
//         UUID playerId = UUID.randomUUID();
//
//         manager.setCooldown(playerId, 100L);
//         Assert.assertTrue(manager.isOnCooldown(playerId));
//
//         Thread.sleep(150L);
//         Assert.assertFalse(manager.isOnCooldown(playerId));
//     }
// }
//
