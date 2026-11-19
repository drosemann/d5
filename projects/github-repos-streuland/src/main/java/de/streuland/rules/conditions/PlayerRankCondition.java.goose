// Goose-Port-Spiegel von: projects/github-repos-streuland/src/main/java/de/streuland/rules/conditions/PlayerRankCondition.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/github-repos-streuland/src/main/java/de/streuland/rules/conditions/PlayerRankCondition.java");
}

// ---- Original-Code (projects/github-repos-streuland/src/main/java/de/streuland/rules/conditions/PlayerRankCondition.java), unveraendert, als Inline-Doku ----
// package de.streuland.rules.conditions;
//
// import de.streuland.rules.RuleCondition;
// import de.streuland.rules.RuleContext;
// import org.bukkit.entity.Player;
//
// public class PlayerRankCondition implements RuleCondition {
//     private final String permission;
//
//     public PlayerRankCondition(String permission) {
//         this.permission = permission;
//     }
//
//     @Override
//     public boolean test(RuleContext context) {
//         Player player = context.getPlayer();
//         if (player == null) {
//             return false;
//         }
//         return player.hasPermission(permission);
//     }
// }
//
