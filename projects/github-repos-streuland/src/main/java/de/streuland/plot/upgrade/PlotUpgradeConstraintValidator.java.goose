// Goose-Port-Spiegel von: projects/github-repos-streuland/src/main/java/de/streuland/plot/upgrade/PlotUpgradeConstraintValidator.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/github-repos-streuland/src/main/java/de/streuland/plot/upgrade/PlotUpgradeConstraintValidator.java");
}

// ---- Original-Code (projects/github-repos-streuland/src/main/java/de/streuland/plot/upgrade/PlotUpgradeConstraintValidator.java), unveraendert, als Inline-Doku ----
// package de.streuland.plot.upgrade;
//
// /**
//  * Validates upgrade side effects against world/plot protection constraints.
//  */
// public interface PlotUpgradeConstraintValidator {
//     String validate(String plotId, PlotUpgradeDefinition definition, PlotProgressionState state);
//
//     static PlotUpgradeConstraintValidator allowAll() {
//         return (plotId, definition, state) -> null;
//     }
// }
//
