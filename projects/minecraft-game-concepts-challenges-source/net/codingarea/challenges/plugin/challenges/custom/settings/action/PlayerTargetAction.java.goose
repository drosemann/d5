// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/custom/settings/action/PlayerTargetAction.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/custom/settings/action/PlayerTargetAction.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/custom/settings/action/PlayerTargetAction.java), unveraendert, als Inline-Doku ----
// package net.codingarea.challenges.plugin.challenges.custom.settings.action;
//
// import java.util.Map;
// import java.util.function.Supplier;
// import net.codingarea.challenges.plugin.challenges.custom.settings.sub.SubSettingsBuilder;
// import org.bukkit.entity.Entity;
// import org.bukkit.entity.Player;
//
// public abstract class PlayerTargetAction extends EntityTargetAction {
//    public PlayerTargetAction(String name, SubSettingsBuilder subSettingsBuilder) {
//       super(name, subSettingsBuilder);
//    }
//
//    public PlayerTargetAction(String name) {
//       super(name);
//    }
//
//    public PlayerTargetAction(String name, Supplier builderSupplier) {
//       super(name, builderSupplier);
//    }
//
//    public void executeFor(Entity entity, Map subActions) {
//       if (entity instanceof Player || entity == null) {
//          this.executeForPlayer((Player)entity, subActions);
//       }
//
//    }
//
//    public abstract void executeForPlayer(Player var1, Map var2);
// }
//
