// Goose-Port-Spiegel von: projects/github-repos-streuland/src/main/java/de/streuland/plot/biome/BiomeEffect.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/github-repos-streuland/src/main/java/de/streuland/plot/biome/BiomeEffect.java");
}

// ---- Original-Code (projects/github-repos-streuland/src/main/java/de/streuland/plot/biome/BiomeEffect.java), unveraendert, als Inline-Doku ----
// package de.streuland.plot.biome;
//
// /**
//  * A single stackable biome effect entry.
//  */
// public class BiomeEffect {
//     private final String id;
//     private final boolean enabled;
//     private final int priority;
//     private final BiomeRuleSet ruleSet;
//
//     public BiomeEffect(String id, boolean enabled, int priority, BiomeRuleSet ruleSet) {
//         this.id = id;
//         this.enabled = enabled;
//         this.priority = priority;
//         this.ruleSet = ruleSet == null ? new BiomeRuleSet(null, null, null) : ruleSet;
//     }
//
//     public String getId() {
//         return id;
//     }
//
//     public boolean isEnabled() {
//         return enabled;
//     }
//
//     public int getPriority() {
//         return priority;
//     }
//
//     public BiomeRuleSet getRuleSet() {
//         return ruleSet;
//     }
// }
//
