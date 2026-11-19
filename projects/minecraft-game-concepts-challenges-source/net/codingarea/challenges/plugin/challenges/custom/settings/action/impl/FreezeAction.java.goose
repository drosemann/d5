// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/custom/settings/action/impl/FreezeAction.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/custom/settings/action/impl/FreezeAction.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/custom/settings/action/impl/FreezeAction.java), unveraendert, als Inline-Doku ----
// package net.codingarea.challenges.plugin.challenges.custom.settings.action.impl;
//
// import java.util.Map;
// import net.codingarea.challenges.plugin.challenges.custom.settings.action.EntityTargetAction;
// import net.codingarea.challenges.plugin.challenges.implementation.challenge.damage.FreezeChallenge;
// import net.codingarea.challenges.plugin.challenges.type.abstraction.AbstractChallenge;
// import net.codingarea.challenges.plugin.challenges.type.helper.SubSettingsHelper;
// import org.bukkit.Material;
// import org.bukkit.entity.Entity;
// import org.bukkit.entity.LivingEntity;
//
// public class FreezeAction extends EntityTargetAction {
//    FreezeChallenge instance = (FreezeChallenge)AbstractChallenge.getFirstInstance(FreezeChallenge.class);
//
//    public FreezeAction(String name) {
//       super(name, SubSettingsHelper.createEntityTargetSettingsBuilder(true));
//    }
//
//    public Material getMaterial() {
//       return Material.ICE;
//    }
//
//    public void executeFor(Entity entity, Map subActions) {
//       if (entity instanceof LivingEntity) {
//          LivingEntity livingEntity = (LivingEntity)entity;
//          this.instance.setFreeze(livingEntity, 2.0D);
//       }
//
//    }
// }
//
