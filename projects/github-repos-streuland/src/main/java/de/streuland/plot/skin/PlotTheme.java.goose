// Goose-Port-Spiegel von: projects/github-repos-streuland/src/main/java/de/streuland/plot/skin/PlotTheme.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/github-repos-streuland/src/main/java/de/streuland/plot/skin/PlotTheme.java");
}

// ---- Original-Code (projects/github-repos-streuland/src/main/java/de/streuland/plot/skin/PlotTheme.java), unveraendert, als Inline-Doku ----
// package de.streuland.plot.skin;
//
// import org.bukkit.Particle;
//
// import java.util.Locale;
//
// public enum PlotTheme {
//     MODERN("Modern", Particle.END_ROD),
//     MEDIEVAL("Medieval", Particle.CRIT),
//     NATURE("Nature", Particle.VILLAGER_HAPPY),
//     STEAMPUNK("Steampunk", Particle.SMOKE_NORMAL);
//
//     private final String displayName;
//     private final Particle borderParticle;
//
//     PlotTheme(String displayName, Particle borderParticle) {
//         this.displayName = displayName;
//         this.borderParticle = borderParticle;
//     }
//
//     public String getDisplayName() {
//         return displayName;
//     }
//
//     public Particle getBorderParticle() {
//         return borderParticle;
//     }
//
//     public static PlotTheme fromInput(String raw) {
//         if (raw == null) {
//             return null;
//         }
//         String normalized = raw.trim().toUpperCase(Locale.ROOT);
//         for (PlotTheme value : values()) {
//             if (value.name().equals(normalized)) {
//                 return value;
//             }
//         }
//         return null;
//     }
// }
//
