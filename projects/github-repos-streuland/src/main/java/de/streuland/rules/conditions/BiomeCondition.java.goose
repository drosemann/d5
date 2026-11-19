// Goose-Port-Spiegel von: projects/github-repos-streuland/src/main/java/de/streuland/rules/conditions/BiomeCondition.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/github-repos-streuland/src/main/java/de/streuland/rules/conditions/BiomeCondition.java");
}

// ---- Original-Code (projects/github-repos-streuland/src/main/java/de/streuland/rules/conditions/BiomeCondition.java), unveraendert, als Inline-Doku ----
// package de.streuland.rules.conditions;
//
// import de.streuland.rules.RuleCondition;
// import de.streuland.rules.RuleContext;
// import org.bukkit.block.Biome;
//
// import java.util.Set;
//
// public class BiomeCondition implements RuleCondition {
//     private final Set<Biome> allowedBiomes;
//
//     public BiomeCondition(Set<Biome> allowedBiomes) {
//         this.allowedBiomes = allowedBiomes;
//     }
//
//     @Override
//     public boolean test(RuleContext context) {
//         if (context.getBiome() == null) {
//             return false;
//         }
//         return allowedBiomes.contains(context.getBiome());
//     }
// }
//
