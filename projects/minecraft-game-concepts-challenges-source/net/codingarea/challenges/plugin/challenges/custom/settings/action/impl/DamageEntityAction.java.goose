// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/custom/settings/action/impl/DamageEntityAction.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/custom/settings/action/impl/DamageEntityAction.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/custom/settings/action/impl/DamageEntityAction.java), unveraendert, als Inline-Doku ----
// package net.codingarea.challenges.plugin.challenges.custom.settings.action.impl;
//
// import java.util.Map;
// import net.codingarea.challenges.plugin.challenges.custom.settings.action.EntityTargetAction;
// import net.codingarea.challenges.plugin.challenges.custom.settings.sub.SubSettingsBuilder;
// import net.codingarea.challenges.plugin.challenges.type.helper.SubSettingsHelper;
// import net.codingarea.challenges.plugin.utils.item.DefaultItem;
// import net.codingarea.challenges.plugin.utils.item.ItemBuilder;
// import org.bukkit.Material;
// import org.bukkit.entity.Entity;
// import org.bukkit.entity.LivingEntity;
//
// public class DamageEntityAction extends EntityTargetAction {
//    public DamageEntityAction(String name) {
//       super(name, (SubSettingsBuilder)SubSettingsHelper.createEntityTargetSettingsBuilder(true).createChooseItemChild("amount").fill((builder) -> {
//          String prefix = DefaultItem.getItemPrefix();
//
//          for(int i = 1; i < 21; ++i) {
//             builder.addSetting(String.valueOf(i), (new ItemBuilder(Material.FERMENTED_SPIDER_EYE, prefix + "§7" + (float)i / 2.0F + " §c❤")).setAmount(i).build());
//          }
//
//       }));
//    }
//
//    public void executeFor(Entity entity, Map subActions) {
//       int amount = Integer.parseInt(((String[])subActions.get("amount"))[0]);
//       if (entity instanceof LivingEntity) {
//          ((LivingEntity)entity).setNoDamageTicks(0);
//          ((LivingEntity)entity).damage((double)amount);
//          ((LivingEntity)entity).setNoDamageTicks(0);
//       }
//
//    }
//
//    public Material getMaterial() {
//       return Material.FERMENTED_SPIDER_EYE;
//    }
// }
//
