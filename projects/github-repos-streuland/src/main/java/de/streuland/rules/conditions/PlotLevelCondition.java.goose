// Goose-Port-Spiegel von: projects/github-repos-streuland/src/main/java/de/streuland/rules/conditions/PlotLevelCondition.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/github-repos-streuland/src/main/java/de/streuland/rules/conditions/PlotLevelCondition.java");
}

// ---- Original-Code (projects/github-repos-streuland/src/main/java/de/streuland/rules/conditions/PlotLevelCondition.java), unveraendert, als Inline-Doku ----
// package de.streuland.rules.conditions;
//
// import de.streuland.rules.RuleCondition;
// import de.streuland.rules.RuleContext;
//
// public class PlotLevelCondition implements RuleCondition {
//     private final int minimumLevel;
//
//     public PlotLevelCondition(int minimumLevel) {
//         this.minimumLevel = minimumLevel;
//     }
//
//     @Override
//     public boolean test(RuleContext context) {
//         return context.getPlotLevel() >= minimumLevel;
//     }
// }
//
