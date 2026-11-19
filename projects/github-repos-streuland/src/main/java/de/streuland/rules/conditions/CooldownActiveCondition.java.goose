// Goose-Port-Spiegel von: projects/github-repos-streuland/src/main/java/de/streuland/rules/conditions/CooldownActiveCondition.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/github-repos-streuland/src/main/java/de/streuland/rules/conditions/CooldownActiveCondition.java");
}

// ---- Original-Code (projects/github-repos-streuland/src/main/java/de/streuland/rules/conditions/CooldownActiveCondition.java), unveraendert, als Inline-Doku ----
// package de.streuland.rules.conditions;
//
// import de.streuland.rules.RuleCondition;
// import de.streuland.rules.RuleContext;
//
// public class CooldownActiveCondition implements RuleCondition {
//     private final String key;
//
//     public CooldownActiveCondition(String key) {
//         this.key = key;
//     }
//
//     @Override
//     public boolean test(RuleContext context) {
//         return context.getEngine().isOnCooldown(context.getPlayer(), key);
//     }
// }
//
