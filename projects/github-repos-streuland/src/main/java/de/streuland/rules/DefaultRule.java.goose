// Goose-Port-Spiegel von: projects/github-repos-streuland/src/main/java/de/streuland/rules/DefaultRule.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/github-repos-streuland/src/main/java/de/streuland/rules/DefaultRule.java");
}

// ---- Original-Code (projects/github-repos-streuland/src/main/java/de/streuland/rules/DefaultRule.java), unveraendert, als Inline-Doku ----
// package de.streuland.rules;
//
// import java.util.ArrayList;
// import java.util.List;
//
// public class DefaultRule implements Rule {
//     private final String name;
//     private final RuleTrigger trigger;
//     private final List<RuleCondition> conditions;
//     private final List<RuleAction> actions;
//
//     public DefaultRule(String name, RuleTrigger trigger, List<RuleCondition> conditions, List<RuleAction> actions) {
//         this.name = name;
//         this.trigger = trigger;
//         this.conditions = new ArrayList<>(conditions);
//         this.actions = new ArrayList<>(actions);
//     }
//
//     @Override
//     public String getName() {
//         return name;
//     }
//
//     @Override
//     public RuleTrigger getTrigger() {
//         return trigger;
//     }
//
//     @Override
//     public boolean matches(RuleContext context) {
//         for (RuleCondition condition : conditions) {
//             if (!condition.test(context)) {
//                 return false;
//             }
//         }
//         return true;
//     }
//
//     @Override
//     public void execute(RuleContext context) {
//         for (RuleAction action : actions) {
//             action.execute(context);
//         }
//     }
// }
//
