// Goose-Port-Spiegel von: projects/github-repos-streuland/src/main/java/de/streuland/rules/actions/CancelAction.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/github-repos-streuland/src/main/java/de/streuland/rules/actions/CancelAction.java");
}

// ---- Original-Code (projects/github-repos-streuland/src/main/java/de/streuland/rules/actions/CancelAction.java), unveraendert, als Inline-Doku ----
// package de.streuland.rules.actions;
//
// import de.streuland.rules.RuleAction;
// import de.streuland.rules.RuleContext;
// import org.bukkit.event.Cancellable;
//
// public class CancelAction implements RuleAction {
//     @Override
//     public void execute(RuleContext context) {
//         if (context.getEvent() instanceof Cancellable) {
//             ((Cancellable) context.getEvent()).setCancelled(true);
//         }
//     }
// }
//
