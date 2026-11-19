// Goose-Port-Spiegel von: projects/github-repos-streuland/src/main/java/de/streuland/rules/conditions/NotCondition.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/github-repos-streuland/src/main/java/de/streuland/rules/conditions/NotCondition.java");
}

// ---- Original-Code (projects/github-repos-streuland/src/main/java/de/streuland/rules/conditions/NotCondition.java), unveraendert, als Inline-Doku ----
// package de.streuland.rules.conditions;
//
// import de.streuland.rules.RuleCondition;
// import de.streuland.rules.RuleContext;
//
// public class NotCondition implements RuleCondition {
//     private final RuleCondition condition;
//
//     public NotCondition(RuleCondition condition) {
//         this.condition = condition;
//     }
//
//     @Override
//     public boolean test(RuleContext context) {
//         return !condition.test(context);
//     }
// }
//
