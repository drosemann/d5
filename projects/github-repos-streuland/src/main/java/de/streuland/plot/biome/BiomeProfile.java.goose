// Goose-Port-Spiegel von: projects/github-repos-streuland/src/main/java/de/streuland/plot/biome/BiomeProfile.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/github-repos-streuland/src/main/java/de/streuland/plot/biome/BiomeProfile.java");
}

// ---- Original-Code (projects/github-repos-streuland/src/main/java/de/streuland/plot/biome/BiomeProfile.java), unveraendert, als Inline-Doku ----
// package de.streuland.plot.biome;
//
// import java.util.ArrayList;
// import java.util.List;
//
// /**
//  * Aggregates all effects that apply to a single biome.
//  */
// public class BiomeProfile {
//     private final String biomeKey;
//     private final List<BiomeEffect> effects;
//
//     public BiomeProfile(String biomeKey, List<BiomeEffect> effects) {
//         this.biomeKey = biomeKey;
//         this.effects = effects == null ? new ArrayList<>() : new ArrayList<>(effects);
//     }
//
//     public String getBiomeKey() {
//         return biomeKey;
//     }
//
//     public List<BiomeEffect> getEffects() {
//         return new ArrayList<>(effects);
//     }
//
//     public BiomeRuleSet getCombinedRules() {
//         return new BiomeEffectStack(effects).buildCombinedRuleSet();
//     }
// }
//
