// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/custom/settings/action/impl/KillEntityAction.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/custom/settings/action/impl/KillEntityAction.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/custom/settings/action/impl/KillEntityAction.java), unveraendert, als Inline-Doku ----
// package net.codingarea.challenges.plugin.challenges.custom.settings.action.impl;
//
// import java.util.Map;
// import net.codingarea.challenges.plugin.challenges.custom.settings.action.EntityTargetAction;
// import net.codingarea.challenges.plugin.challenges.type.helper.ChallengeHelper;
// import net.codingarea.challenges.plugin.challenges.type.helper.SubSettingsHelper;
// import org.bukkit.Material;
// import org.bukkit.entity.Entity;
// import org.bukkit.entity.LivingEntity;
// import org.bukkit.entity.Player;
//
// public class KillEntityAction extends EntityTargetAction {
//    public KillEntityAction(String name) {
//       super(name, SubSettingsHelper.createEntityTargetSettingsBuilder(true));
//    }
//
//    public void executeFor(Entity entity, Map subActions) {
//       if (entity instanceof Player) {
//          ChallengeHelper.kill((Player)entity);
//       } else if (entity instanceof LivingEntity) {
//          ((LivingEntity)entity).damage(((LivingEntity)entity).getHealth());
//       }
//
//    }
//
//    public Material getMaterial() {
//       return Material.DIAMOND_SWORD;
//    }
// }
//
