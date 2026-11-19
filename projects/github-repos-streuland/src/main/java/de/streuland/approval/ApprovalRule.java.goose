// Goose-Port-Spiegel von: projects/github-repos-streuland/src/main/java/de/streuland/approval/ApprovalRule.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/github-repos-streuland/src/main/java/de/streuland/approval/ApprovalRule.java");
}

// ---- Original-Code (projects/github-repos-streuland/src/main/java/de/streuland/approval/ApprovalRule.java), unveraendert, als Inline-Doku ----
// package de.streuland.approval;
//
// public enum ApprovalRule {
//     OWNER_ONLY,
//     MODERATOR_ONLY,
//     CONFIGURABLE;
//
//     public static ApprovalRule fromConfig(String value, ApprovalRule fallback) {
//         if (value == null || value.trim().isEmpty()) {
//             return fallback;
//         }
//         try {
//             return ApprovalRule.valueOf(value.trim().toUpperCase());
//         } catch (IllegalArgumentException ignored) {
//             return fallback;
//         }
//     }
// }
//
