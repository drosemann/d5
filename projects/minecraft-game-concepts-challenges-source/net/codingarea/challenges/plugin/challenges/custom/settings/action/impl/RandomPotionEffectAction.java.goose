// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/custom/settings/action/impl/RandomPotionEffectAction.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/custom/settings/action/impl/RandomPotionEffectAction.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/custom/settings/action/impl/RandomPotionEffectAction.java), unveraendert, als Inline-Doku ----
// package net.codingarea.challenges.plugin.challenges.custom.settings.action.impl;
//
// import java.util.Map;
// import net.codingarea.challenges.plugin.challenges.custom.settings.action.EntityTargetAction;
// import net.codingarea.challenges.plugin.challenges.implementation.challenge.effect.RandomPotionEffectChallenge;
// import net.codingarea.challenges.plugin.challenges.type.helper.SubSettingsHelper;
// import org.bukkit.Material;
// import org.bukkit.entity.Entity;
// import org.bukkit.entity.LivingEntity;
// import org.bukkit.potion.PotionEffect;
// import org.bukkit.potion.PotionEffectType;
//
// public class RandomPotionEffectAction extends EntityTargetAction {
//    public RandomPotionEffectAction(String name) {
//       super(name, SubSettingsHelper.createEntityTargetSettingsBuilder(true).addChild(SubSettingsHelper.createPotionSettingsBuilder(false, true)));
//    }
//
//    public void executeFor(Entity entity, Map subActions) {
//       if (entity instanceof LivingEntity) {
//          LivingEntity livingEntity = (LivingEntity)entity;
//          PotionEffectType randomEffect = RandomPotionEffectChallenge.getNewRandomEffect(livingEntity);
//          if (randomEffect == null) {
//             return;
//          }
//
//          PotionEffect effect = randomEffect.createEffect(Integer.parseInt(((String[])subActions.get("length"))[0]) * 20 + 1, Integer.parseInt(((String[])subActions.get("amplifier"))[0]));
//          livingEntity.addPotionEffect(effect);
//       }
//
//    }
//
//    public Material getMaterial() {
//       return Material.BREWING_STAND;
//    }
// }
//
