// Goose-Port-Spiegel von: projects/github-repos-streuland/src/main/java/de/streuland/bootstrap/FeatureToggles.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/github-repos-streuland/src/main/java/de/streuland/bootstrap/FeatureToggles.java");
}

// ---- Original-Code (projects/github-repos-streuland/src/main/java/de/streuland/bootstrap/FeatureToggles.java), unveraendert, als Inline-Doku ----
// package de.streuland.bootstrap;
//
// import org.bukkit.configuration.file.FileConfiguration;
//
// public record FeatureToggles(
//         boolean marketEnabled,
//         boolean approvalsEnabled,
//         boolean backupsEnabled,
//         boolean biomesEnabled,
//         boolean upgradesEnabled,
//         boolean dashboardApiEnabled
// ) {
//     public static FeatureToggles fromConfig(FileConfiguration config) {
//         return new FeatureToggles(
//                 config.getBoolean("features.market.enabled", true),
//                 config.getBoolean("features.approvals.enabled", true),
//                 config.getBoolean("features.backups.enabled", true),
//                 config.getBoolean("features.biomes.enabled", true),
//                 config.getBoolean("features.upgrades.enabled", true) && config.getBoolean("plot.upgrades.enabled", true),
//                 config.getBoolean("features.dashboard-api.enabled", true)
//         );
//     }
// }
//
