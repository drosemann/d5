// Goose-Port-Spiegel von: projects/github-repos-streuland/src/main/java/de/streuland/rules/actions/CooldownAction.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/github-repos-streuland/src/main/java/de/streuland/rules/actions/CooldownAction.java");
}

// ---- Original-Code (projects/github-repos-streuland/src/main/java/de/streuland/rules/actions/CooldownAction.java), unveraendert, als Inline-Doku ----
// package de.streuland.rules.actions;
//
// import de.streuland.rules.RuleAction;
// import de.streuland.rules.RuleContext;
//
// public class CooldownAction implements RuleAction {
//     private final String key;
//     private final long durationMillis;
//
//     public CooldownAction(String key, long durationMillis) {
//         this.key = key;
//         this.durationMillis = durationMillis;
//     }
//
//     @Override
//     public void execute(RuleContext context) {
//         context.getEngine().setCooldown(context.getPlayer(), key, durationMillis);
//     }
// }
//
