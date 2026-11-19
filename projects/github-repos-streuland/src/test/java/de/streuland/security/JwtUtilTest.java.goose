// Goose-Port-Spiegel von: projects/github-repos-streuland/src/test/java/de/streuland/security/JwtUtilTest.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/github-repos-streuland/src/test/java/de/streuland/security/JwtUtilTest.java");
}

// ---- Original-Code (projects/github-repos-streuland/src/test/java/de/streuland/security/JwtUtilTest.java), unveraendert, als Inline-Doku ----
// package de.streuland.security;
//
// import org.junit.jupiter.api.Test;
// import static org.junit.jupiter.api.Assertions.*;
//
// class JwtUtilTest {
//     @Test
//     void createsToken_basic_structure() {
//         String token = JwtUtil.createToken("user-1", 3600_000, "super-secret");
//         assertNotNull(token);
//         assertTrue(token.split("\\.", -1).length == 3);
//         // Ensure multiple calls produce different tokens for different subjects/secrets
//         String t2 = JwtUtil.createToken("user-2", 3600_000, "super-secret");
//         assertNotEquals(token, t2);
//     }
// }
//
